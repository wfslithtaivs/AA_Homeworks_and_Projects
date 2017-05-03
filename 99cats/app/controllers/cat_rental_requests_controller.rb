class CatRentalRequestsController < ApplicationController
  def index
    @catquests = CatRentalRequest.all
    render :index
  end

  def show
    @catquest = CatRentalRequest.find_by(id: params[:id])

    if @catquest
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end

  def new
    @catquest = CatRentalRequest.new
    render :new
  end

  def create
    @catquest = CatRentalRequest.new(catquest_params)
    if @catquest.save!
      redirect_to cat_rental_requests_url(@catquest)
    else
      render :new
    end
  end

  private

  def catquest_params
    params.require(:catquest).permit(:cat_id, :start_date, :end_date, :status)
  end

end
