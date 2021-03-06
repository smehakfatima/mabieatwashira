class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
  belongs_to :dealer

  validates_presence_of :user, :product, :price, :quantity, :order_type

  validate :update_quantity

  attr_accessor :total_price

  TYPES = [:purchased, :sold]
  enum order_type: TYPES

  def order_type= value
    if value.kind_of?(String) and value.to_i.to_s == value
      super value.to_i
    else
      super value
    end
  end
  def order_type_enum
    TYPES.each_with_index.to_a
  end

  def update_quantity

    product =  self.product

    if self.order_type == "purchased" #selling orders
      if self.dealer.present?
        product.in_stock = product.in_stock + self.quantity
        product.save!
      else
        errors.add(:dealer, "Dealer is required")
        error = true
      end

    else
      if product.in_stock - self.quantity < 0
        errors.add(:quantity, "you entered is less than in stock")
        error = true
      else
        product.in_stock = product.in_stock - self.quantity
        product.save!
      end
    end

  end

end
