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

  scope :gender, -> gender_id { left_joins(:genders).where("genders.id" => gender_id || Gender.pluck(:id)) }
  scope :region, -> region_id { left_joins(:regions).where("regions.id" => region_id || Region.pluck(:id)) }
  scope :extent, -> extent_id { left_joins(:extents).where("extents.id" => extent_id || Extent.pluck(:id)) }
  scope :communicatable, -> communicatable_id { left_joins(:communicatables).where("communicatables.id" => communicatable_id || Communicatable.pluck(:id)) }
  scope :intervention, -> intervention_id { left_joins(:interventions).where("interventions.id" => intervention_id || Intervention.pluck(:id)) }
  scope :span, -> span_id { left_joins(:spans).where("spans.id" => span_id || Span.pluck(:id)) }

  def rated?(user_id)
    self.rates.where(user_id: user_id).count != 0
  end

  def rate
    self.rates.average(:rate).to_f
  end

  def self.reserved_by(user)
    ids = Reservation.where(user_id: user.id).map do |r|
      r.adviser_id
    end
    self.where(id: ids)
  end

  def self.search(params)
    self.gender(params[:gender]).region(params[:region]).extent(params[:extent]).
      communicatable(params[:communicatable]).intervention(params[:intervention]).span(params[:span]).uniq
  end
end
