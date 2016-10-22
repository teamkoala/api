class ItemsController < ApplicationController
  def query
    item = Item.find_by(name: params[:name])

    if item
      @item = item
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end
end
