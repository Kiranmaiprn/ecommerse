class Addnametoitem < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :item_name, :string
    # remove_column :items, :name
  end
end
