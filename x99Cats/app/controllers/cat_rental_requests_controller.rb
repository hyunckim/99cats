class CatRentalRequestsController < ApplicationController
  def index
    @catrentalrequests = CatRentalRequest.all
    render :index
  end

  def show
    @catrentalrequest = CatRentalRequest.find_by(id: params[:id])
    render :show
  end

  def new
    @catrentalrequest = CatRentalRequest.new
    render :new
  end

  def create
    @catrentalrequest = CatRentalRequest.new(cat_rental_params)

    if @catrentalrequest.save
      redirect_to cat_rental_request_url(@catrentalrequest)

    else
      render :new
    end
  end

  def edit
    @catrentalreqest =CatRentalRequest.find_by(id: params[:id])
    render :edit
  end

  def update
    @catrentalrequest = CatRentalRequest.find_by(id: params[:id])

    if @catrentalrequest.update(cat_rental_params)
      redirect_to cat_rental_request_url(@catrentalrequest)
    else
      render :edit
    end
  end

private
  def cat_rental_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date)
  end
end
