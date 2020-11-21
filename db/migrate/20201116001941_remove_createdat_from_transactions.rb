class RemoveCreatedatFromTransactions < ActiveRecord::Migration[6.0]
  def change
    remove_column :transactions, :createdat, :date
  end
end
