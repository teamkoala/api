json.line_item do
  json.id @line_item.item.name
  json.name @line_item.order.user.name
  json.order_id @line_item.order.id
end
