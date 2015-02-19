class AccountsController < ApplicationController

  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id]) # change to currently logged_in user id
    @display_month = Date.today.strftime("%B")
    numeric_month = Month.find_by(name: @display_month).id # extract to app_controller and make database independent
    @expenses = @account.expenses.where(month_id: numeric_month)
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

  private

  def account_params
    params.require(:account).permit(:total)
  end

end