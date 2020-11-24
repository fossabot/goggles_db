# frozen_string_literal: true

module GogglesDb
  #
  # = MeetingProgram model
  #
  #   - version:  7.034
  #   - author:   Steve A.
  #
  class MeetingProgram < ApplicationRecord
    self.table_name = 'meeting_programs'

    belongs_to :meeting_event
    belongs_to :category_type
    belongs_to :gender_type
    validates_associated :meeting_event
    validates_associated :category_type
    validates_associated :gender_type

    belongs_to :pool_type # Redundant association link to pool_types for commodity
    belongs_to :time_standard, optional: true

    has_one :meeting_session, through: :meeting_event
    has_one :event_type,      through: :meeting_event
    has_one :stroke_type,     through: :event_type
    has_one :meeting,         through: :meeting_session
    has_one :season,          through: :meeting_session
    has_one :season_type,     through: :meeting_session

    # has_many :meeting_individual_results, dependent: :delete_all
    # has_many :meeting_relay_results,      dependent: :delete_all
    # has_many :meeting_relay_swimmers,     through: :meeting_relay_results
    # has_many :meeting_entries, dependent: :delete_all

    # Laps are usually added before the actual final result is available:
    has_many :laps, -> { joins(:laps).order('laps.length_in_meters') }

    validates :event_order, presence: { length: { within: 1..3, allow_nil: false } }

    delegate :scheduled_date, to: :meeting_session, prefix: false, allow_nil: false
    delegate :relay?,         to: :meeting_event,   prefix: false, allow_nil: false

    # Sorting scopes:
    def self.by_event_type(dir = 'ASC')
      sorting_order = if dir == 'ASC'
                        'event_types.code ASC, meeting_programs.event_order ASC'
                      else
                        'event_types.code DESC, meeting_programs.event_order DESC'
                      end
      joins(:event_type).includes(:event_type).order(sorting_order)
    end

    def self.by_category_type(dir = 'ASC')
      sorting_order = if dir == 'ASC'
                        'category_types.code ASC, meeting_programs.event_order ASC'
                      else
                        'category_types.code DESC, meeting_programs.event_order DESC'
                      end
      joins(:category_type).includes(:category_type).order(sorting_order)
    end

    # Filtering scopes:
    scope :relays,      -> { joins(:event_type).includes(:event_type).where('event_types.is_a_relay' => true) }
    scope :individuals, -> { joins(:event_type).includes(:event_type).where('event_types.is_a_relay' => false) }
    #-- ------------------------------------------------------------------------
    #++

    # Override: includes *most* of its 1st-level associations into the typical to_json output.
    def to_json(options = nil)
      attributes.merge(
        'meeting_event' => meeting_event.attributes,
        'category_type' => category_type.attributes,
        'gender_type' => gender_type.attributes,
        'event_type' => event_type.attributes,
        'stroke_type' => stroke_type.attributes,
        'pool_type' => pool_type.attributes
      ).to_json(options)
    end
  end
end
