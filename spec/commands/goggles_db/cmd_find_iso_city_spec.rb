# frozen_string_literal: true

require 'rails_helper'
require 'support/shared_method_existance_examples'

module GogglesDb
  RSpec.describe CmdFindIsoCity, type: :command do
    let(:fixture_country) { ISO3166::Country.new('IT') }

    describe 'any instance' do
      subject { CmdFindIsoCity.new(fixture_country, 'Albinea') }

      it_behaves_like(
        'responding to a list of methods',
        %i[matches call errors successful?]
      )
    end
    #-- --------------------------------------------------------------------------
    #++

    shared_examples_for 'CmdFindIsoCity successful #call' do |fixture_name|
      it 'returns itself' do
        expect(subject).to be_a(CmdFindIsoCity)
      end
      it 'is successful' do
        expect(subject).to be_successful
      end
      it 'has a blank #errors list' do
        expect(subject.errors).to be_blank
      end
      it 'has a valid Cities::City #result' do
        expect(subject.result).to be_a(Cities::City).and be_present
        # DEBUG output for tested substitutions: just specify actual fixture_name in shared group call to enable it
        puts "\r\n- #{fixture_name} => #{subject.result.name}" if fixture_name && fixture_name != subject.result.name
      end
      describe '#matches' do
        it 'is an array of OpenStruct, each with a candidate and a weight' do
          expect(subject.matches).to all respond_to(:candidate).and respond_to(:weight)
        end
        it 'includes the #result in the #matches candidates list' do
          expect(subject.matches.map(&:candidate)).to include(subject.result)
        end
      end
    end

    context 'when using valid parameters' do
      context 'which matches a custom country,' do
        subject { CmdFindIsoCity.call(ISO3166::Country.new('SE'), 'Stockholm') }

        it_behaves_like('CmdFindIsoCity successful #call', nil)

        it 'has multiple #matches' do
          expect(subject.matches.count).to be > 1
        end
      end

      context 'which matches a single result (1:1),' do
        [
          # 1:1 matches: (these are strictly dependent on current BIAS_MATCH value)
          "L`Aquila'", 'Bologna',

          # "Saint"-prefix removed:
          'S.LAZZARO DI SAVENA', 'San LAZZARO di SAVENA',
          'S. BARTOLOMEO Bosco',
          "S.DONA' DI PIAVE", "SAN DONA' DEL PIAVE",
          'S.Egidio alla Vibrata',
          'S..Agata di Militello',

          # Wrong or problematic data: (bypassed using J-W fuzzy distance)
          'LAMEZIA TERME', 'Citta di Castello',
          'MASSA LUBRENSE',
          'BASTIA UMBRA', 'SCANZANO JONICO',

          # Fixed with data migrations:
          'Monastier Treviso',
          'GIUGLIANO CAMPANIA'
        ].each do |fixture_name|
          describe "#call ('#{fixture_name}')" do
            subject { CmdFindIsoCity.call(fixture_country, fixture_name) }

            it_behaves_like('CmdFindIsoCity successful #call', nil)

            it 'has a single-item #matches list' do
              expect(subject.matches.count).to eq(1)
            end
          end
        end
      end

      context 'which matches multiple results (1:N),' do
        [
          # 1:N matches:
          'Cento',
          'Reggio Emilia', 'Parma',
          'Riccione', 'Carpi', 'Ferrara', 'Milano',
          'Bibbiano', 'Modena', 'Sassuolo',

          # Fixed with data migrations:
          'Lamezia',
          'Città di Castello',
          # Fixed with data migrations:
          'CANOSA PUGLIA',
          'PINARELLA', 'SPRESIANO'
        ].each do |fixture_name|
          describe "#call ('#{fixture_name}')" do
            subject { CmdFindIsoCity.call(fixture_country, fixture_name) }

            it_behaves_like('CmdFindIsoCity successful #call', nil)

            it 'has multiple #matches' do
              expect(subject.matches.count).to be > 1
            end
          end
        end
      end
    end
    #-- --------------------------------------------------------------------------
    #++

    context 'when using invalid parameters,' do
      shared_examples_for 'CmdFindIsoCity failing' do
        it 'returns itself' do
          expect(subject).to be_a(CmdFindIsoCity)
        end
        it 'fails' do
          expect(subject).to be_a_failure
        end
        it 'has a nil #result' do
          expect(subject.result).to be nil
        end
      end

      # describe '#call' do
      #   context 'without a valid ISO3166::Country parameter,' do
      #     subject { CmdFindIsoCity.call(nil, 'Reggio Emilia') }

      #     it_behaves_like 'CmdFindIsoCity failing'

      #     it 'has a non-empty #errors list' do
      #       expect(subject.errors).to be_present
      #       expect(subject.errors[:msg]).to eq(['Invalid iso_country parameter'])
      #     end
      #   end

      #   context 'with a non-existing city name,' do
      #     let(:impossible_name) { %w[Kqwxy Ykqxz Z1wq Xhk67 ZZZwy9].sample }
      #     subject { CmdFindIsoCity.call(fixture_country, impossible_name) }

      #     it_behaves_like 'CmdFindIsoCity failing'

      #     it 'has a non-empty #errors list' do
      #       expect(subject.errors).to be_present
      #       expect(subject.errors[:name]).to eq([impossible_name])
      #     end
      #   end
      # end
    end
    #-- --------------------------------------------------------------------------
    #++
  end
end
