# frozen_string_literal: true

module GogglesDb
  #
  # = MeetingEvent model
  #
  #   - version:  7.034
  #   - author:   Steve A.
  #
  class MeetingEvent < ApplicationRecord
    self.table_name = 'meeting_events'

    belongs_to :meeting_session
    belongs_to :event_type
    belongs_to :heat_type
    validates_associated :meeting_session
    validates_associated :event_type
    validates_associated :heat_type

    # [Steve A. 20170718]
    # Please note that due to how the complete callback chain is currently defined
    # throughtout the entities, adding here the association:
    #
    #    has_one :meeting, through: :meeting_session"
    #
    # invalidates "dependent" actions called on top of it, like "meeting#destroy"
    # due to validation failures.
    # (Either we remove the meeting_session validation above, or we're happy with avoiding
    #  adding the association helper method.)

    has_one :season,       through: :meeting_session
    has_one :season_type,  through: :meeting_session
    has_one :stroke_type,  through: :event_type

    has_many :meeting_programs, dependent: :delete_all
    has_many :meeting_individual_results, through: :meeting_programs
    # has_many :meeting_relay_results,      through: :meeting_programs
    has_many :category_types,             through: :meeting_programs

    # has_many :meeting_entries,            through: :meeting_programs

    # has_many :meeting_event_reservations, dependent: :delete_all
    # has_many :meeting_relay_reservations, dependent: :delete_all

    validates :event_order, presence: { length: { within: 1..3, allow_nil: false } }

    delegate :scheduled_date, to: :meeting_session, prefix: false, allow_nil: false
    delegate :relay?,         to: :event_type, prefix: false, allow_nil: false

    # Sorting scopes:
    scope :by_order, ->(dir = 'ASC') { order(dir == 'ASC' ? 'event_order ASC' : 'event_order DESC') }

    # Filtering scopes:
    scope :relays,      -> { joins(:event_type).includes(:event_type).where('event_types.is_a_relay' => true) }
    scope :individuals, -> { joins(:event_type).includes(:event_type).where('event_types.is_a_relay' => false) }
    #-- ------------------------------------------------------------------------
    #++

    # Returns +true+ if the current event actually takes part in computing the overall ranking
    # for the Meeting.
    #
    # The result is based on the internal stored flag column instead of the possible result obtained
    # by the associated <tt>pool_type.eventable? && stroke_type.eventable?</tt> so that this may act
    # as a possible override for special events.
    def eventable?
      !out_of_race?
    end

    # Override: includes *most* of its 1st-level associations into the typical to_json output.
    def to_json(options = nil)
      attributes.merge(
        'meeting_session' => meeting_session.attributes,
        'event_type' => event_type.attributes,
        'stroke_type' => stroke_type.attributes,
        'heat_type' => heat_type.attributes,
        'season' => season.attributes,
        'season_type' => season_type.attributes
      ).to_json(options)
    end
  end
end
