class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show

  validates :no_of_people, presence: true
end
