class Product < ActiveRecord::Base
  # default_scope  {where.not(deleted_at: '')}
  has_many :orders

  validates_presence_of :name, :price, :original_stock
end
