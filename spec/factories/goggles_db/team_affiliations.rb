FactoryBot.define do
  factory :team_affiliation, class: 'GogglesDb::TeamAffiliation' do
    team
    season
    name { team.name }
    random_badge_code

    before(:create) do |built_instance|
      if built_instance.invalid?
        puts "\r\nFactory def. error => " << GogglesDb::ValidationErrorTools.recursive_error_for(built_instance)
        puts built_instance.inspect
      end
    end
  end
end
