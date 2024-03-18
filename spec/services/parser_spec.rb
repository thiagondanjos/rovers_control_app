# frozen_string_literal: true

RSpec.describe 'Parser', :type => :service do
  let(:file_path) { './spec/fixtures/files/input.txt' }
  let(:file) { File.open(file_path) }
  let(:exploration_data) { Parser.call(file) }

  let(:expected_exploration_data) do
    {
      area: [5, 5],
      number_rovers: 1,
      instructions: [
        {
          starting_position: '1 2 N',
          commands: 'LMLMLMLMM'
        }
      ]
    }
  end

  before { require_relative '../../services/parser' }

  describe '#call' do
    it { expect(exploration_data).to eq(expected_exploration_data) }
  end
end
