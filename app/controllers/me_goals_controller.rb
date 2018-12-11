class MeGoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
    @user = @goal.user
  end
end
