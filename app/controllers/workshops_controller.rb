class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :show]
 # include Pundit

  def index
    @workshops = policy_scope(Workshop)
  end

  def show
    authorize @workshop
  end

  def new
    @workshop = Workshop.new
    authorize @workshop
  end

  def create
    @workshop = Workshop.new(workshop_params)
    authorize @workshop
    if @workshop.save
      redirect_to workshop_path(@workshop)
    else
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
                                     :price, :date_time, :capacity, :Longitude, :latitude)
  end
end
