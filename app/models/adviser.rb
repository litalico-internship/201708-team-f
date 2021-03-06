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

  scope :gender, -> gender_id { includes(:genders).where("genders.id" => gender_id || Gender.pluck(:id)) }
  scope :region, -> region_id { includes(:regions).where("regions.id" => region_id || Region.pluck(:id)) }
  scope :extent, -> extent_id { includes(:extents).where("extents.id" => extent_id || Extent.pluck(:id)) }
  scope :communicatable, -> communicatable_id { left_joins(:communicatables).where("communicatables.id" => communicatable_id || Communicatable.pluck(:id)) }
  scope :intervention, -> intervention_id { left_joins(:interventions).where("interventions.id" => intervention_id || Intervention.pluck(:id)) }
  scope :span, -> span_id { left_joins(:spans).where("spans.id" => span_id || Span.pluck(:id)) }
  scope :age, -> age { where("min_age <= ?", age || 100).where("max_age >= ?", age || 0) }

  DATES = ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]

  def rated?(user_id)
    self.reservations.where(user_id: user_id).count != 0 && self.rates.where(user_id: user_id).count != 0
  end

  def day_string
    DATES[self.day]
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
    self.gender(params[:gender]).region(params[:region]).extent(params[:extent]).age(params[:age]).
      communicatable(params[:communicatable]).intervention(params[:intervention]).span(params[:span]).uniq
  end
end
