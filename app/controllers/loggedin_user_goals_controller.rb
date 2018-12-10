class LoggedinUserGoalsController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def show
    @user = current_user
    @goal = Goal.find(params[:id])
  end
end
