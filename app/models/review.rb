class Review < ApplicationRecord
  belongs_to :show
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }, numericality: { only_integer: true }

  include PgSearch::Model
  pg_search_scope :search_by_content,
    against: [ :content ],
    using: {
      tsearch: { prefix: true }
    }
end
