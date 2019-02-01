class FarmSerializer < ActiveModel::Serializer
  attributes :id , :name ,:description
	# has_many :animals

	has_many :animals
  # has_many :owner_farms
  # has_many :owners , through: :owner_farms
  has_many :owners
end
