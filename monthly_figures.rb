# frozen_string_literal: true

require_relative 'month'

class MonthlyFigures
  include Month
  def initialize(rows)
    @rows = rows
    @avg_high_temp = 0
    @avg_low_temp = 0
    @avg_humidity = 0
    @date = ''
    @no_of_rows = 0
  end

  def call_to_all
    highest_average_temp
    lowest_average_temp
    average_humidity
  end

  def highest_average_temp
    @rows.each do |temp|
      if temp[1] != ''
        @avg_high_temp += temp[1].to_i
        @no_of_rows += 1
      end
    end
    begin
      @avg_high_temp /= @no_of_rows
    rescue StandardError => e
      e.message
    end
    message_print('Highest Average', @avg_high_temp, 'C')
    @no_of_rows = 0
  end

  def lowest_average_temp
    @rows.each do |temp|
      if temp[3] != ''
        @avg_high_temp += temp[3].to_i
        @no_of_rows += 1
      end
    end
    begin
      @avg_low_temp /= @no_of_rows
    rescue StandardError => e
      e.message
    end
    message_print('Lowest Average', @avg_high_temp, 'C')
    @no_of_rows = 0
  end

  def average_humidity
    @rows.each do |temp|
      if temp[5] != ''
        @avg_humidity += temp[5].to_i
        @no_of_rows += 1
      end
    end
    begin
      @avg_humidity /= @no_of_rows
    rescue StandardError => e
      e.message
    end
    message_print('Average Humidity', @avg_humidity, '%')
    @no_of_rows = 0
  end

  def message_print(text, value, sign)
    puts "#{text}: #{value}#{sign}"
  end
end
