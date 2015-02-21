class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  before_action :require_owner, only: [:show, :edit, :update, :destroy]

  def index
    @accounts = current_user.accounts.all
  end

  def new
    @account = current_user.accounts.new
  end

  def create
    @account = current_user.accounts.new(account_params)
    
    if @account.save
      flash[:notice] = "Account created successfully!"
      redirect_to accounts_path
    else
      render :new
    end
  end

  def show
    @display_month = display_month(params[:change_month]) || Date.today.strftime("%B")
    @month_number = numeric_month(@display_month)
    @expenses = @account.expenses.where(month_id: @month_number).order(:paid, :due_date)
  end

  def edit
  end

  def update
    if @account.update(account_params)
      flash[:notice] = "Total amount updated successfully!"
      redirect_to @account
    else
      render :edit
    end
  end

  def destroy
    @account.destroy

    redirect_to accounts_path
  end

  def change_month
    display_month(params[:change_month])

    redirect_to :show
  end

  private

  def account_params
    params.require(:account).permit(:name, :total, :currency)
  end

  def set_account
    @account = Account.find_by(slug: params[:id])
  end
end