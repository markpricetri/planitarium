class Show < ApplicationRecord
  has_many :reviews
  has_many :showings
  belongs_to :user
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
end
