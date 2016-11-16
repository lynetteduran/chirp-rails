class UsersController < ApplicationController
  before_action :authenticate, except: [:login]

  def index
    render :json => User.all, status: 200
  end

end
