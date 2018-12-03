class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_goal, except: [:index, :create]

  def index
    @goals = Goal.page(params[:page]).per(5)
  end

  def create
    @user = User.find(params[:user_id])
    @user.goals.create!(goal_params)
    redirect_to user_path(@user)
  end

  def show
    find_goal
    @user = User.find_by(id: @goal.user_id)
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
