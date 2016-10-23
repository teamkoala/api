class PaymentsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    sse = Eventer::SSE.new(response.stream)

    begin
      LineItem.on_line_item_create do
        sse.write({ line_item: LineItem.last.order.name})
      end
    end
  ensure
    sse.close
  end
end
