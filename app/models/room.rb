class Room < ApplicationRecord
  belongs_to  :coworkingspace
  has_one_attached :pic
  has_many :reservations
end
