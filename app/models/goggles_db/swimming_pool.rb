# frozen_string_literal: true

module GogglesDb
  #
  # = SwimmingPool model
  #
  #   - version:  7.035
  #   - author:   Steve A.
  #
  class SwimmingPool < ApplicationRecord
    self.table_name = 'swimming_pools'

    belongs_to :city
    belongs_to :pool_type

    belongs_to :shower_type, optional: true
    belongs_to :hair_dryer_type, optional: true
    belongs_to :locker_cabinet_type, optional: true

    validates_associated :city
    validates_associated :pool_type

    validates :name,          presence: { length: { within: 1..100, allow_nil: false } }
    validates :nick_name,     presence: { length: { within: 1..100, allow_nil: false } }
    validates :address,       length: { maximum: 100 }
    validates :phone_number,  length: { maximum:  40 }
    validates :fax_number,    length: { maximum:  40 }
    validates :e_mail,        length: { maximum: 100 }
    validates :contact_name,  length: { maximum: 100 }

    validates :lanes_number,  presence: { length: { within: 1..2, allow_nil: false } },
                              numericality: true

    validates :has_multiple_pools,      inclusion: { in: [true, false] }
    validates :has_open_area,           inclusion: { in: [true, false] }
    validates :has_bar,                 inclusion: { in: [true, false] }
    validates :has_restaurant_service,  inclusion: { in: [true, false] }
    validates :has_gym_area,            inclusion: { in: [true, false] }
    validates :has_children_area,       inclusion: { in: [true, false] }
    validates :do_not_update,           inclusion: { in: [true, false] }

    alias_attribute :multiple_pools?,   :has_multiple_pools
    alias_attribute :garden?,           :has_open_area
    alias_attribute :bar?,              :has_bar
    alias_attribute :restaurant?,       :has_restaurant_service
    alias_attribute :gym?,              :has_gym_area
    alias_attribute :child_area?,       :has_children_area
    alias_attribute :read_only?,        :do_not_update

    # Sorting scopes:
    scope :by_name, ->(dir = :asc) { order(name: dir) }
    scope :by_city, ->(dir = :asc) { includes(:city).joins(:city).order('cities.name': dir) }

    def self.by_pool_type(dir = :asc)
      includes(:pool_type).joins(:pool_type).order('pool_types.code': dir, 'swimming_pools.name': dir)
    end

    # acts_as_taggable_on :tags_by_users
    # acts_as_taggable_on :tags_by_teams

    delegate :name, to: :city, prefix: true, allow_nil: false
    #-- ------------------------------------------------------------------------
    #++

    # Override: includes the 1st-level associations into the typical to_json output.
    def to_json(options = nil)
      attributes.merge(
        'city' => city.attributes,
        'pool_type' => pool_type.attributes,
        # Optional:
        'shower_type' => shower_type&.attributes,
        'hair_dryer_type' => hair_dryer_type&.attributes,
        'locker_cabinet_type' => locker_cabinet_type&.attributes
      ).to_json(options)
    end
  end
end
