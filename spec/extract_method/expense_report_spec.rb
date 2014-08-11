require_relative '../spec_helper'
require_relative 'mock_report_printer'

describe ExpenseReport do

  before do
    @report = ExpenseReport.new
    @printer = MockReportPrinter.new
  end

  after do
    puts @printer.get_text
  end

  it 'print empty' do
    @report.print_report(@printer)
    expect(@printer.get_text).to eq("Expenses 9/12/2013\n" +
                                       "\n" +
                                       "Meal expenses $0.00\n" +
                                       "Total $0.00")
  end

  it 'print One Dinner' do
    @report.add_expense(Expense.new(Expense::DINNER, 1678))
    @report.print_report(@printer)

    expect(@printer.get_text).to eq("Expenses 9/12/2013\n" +
                                       " \tDinner\t$16.78\n" +
                                       "\n" +
                                       "Meal expenses $16.78\n" +
                                       "Total $16.78")
  end

  it 'two Meals' do
    @report.add_expense(Expense.new(Expense::DINNER, 1000))
    @report.add_expense(Expense.new(Expense::BREAKFAST, 500))
    @report.print_report(@printer)

    expect(@printer.get_text).to eq("Expenses 9/12/2013\n" +
                                       " \tDinner\t$10.00\n" +
                                       " \tBreakfast\t$5.00\n" +
                                       "\n" +
                                       "Meal expenses $15.00\n" +
                                       "Total $15.00")
  end

  it 'two Meals And Car Rental' do
    @report.add_expense(Expense.new(Expense::DINNER, 1000))
    @report.add_expense(Expense.new(Expense::BREAKFAST, 500))
    @report.add_expense(Expense.new(Expense::CAR_RENTAL, 50000))
    @report.print_report(@printer)


    expect(@printer.get_text).to eq("Expenses 9/12/2013\n" +
                                       " \tDinner\t$10.00\n" +
                                       " \tBreakfast\t$5.00\n" +
                                       " \tCar Rental\t$500.00\n" +
                                       "\n" +
                                       "Meal expenses $15.00\n" +
                                       "Total $515.00")
  end

  it 'overages' do
    @report.add_expense(Expense.new(Expense::BREAKFAST, 1000))
    @report.add_expense(Expense.new(Expense::BREAKFAST, 1001))
    @report.add_expense(Expense.new(Expense::DINNER, 5000))
    @report.add_expense(Expense.new(Expense::DINNER, 5001))
    @report.print_report(@printer)


    expect(@printer.get_text).to eq("Expenses 9/12/2013\n" +
                                       " \tBreakfast\t$10.00\n" +
                                       "X\tBreakfast\t$10.01\n" +
                                       " \tDinner\t$50.00\n" +
                                       "X\tDinner\t$50.01\n" +
                                       "\n" +
                                       "Meal expenses $120.02\n" +
                                       "Total $120.02")
  end


end