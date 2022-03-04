class AnimalsController < ApplicationController
  skip_after_action :verify_authorized, except: [:home]
  def index
    @animals = policy_scope(Animal).order(created_at: :desc)
    @animals = Animal.all
  end

  def new
    @animal = Animal.new
  end

  def create

    @animal = Animal.new(animal_params)
    authorize @animal
    @animal.user = current_user

    if @animal.save
      redirect_to animals_path, notice: 'animal was successfully created.'
    else
      render :new
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @adopted = @animal.orders.select { |animal| animal.adopted }
  end

  def edit
    @animal = Animal.find(params[:id])
  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)
    if @animal.save
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    redirect_to animals_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :gender, :age, :size, :specie, :description, photos: [])
  end
end
