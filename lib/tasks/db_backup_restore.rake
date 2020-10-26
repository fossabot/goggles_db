# frozen_string_literal: true

require 'date'
require 'rubygems'
require 'find'
require 'fileutils'

#
# = Local Deployment helper tasks
#
#   - (p) FASAR Software 2007-2020
#   - for Goggles framework vers.: 7.00
#   - author: Steve A.
#
#   (ASSUMES TO BE rakeD inside Rails.root)
#
#-- ---------------------------------------------------------------------------
#++

# DB Dumps have the same name as current environment and are considered as "current":
DB_DUMP_DIR = Rails.root.join('db', 'dump').freeze unless defined? DB_DUMP_DIR
# (add here any other needed folder as additional constants)
#-- ---------------------------------------------------------------------------
#++

# [Steve, 20130808] The following will remove the task db:test:prepare
# to avoid having to wait each time a test is run for the db test to reset
# itself:
Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end
Rake.application.remove_task 'db:reset'
Rake.application.remove_task 'db:test:prepare'

desc 'Check and creates missing directories needed by the structure assumed by some of the maintenance tasks.'
task(:check_needed_dirs) do
  [
    DB_DUMP_DIR
    # (add here any other needed folder)
  ].each do |folder|
    puts "Checking existance of #{folder} (and creating it if missing)..."
    FileUtils.mkdir_p(folder) unless File.directory?(folder)
  end
  puts "\r\n"
end
#-- ---------------------------------------------------------------------------
#++

