# frozen_string_literal: true

require_relative 'services/parser'
require_relative 'services/movement'

input_file = File.open('input.txt')
exploration_data = Parser.call(input_file)
end_position_data = []

exploration_data[:instructions].each do |instructions|
  starting_position = instructions[:starting_position].split(' ')
  commands = instructions[:commands].chars

  end_position_data << Movement.call(starting_position, commands)
end

end_position_data.each { |end_position| puts end_position }

output_file = File.new('output.txt', 'w')
output_file.write(end_position_data.join("\n"))
