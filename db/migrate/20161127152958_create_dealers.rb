class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :address
      t.string :phone
      t.string :website
    end
  end
end
