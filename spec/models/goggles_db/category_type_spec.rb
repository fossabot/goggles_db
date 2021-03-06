# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_method_existance_examples'
require 'support/shared_filtering_scopes_examples'

module GogglesDb
  RSpec.describe CategoryType, type: :model do
    shared_examples_for 'a valid CategoryType instance' do
      it 'is valid' do
        expect(subject).to be_a(CategoryType).and be_valid
      end

      it_behaves_like(
        'having one or more required associations',
        %i[season season_type federation_type]
      )
      it 'has a valid Season' do
        expect(subject.season).to be_a(Season).and be_valid
      end
      it 'has a valid SeasonType' do
        expect(subject.season_type).to be_a(SeasonType).and be_valid
      end
      it 'has a valid FederationType' do
        expect(subject.federation_type).to be_a(FederationType).and be_valid
      end

      it_behaves_like(
        'having a list of scopes with no parameters',
        %i[by_age eventable
           relays individuals only_undivided only_gender_split]
      )
      it_behaves_like(
        'responding to a list of methods',
        %i[code federation_code description short_name group_name age_begin age_end
           eventable? relay? out_of_race? undivided?]
      )

      # Presence of fields & requiredness:
      it_behaves_like(
        'having one or more required & present attributes (invalid if missing)',
        %i[code]
      )
    end
    #-- ------------------------------------------------------------------------
    #++

    context 'when using the factory, the resulting instance' do
      subject { FactoryBot.create(:category_type) }
      it_behaves_like 'a valid CategoryType instance'
    end

    context 'any pre-seeded instance' do
      subject { CategoryType.all.sample }
      it_behaves_like 'a valid CategoryType instance'
    end
    #-- ------------------------------------------------------------------------
    #++

    # Filtering scopes:
    describe 'self.eventable' do
      let(:result) { subject.class.eventable }
      it 'is a relation containing only non-out-of-race (eventable) category types' do
        expect(result).to be_a(ActiveRecord::Relation)
        expect(result).to all(be_eventable)
      end
    end
    describe 'self.relays' do
      let(:result) { subject.class.relays }
      it 'is a relation containing only relay category types' do
        expect(result).to be_a(ActiveRecord::Relation)
        expect(result).to all(be_relay)
      end
    end
    describe 'self.individuals' do
      let(:result) { subject.class.individuals }
      it 'is a relation containing only category types for individual events' do
        expect(result).to be_a(ActiveRecord::Relation)
        result.each do |row|
          expect(row.relay?).to be false
        end
      end
    end
    describe 'self.only_undivided' do
      let(:result) { subject.class.only_undivided }
      it 'is a relation containing only category types not divided by gender' do
        expect(result).to be_a(ActiveRecord::Relation)
        expect(result).to all(be_undivided)
      end
    end
    describe 'self.only_gender_split' do
      let(:result) { subject.class.only_gender_split }
      it 'is a relation containing only category types which are gender-split in each event' do
        expect(result).to be_a(ActiveRecord::Relation)
        result.each do |row|
          expect(row.undivided?).to be false
        end
      end
    end

    describe 'self.for_season_type' do
      it_behaves_like('filtering scope for_<ANY_CHOSEN_FILTER>', CategoryType, 'for_season_type', 'season_type', GogglesDb::SeasonType.all_masters.sample)
    end
    describe 'self.for_season' do
      it_behaves_like('filtering scope for_<ANY_ENTITY_NAME>', CategoryType, 'season')
    end
    #-- ------------------------------------------------------------------------
    #++
  end
end
