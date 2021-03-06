# frozen_string_literal: true

module GogglesDb
  #
  # = Swimmer model
  #
  #   - version:  7.054
  #   - author:   Steve A.
  #
  class Swimmer < ApplicationRecord
    self.table_name = 'swimmers'

    # Actual User row associated with this Swimmer. It can be nil.
    belongs_to :associated_user, class_name: 'User', optional: true,
                                 foreign_key: 'associated_user_id'

    belongs_to            :gender_type
    validates_associated  :gender_type

    validates :complete_name, presence: { length: { within: 1..100, allow_nil: false } }
    validates :last_name, length: { maximum: 50 }
    validates :first_name, length: { maximum: 50 }
    validates :year_of_birth, presence: { length: { within: 2..4, allow_nil: false } }, numericality: true
    validates :year_guessed, inclusion: { in: [true, false] }

    delegate :male?, :female?, :intermixed?, to: :gender_type

    # Filtering scopes:
    scope :for_name, ->(name) { where('MATCH(swimmers.last_name, swimmers.first_name, swimmers.complete_name) AGAINST(?)', name) }
    #-- ------------------------------------------------------------------------
    #++

    # Override: include the minimum required 1st-level associations.
    #
    def minimal_attributes
      super.merge(minimal_associations)
    end

    # Override: includes all 1st-level associations into the typical to_json output.
    def to_json(options = nil)
      attributes.merge(minimal_associations).to_json(options)
    end

    private

    # Returns the "minimum required" hash of associations.
    def minimal_associations
      {
        'associated_user' => associated_user&.minimal_attributes,
        'gender_type' => gender_type.lookup_attributes
      }
    end
  end
end
