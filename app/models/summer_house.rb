class SummerHouse < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :description, :price, :location, :capacity, presence: true
end
