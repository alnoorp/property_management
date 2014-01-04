class BuildingsController < ApplicationController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
  end

  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to buildings_path, notice: 'Building successfully saved'
    else
      render :new
    end
  end

  private

    def set_building
      @building = Building.find(params[:id])
    end

    def building_params
      params.require(:building).permit(:street_address, :city, :state, :postal_code, :description)
    end
end
