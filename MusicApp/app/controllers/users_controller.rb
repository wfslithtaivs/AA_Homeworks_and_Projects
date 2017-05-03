class UsersController < ApplicationController
  before_action :require_login, only: [:show]
  
  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save!
      log_in_user!(user)
      redirect_to user_url(user)
    else
      flash[:errors] <<"Can't create user"
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
