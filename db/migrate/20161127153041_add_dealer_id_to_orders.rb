class AddDealerIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :dealer_id, :integer
    add_column :orders, :comments, :string
  end
end
