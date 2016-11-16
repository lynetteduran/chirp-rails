class ChirpsController < ApplicationController

  def index
    render :json => Chirp.all, status: 200
  end

  def create
    chirp = Chirp.create(chirp_params)

    if chirp.valid?
      render :json => chirp, status: 201
    else
      render :json => {error: "Aw, chirp not chirped!"},
                      status: 400
    end
  end

  def edit
    chirp = Chirp.find(params[:id])

    render :json => chirp, status: 200
  end

  def update
    chirp = Chirp.find(params[:id])
            .update_attributes(chirp_params)

    if chirp
      render :json => {success: "Chirp updated!"},
                      status: 204
    else
      render :json => {error: "Oops, your chirp wasn't chirped :("},
                      status: 400
    end
  end

  def destroy
    chirp = Chirp.find(params[:id])
            .destroy

    if chirp.destroyed?
      render :json => {success: "You killed your chirp! I hope you're happy :/"},
                      status: 200
    else
      render :json => {error: "You failed at killing your chirp. Maybe you need practice"},
                      status: 400
    end
  end

  private

  def chirp_params
    params.require(:chirp).permit(:chirp_text)
  end

end
