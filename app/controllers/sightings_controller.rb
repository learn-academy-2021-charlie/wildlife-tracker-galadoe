class SightingsController < ApplicationController
  def index
    sightings = Sighting.where(date: params[:start_date]..params[:end_date])
    render json: sightings
  end

  def create
    sighting = Sighting.find(params[:id])
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
    end
  end

  def update
    animal = Animal.find(params[:id])
    animal.update(sighting_params)
    render json: sighting
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    render json: sighting
  end


  private
  def sighting_params
    params.require(:sighting).permit(:animal_id, :date, :latitude, :longitude)
  end

end
