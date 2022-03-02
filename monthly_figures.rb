# frozen_string_literal: true

require_relative 'calculations'
class MonthlyFigures
  include Calculations
  def initialize(rows)
    @rows = rows
    @avg_high_temp = 0
    @avg_low_temp = 0
    @avg_humidity = 0
    @date = ''
  end

  def call_to_all
    highest_average_temp
    lowest_average_temp
    average_humidity
  end

  def highest_average_temp
    @avg_high_temp = Calculations.highest_average_temp(@rows)
    message_print('Highest Average', @avg_high_temp, 'C')
  end

  def lowest_average_temp
    @avg_low_temp = Calculations.lowest_average_temp(@rows)
    message_print('Lowest Average', @avg_low_temp, 'C')
  end

  def average_humidity
    @avg_humidity = Calculations.average_humidity(@rows)
    message_print('Average Humidity', @avg_humidity, '%')
  end

  def message_print(text, value, sign)
    puts "#{text}: #{value}#{sign}"
  end
end
