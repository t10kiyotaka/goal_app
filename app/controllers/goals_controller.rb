class GoalsController < ApplicationController
  def index
    @goals = Goal.all
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save!
      redirect_to goals_path
      flash[:success] = "Successfully Created!"
    else
      render 'new'
    end
  end

  private
    def goal_params
      params.require(:goal).permit(:description, :priority, :progress_percent)
    end
end
