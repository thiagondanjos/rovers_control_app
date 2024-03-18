# frozen_string_literal: true

require_relative 'aplication_service'

class Movement < ApplicationService
  attr_reader :starting_position, :commands

  def initialize(starting_position, commands)
    @x = starting_position[0].to_i
    @y = starting_position[1].to_i
    @coordinate = starting_position[2]
    @commands = commands
  end

  def call
    @commands.each do |command|
      if command.eql?('R')
        @coordinate = change_coordinate_clockwise
      elsif command.eql?('L')
        @coordinate = change_coordinate_counterclockwise
      else
        move
      end
    end

    "#{@x} #{@y} #{@coordinate}"
  end

  private

  def change_coordinate_clockwise
    return 'E' if @coordinate.eql?('N')
    return 'S' if @coordinate.eql?('E')
    return 'W' if @coordinate.eql?('S')

    'N'
  end

  def change_coordinate_counterclockwise
    return 'W' if @coordinate.eql?('N')
    return 'S' if @coordinate.eql?('W')
    return 'E' if @coordinate.eql?('S')

    'N'
  end

  def move
    case @coordinate
    when 'N'
      @y += 1
    when 'E'
      @x += 1
    when 'S'
      @y -= 1
    when 'W'
      @x -= 1
    end
  end
end
