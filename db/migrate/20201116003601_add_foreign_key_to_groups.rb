class AddForeignKeyToGroups < ActiveRecord::Migration[6.0]
  def change    
    add_reference :groups, :user, foreign_key: true
  end
end
