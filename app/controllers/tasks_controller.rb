class TasksController < ApplicationController
  before_action :authenticate_user!

  def create
    @goal = Goal.find(params[:goal_id])
    @user = User.find_by(id: @goal.user_id)
    @goal.tasks.build(task_params.merge(user_id: @user.id))
    if @goal.save!
      redirect_to mygoal_path(@goal)
    else
      render 'goals/show'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    @goal = @task.goal
    redirect_to mygoal_path(@goal)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @goal = @task.goal
    redirect_to mygoal_path(@goal)
  end

  private
    def task_params
      params.require(:task).permit(:description, :priority, :progress_percent)
    end


end
