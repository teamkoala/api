class PaymentsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    sse = Eventer::SSE.new(response.stream)

    sse.write({rar: 'yes'})
    begin
      LineItem.on_line_item_create do
        sse.write({ line_item: LineItem.last})
        sleep 1
      end
    end
  ensure
    sse.close
  end
end
