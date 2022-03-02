# frozen_string_literal: true

require 'date'
require_relative 'calculations'

class YearlyFigures
  include Calculations
  def initialize(rows)
    @rows = rows
    @max_temp = '0'
    @min_temp = '100'
    @highest_humidity = '0'
    @date = ''
  end

  def call_to_all
    highest_temp
    lowest_temp
    highest_humidity
  end

  def highest_temp
    @max_temp, @date = Calculations.highest_temp(@rows)
    message_print('Highest', @max_temp, 'C')
  end

  def lowest_temp
    @min_temp, @date = Calculations.lowest_temp(@rows)
    message_print('Lowest', @min_temp, 'C')
  end

  def highest_humidity
    @highest_humidity, @date = Calculations.highest_humidity(@rows)
    message_print('Humid:', @highest_humidity, '%')
  end

  def message_print(text, value, sign)
    _, month, date = @date.split('-')
    month = Date::MONTHNAMES[month.to_i]
    puts "#{text} #{value}#{sign} on #{month} #{date}"
  end
end
