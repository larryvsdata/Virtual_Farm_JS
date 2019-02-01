class Farm < ApplicationRecord

  has_many :animals
  has_many :owner_farms
  has_many :owners , through: :owner_farms


  validates :name , presence: true

  # def initialize
  #   self.get_description()
  # end

  def get_value
    value= 0
    self.animals.each do |animal|
      value+=animal.get_price
    end
    value
  end

  def get_description
      description ="Farm "+ self.name + " is worth " + get_value.to_s + " and has "
      self.animals.each do |animal|
        description += animal.quantity.to_s + ' ' + animal.name + "(s) "
      end
      self.description = description
      self.save
      description
  end

  def self.get_available_farms
    where(available: true)
  end

end
