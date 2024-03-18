# frozen_string_literal: true

RSpec.describe 'Parser', :type => :service do
  let(:input_file_path) { './spec/fixtures/files/input.txt' }
  let(:input_file) { File.open(input_file_path) }
  let(:exploration_data) { Parser.call(input_file) }

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
