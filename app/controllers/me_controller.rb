class MeController < AuthController
  def show
    @user = current_user
  end
end
