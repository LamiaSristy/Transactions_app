class Group < ApplicationRecord
  mount_uploader :icon, ImageUploader

  validates :name, presence: true  

  belongs_to :user
  has_many :transactions
end
