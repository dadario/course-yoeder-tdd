class Expense

  DINNER = 1
  BREAKFAST = 2
  CAR_RENTAL = 3

  attr_reader :type
  attr_reader :amount

  def initialize(type, amount)
    @type = type
    @amount = amount
  end

end