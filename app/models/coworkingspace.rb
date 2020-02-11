class Coworkingspace < ApplicationRecord
  belongs_to :user
  has_one_attached :pic
  has_many :rooms
end
