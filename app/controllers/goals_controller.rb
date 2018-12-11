class GoalsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_goal, except: [:index, :create]

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

end
