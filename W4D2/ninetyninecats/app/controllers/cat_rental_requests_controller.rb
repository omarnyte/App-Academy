class CatRentalRequestsController < ApplicationController

  private

  def request_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date, :status)
  end

end
