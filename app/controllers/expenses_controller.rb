class ExpensesController < ApplicationController
  before_action :require_user
  before_action :set_account
  before_action :set_expense, only: [:edit, :update, :done, :destroy]
  before_action :require_owner, only: [:edit, :update, :done, :destroy]

  def new
    @expense = @account.expenses.new
  end

  def create
    if create_expenses
      flash[:notice] = "Expense created successfully"
      redirect_to account_path(@account)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @expense.update(expense_params)
      flash[:notice] = "Expense updated successfully"
      redirect_to account_path(@account)
    else
      render :edit
    end
  end

  def done
    @expense.paid = true
    @expense.save

    redirect_to account_path(@account)
  end

  def destroy
    @expense.destroy

    redirect_to account_path(@account)
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
      number_of_months = step
      (start_month..12).step(step).each do |month|
        @expense = @account.expenses.new(expense_params)
        @expense.month_id = month
        @expense.due_date = @expense.due_date.to_date >> number_of_months
        number_of_months += step
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

  private

  def set_account
    @account = current_user.accounts.find(params[:account_id])
  end

  def set_expense
    @expense = @account.expenses.find(params[:id])
  end
end