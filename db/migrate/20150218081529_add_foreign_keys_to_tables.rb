class AddForeignKeysToTables < ActiveRecord::Migration
  def change
    add_column :expenses, :account_id, :integer
    add_column :accounts, :user_id, :integer
    add_column :recurrences, :expense_id, :integer
  end
end
