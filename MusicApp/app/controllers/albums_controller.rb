class AlbumsController < ApplicationController
  before_action :require_login

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def index
    @albums = Album.all
    render :index
  end

  def show
    @album = Album.find_by(id: params[:id])
    @tracks = Track.find_by(album_id: @album.id)
    render :show
  end

  def create
    @album = Album.new(album_params)
    if @album.save!
      redirect_to album_url(@album)
    else
      flash[:errors] << "Can't create this album"
      redirect_to album_new_url
    end
  end

  def update
    @album = Album.update_attributes(album_params)
    if @album.save!
      redirect_to album_url(@album)
    else
      flash[:errors] << "Can't update this album"
      redirect_to album_url(@album)
    end
  end

  def destroy
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :album_type, :band_id)
  end
end
