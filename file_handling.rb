# frozen_string_literal: true

require 'date'
require_relative 'monthly_figures'
require_relative 'yearly_figures'
require_relative 'horizontal_bar'
require_relative 'file_reader'

class FileHandling
  include FileReader
  def initialize(args)
    @rows = []
    @rows_year = []
    @op = ''
    @year_month = ''
    @path = ''
    @year = ''
    @month_num = ''
    @month = ''
    @args = args
  end

  def map_to_array
    @op, @year_month, @path = @args
    @year, @month_num = @year_month.split('/')
  end

  def select_case
    case @op
    when '-e'
      reading_yearly_data
      yearly = YearlyFigures.new(@rows_year)
      yearly.call_to_all
    when '-a'
      @rows = reading_month_data
      return if @rows.nil?

      monthly = MonthlyFigures.new(@rows)
      monthly.call_to_all
    when '-c'
      @rows = reading_month_data
      return if @rows.nil?

      bar = HorizontalBar.new(@rows, @year, @month)
      bar.diff_line_mapping
      bar.same_line_mapping
    end
  end

  def reading_month_data(month = '')
    @month = Date::MONTHNAMES[month.empty? ? @month_num.to_i : month.to_i][0..2]
    @rows = []
    file = FileReader.read_file("#{@path}/#{@path}_#{@year}_#{@month}.txt")
    return if file.nil?

    file.map { |line| line.split(',').values_at(*0..3, *7..9) }.drop(1)
  end

  def reading_yearly_data
    [*'1'..'12'].each do |month|
      @rows_year << [*reading_month_data(month)]
    end
  end
end
