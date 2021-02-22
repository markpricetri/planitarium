class Show < ApplicationRecord
  has_many :bookings
  belongs_to :user

  SHOWTIMES = (9..22).to_a
  validates :capacity, presence: true, numericality: { less_than_or_equal_to: 50, only_integer: true }
  validates :name, presence: true
  validates :start_time, presence: true, inclusion: { in: SHOWTIMES }
end
