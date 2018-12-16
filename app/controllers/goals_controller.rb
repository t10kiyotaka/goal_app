class GoalsController < ApplicationController
  before_action :find_goal, except: [:index, :create]

  def index
    @goals = Goal.page(params[:page]).per(5)
  end

  def show
    find_goal
    @user = @goal.user
  end

  private
    def goal_params
      params.require(:goal).permit(:description, :priority, :progress_percent)
    end

    def find_goal
      @goal = Goal.find(params[:id])
    end

end
