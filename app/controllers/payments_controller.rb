class PaymentsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300, event: 'payment-streaming')

    begin
      LineItem.on_line_item_create do
        sse.write({
                    type: 'new line item',
                    line_item_id: LineItem.id,
                    line_item: LineItem.last.item.name
                  })
        sleep 1
      end
    end
  ensure
    sse.close
  end
end
