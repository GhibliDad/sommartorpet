class SummerHouse < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  validates :title, :description, :address, :price, :city, :capacity, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description,
    against: [:title, :description, :city, :capacity],
    using: {
      tsearch: { prefix: true }
    }
end
