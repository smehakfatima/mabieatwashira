class Employee < ActiveRecord::Base
  has_many :sim_records

  validates_presence_of :name
end
