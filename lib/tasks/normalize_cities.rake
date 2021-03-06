# frozen_string_literal: true

require 'goggles_db'
require 'cities'

namespace :normalize do
  desc 'Normalizes all country & city names comparing them with the values supplied by the coutries & cities gems'
  task cities: :environment do
    puts "\r\n*** Countries + Cities normalization ***"
    puts "\r\n--> Normalizing Country codes and names..."
    normalize_country_strings
    puts "\r\n--> Normalizing City names..."
    normalize_city_names

    puts "\r\nDone."
  end
  #-- -------------------------------------------------------------------------
  #++

  # Scans the cities table for un-normalized country names & codes and updates them
  # with their ISO3166 country name & code.
  # Outputs a list of problematic names that may have to be processed manually.
  #
  # == Note:
  # Although using the City model helper methods this could have been sorted out inside
  # the same single ISO-attribute update loop (see 'normalize_city_names'), by doing it
  # this way allows for a more fine-grained debug of un-normalized data.
  def normalize_country_strings
    unknown_names = []
    updated_rows  = 0
    # ANSI color codes: 31m = red; 32m = green; 33m = yellow; 34m = blue; 37m = white

    GogglesDb::City.select(:country, :country_code)
                   .distinct("CONCAT(country, ' ', country_code)")
                   .each do |city_model|
      command = GogglesDb::CmdFindIsoCountry.call(city_model.country, city_model.country_code)

      if command.success?
        updated_rows += update_country_strings(command.result, city_model)
      else
        $stdout.write("'#{city_model.country}' (#{city_model.country_code}) \033[1;33;31m× UNKNOWN ×\033[0m\r\n")
        unknown_names << city_model.country
      end
    end

    puts "\r\nTotal row updates: #{updated_rows}"
    $stdout.write("\033[1;33;31mTO BE FIXED:\033[0m\r\n'#{unknown_names.join("\r\n")}'\r\n") unless unknown_names.empty?
  end
  #-- -------------------------------------------------------------------------
  #++

  # Updates the city_model with an 'update_all', but only if the update is needed.
  # Returns the number of updated rows
  #
  def update_country_strings(iso_country, city_model)
    $stdout.write("\033[1;33;32mFOUND\033[0m → #{iso_country.unofficial_names.first} (#{iso_country.alpha2})\r\n")
    # Update needed?
    return 0 unless iso_country.unofficial_names.first != city_model.country ||
                    iso_country.alpha2 != city_model.country_code

    $stdout.write("        overwriting '#{city_model.country}' (#{city_model.country_code})\r\n")
    GogglesDb::City.where(country: city_model.country)
                   .or(GogglesDb::City.where(country_code: city_model.country_code))
                   .update_all(
                     country: iso_country.unofficial_names.first,
                     country_code: iso_country.alpha2
                   )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Scans the cities table for non-standard names, then updates them with their
  # expected "standard" name.
  # Outputs a list of problematic names that may have to be re-processed or fixed manually.
  def normalize_city_names
    unknown_names = []
    updated_rows  = 0

    GogglesDb::City.find_each do |city_model|
      iso_country, iso_city = city_model.to_iso

      # Skip iteration if the country cannot be found:
      if iso_country.nil?
        $stdout.write("'#{city_model.name}' \033[1;33;31m× UNKNOWN COUNTRY ×\033[0m (#{city_model.country})\r\n")
        unknown_names << city_model.name
        next
      end

      if iso_city.nil?
        $stdout.write("'#{city_model.name}' \033[1;33;31m× UNKNOWN ×\033[0m\r\n")
        unknown_names << city_model.name
      else
        updated_rows += update_city_name(iso_city, city_model)
      end
    end

    puts "\r\nTotal row updates: #{updated_rows}"
    $stdout.write("\033[1;33;31mTO BE FIXED:\033[0m\r\n'#{unknown_names.join("\r\n")}'\r\n") unless unknown_names.empty?
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns +true+ if the attribute value differs between the two
  def compare_vs_attribute(iso_attributes, city_model, attr_name)
    result = iso_attributes[attr_name.to_s].to_s != city_model.send(attr_name).to_s
    $stdout.write("        #{result ? "\033[1;33;31m×\033[0m" : "\033[1;33;32m=\033[0m"} #{attr_name}: '#{iso_attributes[attr_name.to_s]}'\r\n")
    result
  end

  # Updates the city_model with an 'update', but only if the update is actually needed.
  # Returns 1 if the update was successful; 0 otherwise.
  #
  def update_city_name(iso_city, city_model)
    $stdout.write("\033[1;33;32mFOUND\033[0m → #{iso_city.name}\r\n")
    iso_attributes = city_model.iso_attributes # Prepare actual values
    # Update needed? (We won't touch the country fields here)
    return 0 unless compare_vs_attribute(iso_attributes, city_model, 'name') ||
                    compare_vs_attribute(iso_attributes, city_model, 'latitude') ||
                    compare_vs_attribute(iso_attributes, city_model, 'longitude') ||
                    compare_vs_attribute(iso_attributes, city_model, 'area')

    city_model.transaction do
      if city_model.update(
        name: iso_attributes['name'],
        latitude: iso_attributes['latitude'],
        longitude: iso_attributes['longitude'],
        area: iso_attributes['area']
      )
        $stdout.write("        updated '#{city_model.name}', area: '#{city_model.area}' lat: '#{city_model.latitude}' long: '#{city_model.longitude}'\r\n")
        return 1
      else
        $stdout.write("        \033[1;33;31m× VALIDATION FAILED City ID #{city_model.id} ×\033[0m '#{city_model.name}'\r\n")
      end
    rescue ActiveRecord::RecordNotUnique
      $stdout.write("        \033[1;33;31m× DUPLICATE City ID #{city_model.id} ×\033[0m '#{city_model.name}'\r\n")
    end
    0
  end
  #-- -------------------------------------------------------------------------
  #++
end
