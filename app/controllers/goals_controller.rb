class GoalsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @user.goals.create!(goal_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @goal = @user.goals.find(params[:id])
    @goal.destroy
    redirect_to user_path(@user)
  end


  private
    def goal_params
      params.require(:goal).permit(:description, :priority, :progress_percent)
    end

end
