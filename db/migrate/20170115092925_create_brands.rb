class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string  :name
      t.string  :phone
      t.string  :website
      t.string  :address
    end
  end
end
