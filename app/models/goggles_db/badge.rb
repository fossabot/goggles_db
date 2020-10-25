# frozen_string_literal: true

module GogglesDb
  #
  # = Badge model
  #
  #   - version:  7.010
  #   - author:   Steve A.
  #
  class Badge < ApplicationRecord
    self.table_name = 'badges'

    # belongs_to :user # [Steve, 20120212] Do not validate associated user!
    belongs_to :swimmer
    belongs_to :team_affiliation
    belongs_to :season
    belongs_to :team
    belongs_to :category_type
    belongs_to :entry_time_type
    # [Steve, 20130924] entry_time_type is used as a (default) user-preference for time accreditation during meeting registration.
    # It can change on a user/season basis, thus the reference is kept on the badge.

    has_one  :season_type, through: :season
    has_one  :gender_type, through: :swimmer

    validates_associated :swimmer
    validates_associated :team_affiliation
    validates_associated :season
    validates_associated :team
    validates_associated :category_type
    validates_associated :entry_time_type

    # has_many :meeting_individual_results
    # has_many :passages
    # has_many :meetings,      through: :meeting_individual_results
    # has_many :team_managers, through: :team_affiliation
    #
    validates :number, presence: { length: { within: 1..40 }, allow_nil: false }

    delegate :header_year, to: :season

    # Sorting scopes:
    scope :by_season,        ->(dir = 'ASC')  { joins(:season).order(dir == 'ASC' ? 'seasons.begin_date ASC' : 'seasons.begin_date DESC') }
    scope :by_swimmer,       ->(dir = 'ASC')  { joins(:swimmer).order(dir == 'ASC' ? 'swimmers.complete_name ASC' : 'swimmers.complete_name DESC') }
    scope :by_category_type, ->(dir = 'ASC')  { joins(:category_type).order(dir == 'ASC' ? 'category_types.code ASC' : 'category_types.code DESC') }
    # TODO: unused yet
    # scope :by_team,          ->(dir = 'ASC')  { joins(:team).order("teams.name #{dir}") }
    # scope :by_user,          ->(dir)  { joins(:user).order("users.name #{dir}") }

    # Filtering scopes:
    scope :for_category_type, ->(category_type) { joins(:category_type).where(['category_types.id = ?', category_type.id]) }
    scope :for_gender_type,   ->(gender_type)   { joins(:gender_type).where(['gender_types.id = ?', gender_type.id]) }
    scope :for_season_type,   ->(season_type)   { joins(:season_type).where(['season_types.id = ?', season_type.id]) }
    scope :for_season,        ->(season)        { where(season_id: season.id) }
    scope :for_team,          ->(team)          { where(team_id: team.id) }
    scope :for_swimmer,       ->(swimmer)       { where(swimmer_id: swimmer.id) }
    scope :for_years,         ->(*year_list)    { joins(:season).where(['seasons.header_year IN (?)', year_list]) }
    scope :for_year,          ->(header_year)   { joins(:season).where(['seasons.header_year = ?', header_year]) }
    # TODO: unused yet
    # scope :for_final_rank,       ->(final_rank = 1)   { where(['final_rank = ?', final_rank]) }
    # scope :for_team_affiliation, ->(team_affiliation) { where(team_affiliation_id: team_affiliation.id) }
    #-- ------------------------------------------------------------------------
    #++

    # Override: includes all 1st-level associations into the typical to_json output.
    def to_json(options = nil)
      attributes.merge(
        'swimmer' => swimmer.attributes,
        'gender_type' => swimmer.gender_type.attributes,
        'team_affiliation' => team_affiliation.attributes,
        'season' => season.attributes,
        'team' => team.attributes,
        'category_type' => category_type.attributes,
        'entry_time_type' => entry_time_type.attributes
      ).to_json(options)
    end
  end
end