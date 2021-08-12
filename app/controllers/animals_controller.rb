class AnimalsController < ApplicationController
  def index
    animals = Animal.all
    render json: animals
  end

  def show
    animal = Animal.find(params[:id])
    render json: animal
  end

  def destroy
    animal = Animal.fin(params[:id])
    animal.destroy
    render json: animal
  end

  def create
    animal = Animal.create(animal_params)
    if animal.valid?
      render json: animal
    else
      render json: animal.errors
    end
  end

  private
  def animal_params
    params.require(:animal).permit(:common_name, :latin_latin, :kingdom)
  end
end
