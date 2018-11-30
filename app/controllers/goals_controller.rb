class GoalsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @user.goals.create!(goal_params)
    redirect_to user_path(@user)
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    redirect_to user_path(current_user)
  end


  private
    def goal_params
      params.require(:goal).permit(:description, :priority, :progress_percent)
    end

end
