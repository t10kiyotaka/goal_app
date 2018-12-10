class LoggedinUsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
  end
end
