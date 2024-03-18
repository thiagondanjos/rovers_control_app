# frozen_string_literal: true

RSpec.describe 'Movement', :type => :service do
  let(:input_file_path) { './spec/fixtures/files/input.txt' }
  let(:input_file) { File.open(input_file_path) }
  let(:exploration_data) { Parser.call(input_file) }
  let(:instructions) { exploration_data[:instructions].first }
  let(:starting_position) { instructions[:starting_position].split(' ') }
  let(:commands) { instructions[:commands].chars }
  let(:end_position_data) { Movement.call(starting_position, commands) }
  let(:expected_end_position_data) { '1 3 N' }

  before do
    require_relative '../../services/parser'
    require_relative '../../services/movement'
  end

  describe '#call' do
    it { expect(end_position_data).to eq(expected_end_position_data) }
  end
end
