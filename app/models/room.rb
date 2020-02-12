class Room < ApplicationRecord
  belongs_to  :coworkingspace
  belongs_to  :user
  has_one_attached :pic
end
