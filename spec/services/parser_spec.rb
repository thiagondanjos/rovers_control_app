# frozen_string_literal: true

RSpec.describe 'Parser', :type => :service do
  let(:file_path) { './spec/fixtures/files/input.txt' }
  let(:file) { File.open(file_path) }
  let(:explorer_instructions) { Parser.call(file) }

  let(:expected_explorer_instructions) do
    {
      area: [5, 5],
      number_rovers: 1,
      instructions: [
        {
          initial_position: '1 2 N',
          commands: 'LMLMLMLMM'
        }
      ]
    }
  end

  before { require './services/parser' }

  describe '#call' do
    it { expect(explorer_instructions).to eq(expected_explorer_instructions) }
  end
end
