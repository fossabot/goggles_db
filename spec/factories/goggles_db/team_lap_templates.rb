# frozen_string_literal: true

FactoryBot.define do
  factory :team_lap_template, class: 'GogglesDb::TeamLapTemplate' do
    team
    pool_type { GogglesDb::PoolType.all_eventable.sample }
    event_type do
      GogglesDb::EventsByPoolType.eventable.individuals
                                 .for_pool_type(pool_type)
                                 .event_length_between(50, 800)
                                 .sample
                                 .event_type
    end
    #-- -----------------------------------------------------------------------
    #++

    before(:create) do |built_instance|
      if built_instance.invalid?
        puts "\r\nFactory def. error => " << GogglesDb::ValidationErrorTools.recursive_error_for(built_instance)
        puts built_instance.inspect
      end
    end
  end
end
