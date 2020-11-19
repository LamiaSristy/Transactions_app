class Transaction < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true

  belongs_to :author, class_name: 'User'
  belongs_to :group, optional: true

  scope :without_group, ->(author_id) { where('group_id IS NULL and author_id=?', author_id) }
  scope :with_group, ->(author_id) { where('group_id > 0 and author_id=?', author_id) }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  scope :expense_per_group, ->(author_id) { left_outer_joins(:group).where('author_id=?', author_id).group('groups.name').select("groups.name as group_name, sum(amount) as sum") }
end
