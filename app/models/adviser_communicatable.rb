class AdviserCommunicatable < ApplicationRecord
  belongs_to :adviser
  belongs_to :communicatable
end
