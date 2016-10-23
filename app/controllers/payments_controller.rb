class PaymentsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300, event: "line_item")

    begin
      LineItem.on_line_item_create do
        sse.write({ line_item: LineItem.last})
      end
    end
  ensure
    sse.close
  end
end
