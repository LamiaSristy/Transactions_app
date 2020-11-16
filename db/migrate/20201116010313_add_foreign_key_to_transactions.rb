class AddForeignKeyToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :author, references: :users, index: true
    add_foreign_key :transactions, :users, column: :author_id

    add_reference :transactions, :group, foreign_key: true    
  end
end
