class AnimalSerializer < ActiveModel::Serializer
  attributes :id , :name , :quantity
  belongs_to :farm
end
