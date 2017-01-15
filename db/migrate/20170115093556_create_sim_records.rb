class CreateSimRecords < ActiveRecord::Migration
  def change
    create_table :sim_records do |t|
      t.integer :brand_id
      t.integer :account_number
      t.integer :sim_resource_number
      t.integer :dp_number
      t.integer :employee_id
      t.datetime :activation_date
      t.boolean :is_delivered
      t.datetime :deleted_at
    end
    add_index :sim_records, :deleted_at
  end
end
