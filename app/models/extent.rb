class Extent < ApplicationRecord
  has_many :advisers, through: :adviser_extents
end
