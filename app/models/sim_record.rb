class SimRecord < ActiveRecord::Base
  acts_as_paranoid
  belongs_to :brand
  belongs_to :employee

  validates_presence_of :brand, :employee
end
