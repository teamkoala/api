class AddFinishedToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :finished, :boolean, default: false
  end
end
