class Picture < ApplicationRecord
  has_one_attached :image
  validates :title, :image, presence: true
end
