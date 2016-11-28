class Dealer < ActiveRecord::Base
  has_many :orders

  validates_presence_of :name
end
