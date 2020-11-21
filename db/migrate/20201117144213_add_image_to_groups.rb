class AddImageToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :icon, :string
  end
end
