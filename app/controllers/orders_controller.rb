class OrdersController < ApplicationController
  def finish
    @order = Order.find_by(id: params[:id])

    if @order
      @order.finished = true
      @order.save
    else
      raise ActionController::RoutingError.new('Unprocessable Entry')
    end
  end
end
