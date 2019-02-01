class Animal < ApplicationRecord
  belongs_to :farm

  validates :name , presence: true
  validates :unit_price , presence: true
  validates :quantity , presence: true
  validates :unit_price , numericality: {greater_than_or_equal_to: 1}
  validates :quantity , numericality: {greater_than_or_equal_to: 1}

  def get_price
    self.unit_price * self.quantity
  end
end
