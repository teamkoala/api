json.order do
  json.finished @order.finished
  json.array! @line_items do |line_item|
    json.line_item do
      json.name line_item.item.name
    end
  end
end
