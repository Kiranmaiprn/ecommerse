class Removecolumnsfromorders < ActiveRecord::Migration[7.0]
  def change
    # remove_column :orders, :users_id
    # remove_column :orders, :carts_id
    add_reference :orders, :user, foreign_key: true
  
  end
end
