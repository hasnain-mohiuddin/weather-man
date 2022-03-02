# frozen_string_literal: true

require 'date'
require_relative 'bar_chart'

class HorizontalBar
  include BarChart
  def initialize(rows, year, month)
    @rows = rows
    @year = year
    @month = month
  end

  def diff_line_mapping
    puts print_year
    @rows.each do |temp|
      day = temp[0].split('-')[2]
      temp[1] != '' && BarChart.diff_line_chart(temp[1], temp[3], day)
    end
  end

  def same_line_mapping
    puts
    puts print_year
    @rows.each do |temp|
      day = temp[0].split('-')[2]
      temp[1] != '' && BarChart.same_line_chart(temp[1], temp[3], day)
    end
  end

  def print_year
    "#{@month} #{@year}"
  end
end
