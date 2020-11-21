class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.date :createdat
      t.integer :amount
      t.timestamps
    end
  end
end
