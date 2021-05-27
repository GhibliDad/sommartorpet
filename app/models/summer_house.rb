class SummerHouse < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :title, :description, :price, :location, :capacity, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [:title, :description, :location, :capacity],
    using: {
      tsearch: { prefix: true }
    }
end
