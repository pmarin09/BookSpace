class Coworkingspace < ApplicationRecord
  belongs_to :user
  has_one_attached :pic
  has_many :space_types
end
