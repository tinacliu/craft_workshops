class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create, :edit, :update]
 # include Pundit

  def index
    # binding.pry
    @workshops = policy_scope(Workshop).where.not(latitude: nil, longitude: nil)
    # binding.pry
    @workshops = @workshops.near(params[:location], 10) if params[:location]
    # binding.pry

    cat_filter = params[:category].blank? ? Workshop::CATEGORY : params[:category]
    l_filter = params[:level].blank? ? Workshop::LEVEL : params[:level]
    min_p = params[:min_p].blank? ? 0 : params[:min_p]
    max_p = params[:max_p].blank? ? 100_000 : params[:max_p]

    sql_query = " \
      category IN (:cat) \
      AND level IN (:l) \
      AND price BETWEEN :min_p AND :max_p \
    "
    # @workshops = @workshops.where('category IN (?) AND level IN (?)', cat_filter, l_filter)
    # binding.pry
    @workshops = @workshops.where(sql_query, cat: cat_filter, l: l_filter, min_p: min_p, max_p: max_p)
    #  binding.pry
    set_markers
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
    authorize @workshop
  end

  def update
    authorize @workshop
    @workshop.update(workshop_params)
    redirect_to workshop_path(@workshop)
  end

  private

  def set_markers
    @markers = @workshops.map do |workshop|
      {
        lat: workshop.latitude,
        lng: workshop.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { workshop: workshop })

      }
    end
  end

  def set_workshop
    @workshop = Workshop.find(params[:id])
   # authorize @workshop
  end

  def workshop_params
    params.require(:workshop).permit(:name, :description, :category, :level, :owner_id, :address,
                                     :price, :date_time, :capacity, :duration, photos_attributes: [:image])
  end
end
