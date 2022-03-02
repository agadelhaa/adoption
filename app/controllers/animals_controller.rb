class AnimalsController < ApplicationController
  def index
    @animals = Animal.all

  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      redirect_to animals_path, notice: 'animal was successfully created.'
    else
      render :new
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :gender, :size, :specie, :description)
  end
end
