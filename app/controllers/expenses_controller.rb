class ExpensesController < ApplicationController

  def new
    @account = Account.find(params[:account_id])
    @expense = Expense.new
  end

  def create
    @account = Account.find(params[:account_id])

    if create_expenses
      flash[:notice] = "Expense created successfully"
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def edit
    @account = Account.find(params[:account_id])
    @expense = Expense.find(params[:id])
  end

  def update
    @account = Account.find(params[:account_id])
    @expense = Expense.find(params[:id])

    if @expense.udpate(expense_params)
      flash[:notice] = "Expense updated successfully"
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  private

  def expense_params
    params.require(:expense_form).permit(:name, :amount, :due_date, :recurrence)
  end

  # further refactoring needs to be done here
  def create_expenses
    expense_id = nil
    @expense = @account.expenses.create(expense_params)
    step = params[:expense_form][:recurrence].to_i

    if @expense.valid? && step != 0
      @expense.month_id = @expense.due_date.mon
      @expense.save 
      start_month = @expense.due_date.mon + step
      (start_month..12).step(step).each do |month|
        @expense = @account.expenses.new(expense_params)
        @expense.month_id = month
        @expense.related_to = expense_id || @expense.id
        @expense.save
        expense_id ||= @expense.id
      end
    elsif @expense.valid?
      @expense.month_id = @expense.due_date.mon
      @expense.save
    end
    @expense.valid?
  end
end