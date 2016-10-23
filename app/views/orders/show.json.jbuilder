json.order do
  json.id @order.id
  json.finished @order.finished
  json.state @order.state
  json.line_items do
    json.array! @order.line_items do |line_item|
      json.line_item do
        json.name line_item.item.name
        json.pretty_name line_item.item.pretty_name
        json.price line_item.item.price
      end
    end
  end
end
