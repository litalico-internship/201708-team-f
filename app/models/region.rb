class Region < ApplicationRecord
  has_many :advisers, through: :adviser_regions
end
