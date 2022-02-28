# frozen_string_literal: true

require_relative 'month'
require_relative 'monthly_figures'
require_relative 'yearly_figures'
require_relative 'horizontal_bar'

class FileHandling
  include Month

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
    select_case
  end

  def select_case
    case @op
    when '-e'
      reading_yearly_data
      yearly = YearlyFigures.new(@rows_year)
      yearly.call_to_all
    when '-a'
      reading_month_data
      monthly = MonthlyFigures.new(@rows)
      monthly.call_to_all
    when '-c'
      reading_month_data
      bar = HorizontalBar.new(@rows, @year, @month)
      bar.mapping_each_day
    end
  end

  def reading_month_data(month = '')
    @month = if month == ''
               Month.number_to_month(@month_num)[0..2]
             else
               Month.number_to_month(month)[0..2]
             end
    @rows = []
    begin
      file = File.open(
        "#{@path}/#{@path}_#{@year}_#{@month}.txt",
        'r'
      )

      file.each do |line|
        @rows << line.split(',').values_at(*0..3, *7..9)
      end
      @rows.shift
    rescue StandardError
      puts 'File Not Found'
    end
    @rows
  end

  def reading_yearly_data
    [*'1'..'12'].each do |month|
      @rows_year << [*reading_month_data(month)]
    end
  end
end
