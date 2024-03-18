# frozen_string_literal: true

require 'pry'
require './services/parser'

file = File.open('input.txt')
Parser.call(file)
