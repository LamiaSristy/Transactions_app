class Group < ApplicationRecord
  mount_uploader :icon, ImageUploader

  validates :name, presence: true  

  belongs_to :user
  has_many :transactions

  def self.find_by_first_letter(letter)
    where('name LIKE ?', "#{letter}%").order('name ASC')
  end
end
