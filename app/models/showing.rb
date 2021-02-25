class Showing < ApplicationRecord
  belongs_to :show
  has_many :bookings
end
