class DateUtil

  def self.hotdate?(ship_by_date, order_date)

    diff_date = (ship_by_date - order_date).to_i
    return true if order_date.friday? && diff_date <= 4
    return true if order_date.saturday? && diff_date <= 3
    return true if diff_date <= 1

    false
  end


end