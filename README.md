# GogglesDb README

[![Build Status](https://semaphoreci.com/api/v1/steveoro/goggles_db/branches/master/shields_badge.svg)](https://semaphoreci.com/steveoro/goggles_db)
[![Build Status](https://steveoro.semaphoreci.com/badges/goggles_db/branches/master.svg)](https://steveoro.semaphoreci.com/projects/goggles_db)
[![Maintainability](https://api.codeclimate.com/v1/badges/ba9e005076a6aa97f788/maintainability)](https://codeclimate.com/github/steveoro/goggles_db/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/ba9e005076a6aa97f788/test_coverage)](https://codeclimate.com/github/steveoro/goggles_db/test_coverage)
[![codecov](https://codecov.io/gh/steveoro/goggles_db/branch/master/graph/badge.svg?token=G4E7NVC4T4)](undefined)
[![Coverage Status](https://coveralls.io/repos/github/steveoro/goggles_db/badge.svg?branch=master)](https://coveralls.io/github/steveoro/goggles_db?branch=master)
![](https://api.kindspeech.org/v1/badge)


DB structure and base Rails models for the Goggles Framework applications.


## Wiki & HOW-TOs

Official Framework Wiki, [here](https://github.com/steveoro/goggles_db/wiki) (v. 7+)


## Requires

- Ruby 2.6+
- Rails 6+
- MySql



## Installation

Just clone the repository on `localhost` and run `bundle install`.

To recreate the DB, see [Database setup](#database-setup) below.


## Usage

Add this line to your application's Gemfile:

```ruby
gem 'goggles_db', git: 'https://github.com/steveoro/goggles_db'
```

This gem uses [Git LFS](https://git-lfs.github.com/) to store the `test` DB dump file. When updating the gem from inside any sub-project that uses it, you'll need to skip the DB dump file download with:

```bash
$> GIT_LFS_SKIP_SMUDGE=1 bundle update goggles_db
```

The Engine will add a bunch of rake tasks to the application, among which:

- `db:dump` & `db:rebuild` will assume the existence of an SQL dump file named after the target environment (format `<ENVIRONMENT_NAME>.sql.bz2`); this gem includes an anonymized `test` dump under the dummy app folder that mounts this namespaced engine, inside the `spec/dummy/db/dump` folder. Check out [Database setup](#database-setup) below.

- `check_needed_dirs` will be invoked internally by these tasks to ensure the existence of any other required folder.



## How to run the test suite

For local testing & development, just keep your [Guard](https://github.com/guard/guard) friend running in background from a dedicated console:

```bash
$> guard
```

Whenever you want to run the full test suite just hit Enter on the Guard console.

As of Rails 6.0.3, most probably there are issues with the combined usage of Guard & Spring together with the new memory management modes in Rails during the Brakeman checks. Sometimes class reloading is prevented and the `brakeman` plugin for Guard fails to actually notice changes in the source code. The checks get a re-run but the result doesn't change (if you have actually fixed an issue). It could be just a simple mis-configuration or a peculiar use-case in this namespaced Engine: we'll see how this goes as we'll update to future versions of Rails.

In any case, although the Guard plugin for Brakeman runs correctly at start, it's always better to re-run a `brakeman` full check before pushing the changes to the repository:

```bash
$> bundle exec brakeman -Aq
```

_Please, make sure committing & pushing any changes to the repo is done only when the test suite is locally :green_heart:._



## Database setup

Make sure you have a running MariaDB server & client installation + development packages in order to rebuild the drivers during `bundle install`.

To speed up the build process, the test suite uses pre-existing anonymized data seeds with **transactional fixtures** and _does not clear the DB before each run_.

For this reason, you'll need a proper DB dump from which restore the DB for either running tests or for using a localhost server during development.


### DB management tasks

The tasks added by GogglesDb deal mostly with its DB setup and management. (When called from the project root, in the context of an unmounted Engine, you need to prefix the tasks with `app:`)

- (`app:`)`db:dump`: dumps current Rails environment DB inside the `db/dump` folder. When using the unmounted Engine by itself, the target context of the dumps is the default test-`dummy` app subfolder. The result of this task will be an un-namespaced, compressed, SQL file dump: no database name prefixes on any DDL statements and no `USE` or `CREATE database` statements in it.

- (`app:`)`db:rebuild`: restores any valid `*.sql.bz2` dump file found stored in `db/dump`. Again, provided the dump image is structured as above: without any DB namespaces in it (as those created by `db:dump` typically are).

To rebuild the `test` database before running the suite (using default parameter values given by the current environment) just run:

```bash
$> RAILS_ENV=test rails app:db:rebuild
```


_Any other target DB_ can be prepared for local usage by copying a source dump to another target.

For example, if you need to work with the `development` environment, you can easily prepare it with the anonymized `test` image:

```bash
$> rails app:db:rebuild from=test to=development
```

(The execution will take some time depending of the dump size: sit back and relax...)


### From scratch

A brand new DB image (for any environment) can be built by force-loading the SQL structure file after resetting the current DB and then running the factories for each entity you may need:

```bash
$> rails db:reset
$> rails structure:load
```

Then, you'll have to use the Factories (`spec/factories`) to create each individual fixture.

To mount the factories from the Rails console:

```ruby
 > FactoryBot.definition_file_paths << "#{GogglesDb::Engine.root}/spec/factories"
 > FactoryBot.reload
```

To create a brand new random user (for example):

```ruby
 > FactoryBot.create(:user)
```


* * *


## Contributing
1. Clone the project
2. Make a pull request based on the branch most relevant to you
3. Await the PR's review by the maintainers


## License
The gem is available as open source under the terms of the [LGPL-3.0 License](https://opensource.org/licenses/LGPL-3.0).


## Supporting

Check out the "sponsor" button at the top of the page.
