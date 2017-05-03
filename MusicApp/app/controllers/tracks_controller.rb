class TracksController < ApplicationController
  before_action :require_login

  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def index
    @tracks = Track.all
    render :index
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  def create
    @track = Track.new(track_params)
    if @track.save!
      redirect_to track_url(@track)
    else
      flash[:errors] << "Can't create this track"
      redirect_to new_track_url
    end
  end

  def update
    @track = Track.update_attributes(track_params)
    if @track.save!
      redirect_to track_url(@track)
    else
      flash[:errors] << "Can't update this track"
      redirect_to track_url(@track)
    end
  end

  def destroy
  end

  private
  def track_params
    params.require(:track).permit(:title, :lyrics, :ord, :track_type, :album_id)
  end
end
