json.orders do
  json.array! @orders do |order|
    json.id order.id
    json.state order.state
    json.finished order.finished
    json.line_items do
      json.array! order.line_items do |line_item|
        json.line_item do
          json.name line_item.item.name
          json.price line_item.item.price
        end
      end
    end
  end
end
