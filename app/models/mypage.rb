class Mypage < ApplicationRecord
  mount_uploader :my_img, MyimgUploader
  belongs_to :user

  validates :name, presence: true
end
