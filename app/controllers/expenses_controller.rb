class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_url, notice: "Expense was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :amount, :date)
  end
end
