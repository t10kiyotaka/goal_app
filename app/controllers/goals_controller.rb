class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_goal, except: [:index, :create]
  before_action :redirect_incorrect_user, except: [:index, :show]

  def index
    @goals = Goal.page(params[:page]).per(5)
  end

  def create
    @user = User.find(params[:user_id])
    @user.goals.create!(goal_params)
    redirect_to me_path
  end

  def show
    find_goal
    @user = @goal.user
    redirect_to me_goal_path(@goal) if check_owened_user?
  end

  def edit
  end

  def update
    if @goal.update(goal_params)
      redirect_to me_path
    else
      render 'edit'
    end
  end

  def destroy
    @goal.destroy
    redirect_to me_path
  end


  private
    def goal_params
      params.require(:goal).permit(:description, :priority, :progress_percent)
    end

    def find_goal
      @goal = Goal.find(params[:id])
    end

    def check_owened_user?
      find_goal
      @user = @goal.user
      current_user.present? && current_user == @user ? true : false
    end

    def redirect_incorrect_user
      redirect_to root_url unless check_owened_user?
    end

end
