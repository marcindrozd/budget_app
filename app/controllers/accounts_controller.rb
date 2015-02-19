class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id]) # change to currently logged_in user id
    @display_month = display_month(params[:change_month]) || Date.today.strftime("%B")
    @month_number = numeric_month(@display_month) # extract to app_controller and make database independent
    @expenses = @account.expenses.where(month_id: @month_number).order(:paid, :due_date)
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])

    if @account.update(account_params)
      flash[:notice] = "Total amount updated successfully!"
      redirect_to @account
    else
      render :edit
    end
  end

  def change_month
    display_month(params[:change_month])

    redirect_to :show
  end

  private

  def account_params
    params.require(:account).permit(:total)
  end

end