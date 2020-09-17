# frozen_string_literal: true

module GogglesDb
  #
  # = GenderType model
  #
  # This entity is assumed to be pre-seeded on the database.
  # Due to the low number of entity values, all rows have been Memoized.
  #
  #   - version:  7.000
  #   - author:   Steve A.
  #
  class FederationType < ApplicationRecord
    self.table_name = 'federation_types'

    # Unique IDs used inside the DB, the description will be retrieved using I18n.t
    FIN_ID = 1
    CSI_ID = 2
    UISP_ID = 3
    LEN_ID = 4
    FINA_ID = 5

    validates :code, presence: { length: { within: 1..4 }, allow_nil: false },
                     uniqueness: { case_sensitive: true, message: :already_exists }
    validates :description, length: { maximum: 100 }
    validates :short_name, length: { maximum: 10 }

    # Dynamically define class methods for each of the memoized value rows:
    %w[fin csi uisp len fina].each do |word|
      class_eval do
        # Define a Memoized instance using the finder with the corresponding constant ID value:
        instance_variable_set("@#{word}", find_by(id: "#{name}::#{word.upcase}_ID".constantize))
        # Dynamically define an helper class method for the memoized value row:
        define_singleton_method(word.to_sym) do
          validate_cached_rows
          instance_variable_get("@#{word}")
        end
      end
    end

    # Checks the existance of all the required value rows; raises an error for any missing row.
    def self.validate_cached_rows
      %w[fin csi uisp len fina].each do |word|
        code_value = "#{name}::#{word.upcase}_ID".constantize
        raise "Missing required #{name} row with code #{code_value}" unless instance_variable_get("@#{word}").present?
      end
    end
  end
end
