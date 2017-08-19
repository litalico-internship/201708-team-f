class Span < ApplicationRecord
  has_many :advisers, through: :adviser_spans
end
