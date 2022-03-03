class OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.save
      redirect_to animal_path(@order.animal)
    else
      render :edit
    end
  end
end
