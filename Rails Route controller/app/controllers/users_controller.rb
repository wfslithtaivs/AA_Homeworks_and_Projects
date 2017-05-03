class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    # localhost:3000/users?id=1
    # localhost:3000/users?id=10&username=SesanSesanSesan
    user = User.find(params[:id])
    user[:username] = params[:username] unless params[:username].nil?
    user.save
    render json: User.find(params[:id])
  end

  def destroy

    # Finds the user (we can lookup the id in params[:id]) and destroys the object.
    # Best practice is to render the destroyed user after destroying it in the database.
    # Use dependent: :destroy in the artworks and artwork_shares associations on User.
    # This ensures that the associated records are also destroyed.


    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  # app/controller/users_controller.rb
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  private

  def user_params
    params.permit(:username)
  end

end
