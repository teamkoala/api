class AddPrettyNameToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :pretty_name, :string
  end
end
