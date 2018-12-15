class My::TasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :redirect_incorrect_user
  before_action :find_task, except: [:create]

  def create
    @goal = Goal.find(params[:goal_id])
    @task = @goal.tasks.build(task_params.merge(user_id: current_user.id))
    if @task.save!
      redirect_to my_goal_path(@goal)
    else
      render 'goals/show'
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    @goal = @task.goal
    redirect_to my_goal_path(@goal)
  end

  def destroy
    @task.destroy
    @goal = @task.goal
    redirect_to my_goal_path(@goal)
  end

  private
    def task_params
      params.require(:task).permit(:description, :priority, :progress_percent)
    end

    def find_task
      @task = Task.find(params[:id])
    end

    def check_owened_user?
      find_task
      @user = @task.user
      current_user.present? && current_user == @user ? true : false
    end

    def redirect_incorrect_user
      redirect_to root_url unless check_owened_user?
    end


end
