class PaymentsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream, retry: 300, event: "event-name")
    loop do
      sse.write({ name: 'John'})
      sleep 20
    end
  ensure
    sse.close
  end
end
