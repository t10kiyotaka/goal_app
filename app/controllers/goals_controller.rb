class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_goal, except: [:create]

  def create
    @user = User.find(params[:user_id])
    @user.goals.create!(goal_params)
    redirect_to user_path(@user)
  end

  def show
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @goal.destroy
    redirect_to user_path(current_user)
  end


  private
    def goal_params
      params.require(:goal).permit(:description, :priority, :progress_percent)
    end

    def find_goal
      @goal = Goal.find(params[:id])
    end

end
