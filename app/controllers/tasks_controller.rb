class TasksController < ApplicationController
  def create
    @goal = Goal.find(params[:goal_id])
    @user = User.find_by(id: @goal.user_id)
    @task = Task.new(description: params[:task][:description],
                     priority: params[:task][:priority],
                     progress_percent: params[:task][:progress_percent],
                     user_id: @user.id,
                     goal_id: @goal.id)
    if @task.save!
      redirect_to goal_path(@goal)
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
    @goal = Goal.find_by(id: @task.goal_id)
    redirect_to goal_path(@goal)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @goal = Goal.find_by(id: @task.goal_id)
    redirect_to goal_path(@goal)
  end

  private
    def task_params
      params.require(:task).permit(:description, :priority, :progress_percent)
    end


end
