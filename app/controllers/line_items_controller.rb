class LineItemsController < ApplicationController
  def create
    item = Item.find_by(id: params[:item_id])
    order = Order.find_by(id: params[:order_id])

    if item
      if order
        @line_item = LineItem.create!(item: item, order: order)
        render :show
      else
        new_order = Order.create!(user: User.create(name: 'John Doe'))
        @line_item = LineItem.create!(item: item, order: new_order)
        render :show
      end
    else
      raise ActionController::RoutingError.new('Unprocessable Entry')
    end
  end

  def show
  end
end
