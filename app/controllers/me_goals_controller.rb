class MeGoalsController < ApplicationController
  def show
    @goal = Goal.find(params[:id])
    @user = @goal.user
    redirect_to goal_path(@goal) unless check_owened_user?
  end

  private
    def check_owened_user?
      @goal = Goal.find(params[:id])
      @user = @goal.user
      current_user.present? && current_user == @user ? true : false
    end
end
