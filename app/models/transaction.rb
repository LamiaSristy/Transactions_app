class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  scope :without_group, -> { where('group_id IS NULL') }
  scope :with_group, -> { where('group_id > 0') }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
