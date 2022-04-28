class PlantsController < ApplicationController
  wrap_parameters format: []

  # GET /plants
  def index
    plants = Plant.all
    render json: plants, except: [:created_at, :updated_at]
  end

  # GET /plants/id
  def show
    plant = Plant.find_by(id: params[:id])
    render json: plant, except: [:created_at, :updated_at]
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, except: [:created_at, :updated_at], status: :created
  end

  private

  def plant_params
    params.permit(:name, :image, :price)
  end

end
