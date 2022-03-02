# frozen_string_literal: true

module Calculations
  def self.highest_temp(rows)
    return if rows.empty?

    max_temp = '0'
    date = ''
    rows.each do |col|
      col.each do |temp|
        if temp[1] != '' && (max_temp < temp[1])
          max_temp = temp[1]
          date = temp[0]
        end
      end
    end
    [max_temp, date]
  end

  def self.lowest_temp(rows)
    return if rows.empty?

    min_temp = '100'
    date = ''
    rows.each do |col|
      col.each do |temp|
        if temp[3] != '' && (min_temp.to_i > temp[3].to_i)
          min_temp = temp[3]
          date = temp[0]
        end
      end
    end
    [min_temp, date]
  end

  def self.highest_humidity(rows)
    return if rows.empty?

    highest_humidity = '0'
    date = ''
    rows.each do |col|
      col.each do |temp|
        if temp[4] != '' && (highest_humidity < temp[4])
          highest_humidity = temp[4]
          date = temp[0]
        end
      end
    end
    [highest_humidity, date]
  end

  def self.highest_average_temp(rows)
    return if rows.empty?

    no_of_rows = 0
    avg_high_temp = 0
    rows.each do |temp|
      if temp[1] != ''
        avg_high_temp += temp[1].to_i
        no_of_rows += 1
      end
    end
    begin
      avg_high_temp /= no_of_rows
    rescue StandardError => e
      e.message
    end
    avg_high_temp
  end

  def self.lowest_average_temp(rows)
    return if rows.empty?

    no_of_rows = 0
    avg_low_temp = 0
    rows.each do |temp|
      if temp[3] != ''
        avg_low_temp += temp[3].to_i
        no_of_rows += 1
      end
    end
    begin
      avg_low_temp /= no_of_rows
    rescue StandardError => e
      e.message
    end
    avg_low_temp
  end

  def self.average_humidity(rows)
    return if rows.empty?

    no_of_rows = 0
    avg_humidity = 0
    rows.each do |temp|
      if temp[5] != ''
        avg_humidity += temp[5].to_i
        no_of_rows += 1
      end
    end
    begin
      avg_humidity /= no_of_rows
    rescue StandardError => e
      e.message
    end
    avg_humidity
  end
end
