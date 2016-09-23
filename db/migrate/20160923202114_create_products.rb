class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :name
      t.string  :description
      t.float   :price
      t.integer :original_stock
      t.integer :in_stock
      t.timestamp        :deleted_at
      t.timestamps null: false
    end
  end
end
