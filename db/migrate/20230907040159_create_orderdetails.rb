class CreateOrderdetails < ActiveRecord::Migration[7.0]
  def change
    create_table :orderdetails do |t|
      t.references :order, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
