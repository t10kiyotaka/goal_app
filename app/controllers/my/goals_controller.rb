class My::GoalsController < ApplicationController
  before_action :find_goal, except: %i[create]

  def show
    @user = @goal.user
  end

  def create
    @user = current_user
    @user.goals.create!(goal_params)
    redirect_to me_path
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
