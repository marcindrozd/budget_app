class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :money_left, :current_user, :logged_in?

  MONTHS_TO_WORD = {'1' => 'January', '2' => 'February', '3' => 'March', '4' => 'April', '5' => 'May', '6' => 'June',
            '7' => 'July', '8' => 'August', '9' => 'September', '10' => 'October', '11' => 'November', '12' => 'December'}

  MONTHS_TO_NUMBER = {'January' => '1', 'February' => '2', 'March' => '3', 'April' => '4', 'May' => '5', 'June' => '6',
            'July' => '7', 'August' => '8', 'September' => '9', 'October' => '10', 'November' => '11', 'December' => '12'}

  def display_month(input)
    MONTHS_TO_WORD[input]
  end

  def numeric_month(input)
    MONTHS_TO_NUMBER[input]
  end

  def total_expense_amount(account, month)
    exp = account.expenses.where(month_id: numeric_month(month))
    exp.sum(:amount)
  end

  def money_left(account, month)
    account.total - total_expense_amount(account, month)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = "You are not allowed to do that"
      redirect_to root_path
    end
  end
end
