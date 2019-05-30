class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show, :new]
 # include Pundit

  def index
    @workshops = policy_scope(Workshop).where.not(latitude: nil, longitude: nil)

    @markers = @workshops.map do |workshop|
      {
        lat: workshop.latitude,
        lng: workshop.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { workshop: workshop })

      }
    end
  end

  def show
    @booking = Booking.new
    authorize @workshop
    @markers = [
      {
        lat: @workshop.latitude,
        lng: @workshop.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { workshop: @workshop })
      }
    ]
  end

  def new
    @workshop = Workshop.new
    5.times { @workshop.photos.build }
    authorize @workshop
  end

  def create
    @workshop = Workshop.new(workshop_params)
    authorize @workshop
    @workshop.owner = current_user
    if @workshop.save
      redirect_to workshop_path(@workshop)
    else
      5.times { @workshop.photos.build }
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  private

  def set_workshop
    @workshop = Workshop.find(params[:id])
   # authorize @workshop
  end

  def workshop_params
    params.require(:workshop).permit(:name, :description, :category, :level, :owner_id, :address,
                                     :price, :date_time, :capacity, :duration, photos_attributes: [:image])
  end
end
