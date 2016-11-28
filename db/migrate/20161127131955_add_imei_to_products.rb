class AddImeiToProducts < ActiveRecord::Migration
  def change
    add_column :products, :imei, :string
    change_column :orders, :created_at,  :date
    change_column :orders, :price,  :float
  end
end
