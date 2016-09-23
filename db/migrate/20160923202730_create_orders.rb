class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :order_type
      t.integer :quantity
      t.integer :price
      t.timestamp        :deleted_at
      t.timestamps null: false
    end
  end
end
