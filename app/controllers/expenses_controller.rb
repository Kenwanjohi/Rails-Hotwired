class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @expense = Expense.new
  end

  def edit
    @expense = Expense.find(params[:id])
   
  end

  def update
    @expense = Expense.find(params[:id])
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_url, notice: "Expense was successfully updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
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

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to expenses_url, notice: "Expense was successfully deleted."
  end

  private

  def expense_params
    params.require(:expense).permit(:description, :amount, :date)
  end
end
