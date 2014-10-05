class Day < ActiveRecord::Base
  belongs_to :competition
  validates :competition, presence: true

  validates :date, presence: true
  validates :date, uniqueness: { scope: :competition_id }, allow_nil: true

  validates :entrance_fee_competitors, presence: true
  validates :entrance_fee_competitors, numericality: {
    only_integer: false,
    greater_than_or_equal_to: 0
  }, allow_nil: true

  validates :entrance_fee_guests, presence: true
  validates :entrance_fee_guests, numericality: {
    only_integer: false,
    greater_than_or_equal_to: 0
  }, allow_nil: true

  has_many :events, dependent: :destroy
  has_many :registrations, class_name: 'DayRegistration', dependent: :destroy
  has_many :competitors, through: :registrations

  scope :with_events, ->{ joins(:events).select('DISTINCT(days.id), days.*') }
end
