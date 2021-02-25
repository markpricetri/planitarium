class Showing < ApplicationRecord
  belongs_to :show
  has_many :bookings

  validates :capacity, presence: true, numericality: { less_than_or_equal_to: 50, only_integer: true }
  validates :start_time, presence: true
end
