class Communicatable < ApplicationRecord
  has_many :advisers, through: :adviser_communicatables
end
