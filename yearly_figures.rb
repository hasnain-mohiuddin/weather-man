# frozen_string_literal: true

require_relative 'month'

class YearlyFigures
  include Month
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
    @rows.each do |col|
      col.each do |temp|
        if temp[1] != '' && (@max_temp < temp[1])
          @max_temp = temp[1]
          @date = temp[0]
        end
      end
    end
    message_print('Highest', @max_temp, 'C')
  end

  def lowest_temp
    @rows.each do |col|
      col.each do |temp|
        if temp[3] != '' && (@min_temp > temp[3])
          @min_temp = temp[3]
          @date = temp[0]
        end
      end
    end
    message_print('Lowest', @min_temp, 'C')
  end

  def highest_humidity
    @rows.each do |col|
      col.each do |temp|
        if temp[4] != '' && (@highest_humidity < temp[4])
          @highest_humidity = temp[4]
          @date = temp[0]
        end
      end
    end
    message_print('Humid:', @highest_humidity, '%')
  end

  def message_print(text, value, sign)
    _, month, date = @date.split('-')
    month = Month.number_to_month(month)
    puts "#{text} #{value}#{sign} on #{month} #{date}"
  end
end
