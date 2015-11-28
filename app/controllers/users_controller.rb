class UsersController < ApplicationController
before_filter :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @tips = Tip.where(user_id: @user.id)
  end

end
