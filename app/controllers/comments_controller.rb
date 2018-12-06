class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @goal = Goal.find(params[:goal_id])
    @comment = @goal.comments.build(comment_params.merge(user_id: current_user.id))
    if @comment.save!
      respond_to do |format|
        format.html { redirect_to goal_path(@goal) }
        format.js
      end
    else
      render 'goals/show'
    end
  end

  def edit
    find_comment
  end

  def update
    find_comment
    @comment.update(comment_params)
    @goal = @comment.goal_id
    redirect_to goal_path(@goal)
  end

  def destroy
    find_comment
    @comment.destroy
    @goal = @comment.goal_id
    respond_to do |format|
      format.html { redirect_to goal_path(@goal) }
      format.js
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def find_comment
      @comment = Comment.find(params[:id])
    end
end
