# frozen_string_literal: true

require 'rails_helper'

module GogglesDb
  RSpec.describe HeatType, type: :model do
    %w[heat semifinals finals].each do |word|
      describe "self.#{word}" do
        it 'is has a #code' do
          expect(subject.class.send(word).code).to be_present
        end
        it 'is a valid instance of the same class' do
          expect(subject.class.send(word)).to be_a(subject.class).and be_valid
        end
        it "has a corresponding (true, for having the same code) ##{word}? helper method" do
          expect(subject.class.send(word).send("#{word}?")).to be true
        end
      end
    end

    describe 'self.validate_cached_rows' do
      it 'does not raise any errors' do
        expect { subject.class.validate_cached_rows }.not_to raise_error
      end
    end
  end
end