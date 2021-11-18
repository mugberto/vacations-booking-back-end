class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :user_id, presence: true
  validates :destination_id, presence: true
  validates :startingDay, presence: true
  validates :endingDay, presence: true

  def total_cost
    @days = (endingDay - startingDay).to_i
    @days * destination.price_per_day.to_i
  end
end
