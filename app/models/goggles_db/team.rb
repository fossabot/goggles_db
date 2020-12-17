# frozen_string_literal: true

module GogglesDb
  #
  # = Team model
  #
  #   - version:  7.050
  #   - author:   Steve A.
  #
  class Team < ApplicationRecord
    self.table_name = 'teams'

    belongs_to :city, optional: true

    has_many :badges
    has_many :swimmers, through: :badges # May used with uniq
    has_many :team_affiliations
    has_many :seasons, through: :team_affiliations
    has_many :season_types, through: :team_affiliations

    has_many :managed_affiliations,  through: :team_affiliations
    # has_many :meeting_individual_results
    # has_many :meetings, through: :meeting_individual_results
    # has_many :meeting_relay_results
    # has_many :meeting_team_scores
    # has_many :goggle_cups
    # has_many :computed_season_ranking
    # has_many :team_passage_templates

    validates :name, presence: { length: { within: 1..60, allow_nil: false } }
    validates :editable_name, presence: { length: { within: 1..60, allow_nil: false } }

    validates :address,       length: { maximum: 100 }
    validates :phone_mobile,  length: { maximum:  40 }
    validates :phone_number,  length: { maximum:  40 }
    validates :fax_number,    length: { maximum:  40 }
    validates :e_mail,        length: { maximum: 100 }
    validates :contact_name,  length: { maximum: 100 }
    validates :home_page_url, length: { maximum: 150 }

    # Sorting scopes:
    scope :by_name, ->(dir = :asc) { order(name: dir) }

    # Filtering scopes:
    scope :for_name, ->(name) { where('MATCH(name, editable_name, name_variations) AGAINST(?)', name) }

    # TODO: CLEAR UNUSED
    # scope :with_results, -> { where('EXISTS(SELECT 1 from meeting_individual_results where not is_disqualified and team_id = teams.id)') }
    # scope :with_min_results, lambda(how_many = 20) {
    #   where(['(SELECT count(id) from meeting_individual_results where not is_disqualified and team_id = teams.id) > ?', how_many])
    # }
    #-- ------------------------------------------------------------------------
    #++

    # Instance scope helper for recent badges, given a list of years
    def recent_badges(year_list = [Time.zone.today.year - 1, Time.zone.today.year])
      badges.for_years(*year_list)
    end

    # Instance scope helper for recent team_affiliations, given a list of years
    def recent_affiliations(year_list = [Time.zone.today.year - 1, Time.zone.today.year])
      team_affiliations.for_years(*year_list)
    end

    # Override: includes *most* of its 1st-level associations into the typical to_json output.
    def to_json(options = nil)
      attributes.merge(
        'city' => city&.minimal_attributes, # (optional)
        'badges' => recent_badges.map(&:minimal_attributes),
        'team_affiliations' => recent_affiliations.map(&:minimal_attributes)
      ).to_json(options)
    end
  end
end
