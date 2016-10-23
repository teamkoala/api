json.order do
  json.id @order.id
  json.finished @order.finished
  json.line_items do
    json.array! @order.line_items do |line_item|
      json.line_item do
        json.name line_item.item.name
      end
    end
  end
end
