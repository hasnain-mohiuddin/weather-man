# frozen_string_literal: true

require_relative 'file_handling'

file = FileHandling.new(ARGV)
file.map_to_array

file.select_case
