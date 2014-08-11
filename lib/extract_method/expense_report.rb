class ExpenseReport

  def initialize
    @expenses = []
  end

  def print_report(printer)

    total = 0
    meal_expenses = 0

    printer.print("Expenses #{get_date}\n")

    @expenses.each do |expense|
      if expense.type == Expense::BREAKFAST || expense.type == Expense::DINNER
        meal_expenses += expense.amount;
      end

      name = "TILT"
      case expense.type
        when Expense::DINNER
          name = "Dinner"
        when Expense::BREAKFAST
          name = "Breakfast"
        when Expense::CAR_RENTAL
          name = "Car Rental"
      end
      printer.print(  sprintf("%s\t%s\t$%.02f\n",
                                  ((expense.type == Expense::DINNER && expense.amount > 5000) ||
                                      (expense.type == Expense::BREAKFAST && expense.amount > 1000)) ? "X" : " ",
                                  name, expense.amount / 100.0))

      total += expense.amount

    end

    printer.print(sprintf("\nMeal expenses $%.02f", meal_expenses / 100.0))
    printer.print(sprintf("\nTotal $%.02f", total / 100.0))

  end

  def add_expense(expense)
    @expenses << expense
  end

  def get_date
    "9/12/2013";
  end


end