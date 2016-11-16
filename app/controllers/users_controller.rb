class UsersController < ApplicationController
  # before_action :authenticate, except: [:login]

  def index
    render :json => User.all, status: 200
  end

  def create
    user = User.create(user_params)

    if user.valid?
      render :json => user, status: 201
    else
      render :json => {error: "Error creating user"},
                      status: 400
    end
  end

  def edit
    user = User.find(params[:id])

    render :json => user, status: 200
  end

  def update
    user = User.find(params[:id])
          .update_attributes(user_params)

    if user
      render :json => {success: "User updated successfully"},
                      status: 204
    else
      render :json => {error: "Error updating user"},
                      status: 400
    end
  end

  def destroy
    user = User.find(params[:id])
          .destroy

    if user.destroyed?
      render :json => {success: "User successfully deleted"},
                      status: 200
    else
      render :json => {error: "Error deleting user"},
                      status: 400
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
