class Addcartnumbertoorder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :card_number, :string
    add_column :orders, :payment_type, :string
  end
end
