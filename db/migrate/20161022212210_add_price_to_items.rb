class AddPriceToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :price, :integer, default: 100
  end
end
