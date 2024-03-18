# frozen_string_literal: true

require 'pry'
require_relative 'services/parser'
require_relative 'services/movement'

file = File.open('input.txt')
exploration_data = Parser.call(file)
end_position_data = []

exploration_data[:instructions].each do |instructions|
  starting_position = instructions[:starting_position].split(' ')
  commands = instructions[:commands].chars

  end_position_data << Movement.call(starting_position, commands)
end

puts end_position_data
