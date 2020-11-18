class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  scope :without_group, -> (author_id) { where('group_id IS NULL and author_id=?', author_id) }
  scope :with_group, -> (author_id){ where('group_id > 0 and author_id=?', author_id) }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
