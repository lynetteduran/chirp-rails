class ChirpsController < ApplicationController

  def index
    render :json => Chirp.all, status: 200
  end

end
