# frozen_string_literal: true

module Month
  def self.number_to_month(number)
    month_map = {
      '1' => 'January',
      '2' => 'Febuary',
      '3' => 'March',
      '4' => 'April',
      '5' => 'May',
      '6' => 'June',
      '7' => 'July',
      '8' => 'August',
      '9' => 'September',
      '10' => 'October',
      '11' => 'November',
      '12' => 'December'
    }
    month_map[number]
  end
end
