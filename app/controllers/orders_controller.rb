class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new(state: 'talking')
    render :show
  end

  def finish
    @order = Order.find_by(id: params[:id])

    if @order
      @order.finished = true
      @order.save
    else
      raise ActionController::RoutingError.new('Unprocessable Entry')
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def destroy_all
    LineItems.delete_all
    Order.delete_all
    head :no_content
  end
end
