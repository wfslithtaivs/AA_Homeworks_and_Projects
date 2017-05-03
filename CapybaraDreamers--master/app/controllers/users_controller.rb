class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_url(@user)
      login_user!(@user)
    else
      flash[:errors] = "Broken at create User"
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      flash[:errors] << "No user found"
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
