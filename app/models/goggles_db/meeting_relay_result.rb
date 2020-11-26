# frozen_string_literal: true

module GogglesDb
  #
  # = MeetingRelayResult model
  #
  #   - version:  7.035
  #   - author:   Steve A.
  #
  class MeetingRelayResult < ApplicationRecord
    self.table_name = 'meeting_relay_results'

    belongs_to :meeting_program
    belongs_to :team
    belongs_to :team_affiliation

    validates_associated :meeting_program
    validates_associated :team
    validates_associated :team_affiliation

    belongs_to :entry_time_type, optional: true
    belongs_to :disqualification_code_type, optional: true

    has_one :season,          through: :meeting_program
    has_one :meeting,         through: :meeting_program
    has_one :meeting_session, through: :meeting_program
    has_one :meeting_event,   through: :meeting_program

    has_one :season_type,   through: :meeting_program
    has_one :pool_type,     through: :meeting_program
    has_one :event_type,    through: :meeting_program
    has_one :category_type, through: :meeting_program
    has_one :gender_type,   through: :meeting_program

    has_many :meeting_relay_swimmers, dependent: :delete_all

    validates :relay_header, length: { maximum: 60 }, allow_blank: true
    validates :rank, presence: { length: { within: 1..4, allow_nil: false }, numericality: true }
    validates :standard_points, presence: true, numericality: true
    validates :meeting_points, presence: true, numericality: true
    validates :reaction_time, presence: true, numericality: true

    # Sorting scopes:
    # TODO: WIP:
    scope :by_rank, -> { order(disqualified: :asc, standard_points: :desc, meeting_points: :desc, rank: :asc) }
    # TODO: CLEAR UNUSED / add more only if really needed
    # scope :by_timing, ->(dir = :asc) { order(is_disqualified: :asc, minutes: dir.to_s.downcase.to_sym,
    #     seconds: dir.to_s.downcase.to_sym, hundreds: dir.to_s.downcase.to_sym) }
    # scope :by_split_category, ->(dir = :asc) { joins(:category_type, :gender_type).order('gender_types.code': :desc, 'category_types.code': dir) }
    # scope :by_meeting_relay, ->(dir)         { order("meeting_program_id #{dir}, rank #{dir}") }

    # Filtering scopes:
    scope :valid_for_ranking, -> { where(out_of_race: false, disqualified: false) }
    scope :qualifications,    -> { where(disqualified: false) }
    scope :disqualifications, -> { where(disqualified: true) }
    scope :for_team,          ->(team) { where(team_id: team.id) }
    # TODO: CLEAR UNUSED
    # scope :with_rank,         ->(rank_filter) { where(rank: rank_filter) }
    # scope :with_score,        ->(score_sym = 'standard_points') { where("#{score_sym} > 0") }
    # # [Steve, 20180613] Do not change the scope below with a composite check on each field joined by 'AND's, because it does not work
    # scope :with_timing,       -> { where('(minutes + seconds + hundreds > 0)') }
    # scope :for_over_that_score, ->(score_sym = 'standard_points', points = 800) { where("#{score_sym} > #{points}") }
    #-- ------------------------------------------------------------------------
    #++

    # Returns +true+ if this result can be scored into the overall ranking.
    def valid_for_ranking?
      !out_of_race? && !disqualified?
    end

    # Returns a new Timing instance initialized with the timing data from this row
    # (@see lib/wrappers/timing.rb)
    #
    def to_timing
      # MIR doesn't hold an "hour" column due to the typical short time span of the competition:
      Timing.new(hundreds, seconds, minutes % 60, 60 * (minutes / 60))
    end
    #-- ------------------------------------------------------------------------
    #++

    # Returns a commodity Hash wrapping the essential data that summarizes the Meeting
    # associated to this row.
    def meeting_attributes
      {
        'id' => meeting.id,
        'code' => meeting.code,
        'header_year' => meeting.header_year,
        'edition_label' => meeting.edition_label
      }
    end

    # Similarly to <tt>#meeting_attributes</tt>, this returns a commodity Hash
    # summarizing the MeetingSession associated to this row.
    def meeting_session_attributes
      {
        'id' => meeting_session.id,
        'session_order' => meeting_session.session_order,
        'scheduled_date' => meeting_session.scheduled_date
      }
    end

    # Override: includes most relevant data for its 1st-level associations
    def to_json(options = nil)
      attributes.merge(
        'meeting' => meeting_attributes,
        'meeting_session' => meeting_session_attributes,
        'meeting_program' => meeting_program.attributes,
        'pool_type' => pool_type.attributes,
        'event_type' => event_type.attributes,
        'category_type' => category_type.attributes,
        'gender_type' => gender_type.attributes,
        'meeting_relay_swimmers' => meeting_relay_swimmers.map(&:attributes)
      ).to_json(options)
    end
  end
end
