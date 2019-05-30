class BookingsController < ApplicationController
  before_action :set_workshop, only: :create
  # skip_before_action :authenticate_user!, only: [:new, :create]

  def create
      @booking = Booking.new(booking_params)
      @booking.workshop = @workshop
      @booking.user = current_user
      if @workshop.capacity >= 1
        if @booking.save
          flash[:notice] = "Your booking has been confirmed"
          redirect_to profile_path
        else
          flash[:alert] = "There was an error, Please try again and make sure all information is correct"
          redirect_to workshop_path(@workshop)
        end
      else
    flash[:alert] = "There are no spaces left."
    end
  end

  private

  def set_workshop
    @workshop = Workshop.find(params[:workshop_id])
  end

  def booking_params
    params.require(:booking).permit(:num_guests)
  end
end
