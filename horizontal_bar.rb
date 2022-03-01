# frozen_string_literal: true

require_relative 'month'
require 'colorize'

class HorizontalBar
  include Month
  def initialize(rows, year, month)
    @rows = rows
    @year = year
    @month = month
  end

  def mapping_each_day
    puts "#{Month.number_to_month(@month)} #{@year}"
    @rows.each do |temp|
      _, _, day = temp[0].split('-')
      temp[1] != '' && print_message_sep(temp[1], temp[3], day)
    end
    same_line_mapping
  end

  def same_line_mapping
    puts
    puts "#{Month.number_to_month(@month)} #{@year}"
    @rows.each do |temp|
      _, _, day = temp[0].split('-')
      temp[1] != '' && print_message(temp[1], temp[3], day)
    end
  end

  def print_message_sep(high, low, day)
    puts "#{day} #{'+'.red * high.to_i} #{high}C"
    puts "#{day} #{'+'.blue * low.to_i} #{low}C"
  end

  def print_message(high, low, day)
    puts "#{day} #{'+'.red * high.to_i}#{'+'.blue * low.to_i} #{high}C"
  end
end
