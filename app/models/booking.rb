class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :showing

  validates :no_of_people, presence: true, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_id,
    against: [ :id ],
    using: {
      tsearch: { prefix: true }
    }
end
