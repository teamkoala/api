class OrdersController < ApplicationController
  def index
    @orders = Order.all
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
end
