class OrdersController < ApplicationController
  def new
    @animal = Animal.find(params[:animal_id])
    @order = Order.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @order = Order.new
    authorize @animal
    @order.animal = @animal
    @order.user = current_user
    if @order.save
      redirect_to animal_path(@animal), alert: 'order was successfully created, check your email for contact.'
    else
      render 'animal/show'
    end
  end

  def edit
    # @animal = Animal.find(params[:animal_id])
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    # @animal = Animal.find(params[:animal_id])
    @order = Order.find(params[:id])
    authorize @order
    @order.update(order_params)
    if @order.save
      redirect_to animal_path(@order.animal)
    else
      render :edit
    end
  end

  def destroy
    # @animal = Animal.find(params[:animal_id])
    @order = Order.find(params[:id])
    authorize @order
    @animal = @order.animal
    @order.destroy
    redirect_to animal_path(@animal)
  end

  private

  def order_params
    params.require(:order).permit(:adopted, :user_id, :animal_id)
  end
end
