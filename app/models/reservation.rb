class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :destination

  validates :user_id, presence: true
  validates :destination_id, presence: true
  # commented for testing purposes
  # validates :startingDay, presence: true
  # validates :endingDay, presence: true
end
