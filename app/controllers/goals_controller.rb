class GoalsController < ApplicationController
  before_action :find_goal, only: %i[show]
  before_action :redirect_owened_user, only: %i[show]

  def index
    @goals = Goal.page(params[:page]).per(5).order(created_at: :desc)
    case params[:order]
    when "Recently updated"
      @goals = Goal.page(params[:page]).per(5).order(updated_at: :desc)
    when "Recently created"
      @goals = Goal.page(params[:page]).per(5).order(created_at: :desc)
    when "Least recently updated"
      @goals = Goal.page(params[:page]).per(5).order(updated_at: :asc)
    when "Least recently created"
      @goals = Goal.page(params[:page]).per(5).order(created_at: :asc)
    end
  end

  def show
    @user = @goal.user
  end

  private
    def goal_params
      params.require(:goal).permit(:description, :priority, :progress_percent)
    end

    def find_goal
      @goal = Goal.find(params[:id])
    end

    def redirect_owened_user
      @user = @goal.user
      redirect_to my_goal_path(@goal) if current_user.present? && @user == current_user
    end

end
