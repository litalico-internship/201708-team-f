class Intervention < ApplicationRecord
  has_many :advisers, through: :adviser_interventions
end
