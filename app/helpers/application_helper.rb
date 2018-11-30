module ApplicationHelper

  def user_owned_goal
    @goal = Goal.find(params[:id])
    true if @goal.user_id == current_user.id
  end

end
