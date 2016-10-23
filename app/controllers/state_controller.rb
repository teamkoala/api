class StateController < ApplicationController
  def index
    @state = 'talking'
    @orders = Order.all
  end
end
