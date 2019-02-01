class OwnerFarm < ApplicationRecord
  belongs_to :owner
  belongs_to :farm
end
