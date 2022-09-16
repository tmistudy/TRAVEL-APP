class Room < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reservations

  validates :room_name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :image, presence: true

end
