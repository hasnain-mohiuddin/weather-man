# frozen_string_literal: true

require 'colorize'

module FileReader
  def self.read_file(path)
    File.open(path, 'r')
  rescue StandardError
    puts 'File Not Found'
  end
end
