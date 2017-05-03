class BandsController < ApplicationController
  before_action :require_login

  def new
    @band = Band.new
    render :new
  end

  def index
    @bands = Band.all
    render :index
  end

  def show

    @band = Band.find_by(id: params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save!
      redirect_to band_url(@band)
    else
      flash[:errors] << "Can't create this band"
      redirect_to band_new_url
    end
  end

  def update
    @band = Band.update_attributes(band_params)
    if @band.save!
      redirect_to band_url(@band)
    else
      flash[:errors] << "Can't update this band"
      redirect_to band_url(@band)
    end
  end

  def destroy
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
