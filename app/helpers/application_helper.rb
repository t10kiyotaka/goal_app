module ApplicationHelper

  def user_owned_goal?
    @goal = Goal.find(params[:id])
    if !!current_user
      @goal.user_id == current_user.id ? true : false
    end
  end

  def logged_in_user?
    @user = User.find(params[:id])
    if !!current_user
      @user.id == current_user.id ? true : false
    end
  end

  def order_hash
    order_hash = { "Recently updated": "Recently updated",
                   "Recently created": "Recently created",
                   "Least recently updated": "Least recently updated",
                   "Least recently created": "Least recently updated",
                   "Most liked": "Most liked"
                   }
  end

end
