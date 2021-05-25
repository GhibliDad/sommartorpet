class Booking < ApplicationRecord
  belongs_to :summer_house
  belongs_to :user
end
