class Room < ApplicationRecord
  belongs_to  :coworkingspace
  has_one_attached :pic
end
