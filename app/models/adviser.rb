class Adviser < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :adviser_genders
  has_many :genders, through: :adviser_genders
  has_many :adviser_regions
  has_many :regions, through: :adviser_regions
  has_many :adviser_extents
  has_many :extents, through: :adviser_extents
  has_many :adviser_communicatables
  has_many :communicatables, through: :adviser_communicatables
  has_many :adviser_interventions
  has_many :interventions, through: :adviser_interventions
  has_many :adviser_spans
  has_many :spans, through: :adviser_spans
  has_many :rates, dependent: :destroy

  mount_uploader :avator, ImageUploader
end
