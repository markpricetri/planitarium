class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :showing

  validates :no_of_people, presence: true, numericality: { only_integer: true }
end
