# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_method_existance_examples'
require 'support/shared_to_json_examples'

module GogglesDb
  RSpec.describe Swimmer, type: :model do
    context 'when using the factory, the resulting instance' do
      subject { FactoryBot.create(:swimmer) }

      it_behaves_like(
        'having one or more required associations',
        %i[gender_type]
      )

      it_behaves_like(
        'responding to a list of methods',
        %i[associated_user user male? female? intermixed?]
      )
      #-- ----------------------------------------------------------------------
      #++

      it 'is valid' do
        expect(subject).to be_a(Swimmer).and be_valid
      end
      it 'has a valid GenderType' do
        expect(subject.gender_type).to be_a(GenderType).and be_valid
      end
      it 'is does not have an associated user yet' do
        expect(subject).to respond_to(:associated_user)
        expect(subject.associated_user).to be nil
      end
      it 'is has a #complete_name' do
        expect(subject).to respond_to(:complete_name)
        expect(subject.complete_name).to be_present
      end
      it 'is has a #year_of_birth' do
        expect(subject).to respond_to(:year_of_birth)
        expect(subject.year_of_birth).to be_present
      end
    end
    #-- ------------------------------------------------------------------------
    #++

    describe '#to_json' do
      subject { FactoryBot.create(:swimmer) }

      # Required associations:
      it_behaves_like(
        '#to_json when called on a valid model instance with',
        %w[gender_type]
      )

      # Optional associations:
      context 'when the entity contains other optional associations,' do
        let(:fixture_user) { FactoryBot.create(:user) }
        subject            { FactoryBot.create(:swimmer, associated_user: fixture_user) }

        let(:json_hash) do
          expect(subject.associated_user).to be_a(User).and be_valid
          expect(subject.associated_user_id).to eq(fixture_user.id)
          JSON.parse(subject.to_json)
        end

        it_behaves_like(
          '#to_json when the entity contains other optional associations with',
          %w[associated_user]
        )
      end
    end
  end
end