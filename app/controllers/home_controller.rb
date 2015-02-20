class HomeController < ApplicationController
  def index
    if logged_in?
      redirect_to accounts_path
    end
  end
end