class Gender < ApplicationRecord
  has_many :advisers, through: :adviser_genders
end
