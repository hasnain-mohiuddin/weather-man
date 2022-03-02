# frozen_string_literal: true

module BarChart
  def self.same_line_chart(high, low, day)
    puts "#{day} #{'+'.blue * low.to_i}#{'+'.red * high.to_i} #{low}C - #{high}C"
  end

  def self.diff_line_chart(high, low, day)
    puts "#{day} #{'+'.red * high.to_i} #{high}C"
    puts "#{day} #{'+'.blue * low.to_i} #{low}C"
  end
end