namespace :db do
  namespace :test do
    task :prepare do |t|
      # (Rewrite the task to *not* do anything you don't want)
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  desc <<~DESC
      This is an override of the standard Rake db:reset task.
    It actually DROPS the Database recreating it using a mysql shell command.

    Options: [Rails.env=#{Rails.env}]

  DESC
  task :reset do |_t|
    puts '*** Task: Custom DB RESET ***'
    rails_config  = Rails.configuration # Prepare & check configuration:
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    # Display some info:
    puts "DB name:      #{db_name}"
    puts "DB user:      #{db_user}"
    puts "\r\nDropping DB..."
    sh "mysql --host=#{db_host} --user=#{db_user} --password=\"#{db_pwd}\" --execute=\"drop database if exists #{db_name}\""
    puts "\r\nRecreating DB..."
    sh "mysql --host=#{db_host} --user=#{db_user} --password=\"#{db_pwd}\" --execute=\"create database #{db_name}\""
  end
  #-- -------------------------------------------------------------------------
  #++

  desc <<~DESC
      "db:dump" creates a bzipped MySQL dump of the whole DB for the current environment that
    can be easily rebuildd to any other database name using "db:rebuild".

    The result file does not contain any DB namespaces, nor any "CREATE database" or "USE"
    statements, thus it can be freely executed for any empty destination database, with any
    given database name of choice.

    The file is stored as:

      - 'db/dump/#{Rails.env}.sql.bz2'

      This can be kept inside the source tree of the main app repository to be used for quick
      recovery of the any of the environment DB, using "db:rebuild".

    Options: [Rails.env=#{Rails.env}]

  DESC
  task(dump: [:check_needed_dirs]) do
    puts '*** Task: DB dump ***'
    # Prepare & check configuration:
    rails_config  = Rails.configuration
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    db_dump(db_host, db_user, db_pwd, db_name, Rails.env)
  end

  # Performs the actual operations required for a DB dump update given the specified
  # parameters.
  #
  # Note that the dump takes the name of the Environment configuration section.
  #
  def db_dump(db_host, db_user, db_pwd, db_name, dump_basename)
    puts "\r\nUpdating recovery dump '#{dump_basename}' (from #{db_name} DB)..."
    # Display some info:
    puts "DB name: #{db_name}"
    puts "DB user: #{db_user}"
    file_name = File.join(DB_DUMP_DIR, "#{dump_basename}.sql")
    puts "\r\nProcessing #{db_name} => #{file_name} ...\r\n"

    # Begin forced single-transaction:
    File.open(file_name, 'a+') do |f|
      f.puts "-- #{file_name}\r\n"
      f.puts 'SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";'
      f.puts 'SET AUTOCOMMIT = 0;'
      f.puts 'START TRANSACTION;'
      f.puts "\r\n--\r\n"
    end

    # To disable extended inserts, add this option: --skip-extended-insert
    # (The Resulting SQL file will be much longer, though -- but the bzipped
    #  version can result more compressed due to the replicated strings, and it is
    #  indeed much more readable and editable...)
    cmd = "mysqldump --host=#{db_host} -u #{db_user} --password=\"#{db_pwd}\" --add-drop-table --triggers" \
          " --routines --single-transaction #{db_name} >> #{file_name}"
    sh cmd

    # End forced single-transaction:
    File.open(file_name, 'a+') do |f|
      f.puts "\r\n--\r\n"
      f.puts 'COMMIT;'
    end
    puts "\r\nRecovery dump created. Compressing as bz2..."
    sh "bzip2 #{file_name}"

    puts "\r\nDone.\r\n\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++

  desc <<~DESC
      Recreates the current DB from a recovery dump created with db:dump.

    Options: [Rails.env=#{Rails.env}]
             [from=dump_base_name|<#{Rails.env}>]
             [to='production'|'development'|'test']

      - from: when not specified, the source dump base name will be the same of the
            current Rails.env

      - to: when not specified, the destination database will be the same of the
            current Rails.env

  DESC
  task(rebuild: [:check_needed_dirs]) do
    puts '*** Task: DB rebuild ***'
    # Prepare & check configuration:
    rails_config  = Rails.configuration
    db_name       = rails_config.database_configuration[Rails.env]['database']
    db_user       = rails_config.database_configuration[Rails.env]['username']
    db_pwd        = rails_config.database_configuration[Rails.env]['password']
    db_host       = rails_config.database_configuration[Rails.env]['host']
    dump_basename = ENV.include?('from') ? ENV['from'] : Rails.env
    output_db     = ENV.include?('to')   ? rails_config.database_configuration[ENV['to']]['database'] : db_name
    file_ext      = '.sql.bz2'

    rebuild(dump_basename, output_db, db_host, db_user, db_pwd, file_ext)
  end

  # Performs the actual sequence of operations required by a single db:rebuild
  # task, given the specified parameters.
  #
  # The source_basename comes from the name of the file dump.
  # Note that the dump takes the name of the Environment configuration section.
  #
  def rebuild(source_basename, output_db, db_host, db_user, db_pwd, file_ext = '.sql.bz2')
    puts "\r\nRebuilding..."
    puts "DB name: #{source_basename} (dump) => #{output_db} (DEST)"
    puts "DB user: #{db_user}"

    file_name = File.join(DB_DUMP_DIR, "#{source_basename}#{file_ext}")
    sql_file_name = File.join('tmp', "#{source_basename}.sql")

    puts "\r\nUncompressing dump file '#{file_name}' => '#{sql_file_name}'..."
    sh "bunzip2 -ck #{file_name} > #{sql_file_name}"

    puts "\r\nDropping destination DB '#{output_db}'..."
    sh "mysql --host=#{db_host} --user=#{db_user} --password=\"#{db_pwd}\" --execute=\"drop database if exists #{output_db}\""
    puts "\r\nRecreating destination DB..."
    sh "mysql --host=#{db_host} --user=#{db_user} --password=\"#{db_pwd}\" --execute=\"create database #{output_db}\""

    puts "\r\nExecuting '#{file_name}' on #{output_db}..."
    sh "mysql --host=#{db_host} --user=#{db_user} --password=\"#{db_pwd}\" --database=#{output_db} --execute=\"\\. #{sql_file_name}\""
    puts "Deleting uncompressed file '#{sql_file_name}'..."
    FileUtils.rm(sql_file_name)

    puts "Rebuild from dump for '#{source_basename}', done.\r\n\r\n"
  end
  #-- -------------------------------------------------------------------------
  #++
end
