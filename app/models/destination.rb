class Destination < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  validates :name, presence: true, length: { maximum: 100 }
  validates :location, presence: true, length: { maximum: 100 }
  validates :image_url, presence: true
  validates :price_per_day, presence: true, numericality: true
  validates_association :reservations
end
