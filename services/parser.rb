# frozen_string_literal: true

require_relative 'aplication_service'

class Parser < ApplicationService
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def call
    lines = file.readlines.map(&:chomp)

    {
      area: format_area_data(lines[0]),
      number_rovers: ((lines.length - 1) / 2),
      instructions: format_instruction_data(lines.drop(1))
    }
  end

  private

  def format_area_data(area_data)
    area_data.split(' ').map(&:to_i)
  end

  def format_instruction_data(instruction_data)
    instructions = []

    instruction_data.each_slice(2) do |position, commands|
      instructions << { starting_position: position, commands: commands }
    end

    instructions
  end
end
