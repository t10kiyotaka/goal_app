class LikesController < ApplicationController

  def create
    @goal = Goal.find(params[:goal_id])
    @goal.likes.create!(goal_id: @goal.id, user_id: current_user.id)
    redirect_to goal_path(@goal)
  end

  def destroy
    @like = Like.find_by(goal_id: params[:id], user_id: current_user.id)
    @like.destroy
    @goal = @like.goal
    redirect_to goal_path(@goal)
  end

end
