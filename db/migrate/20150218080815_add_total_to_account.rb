class AddTotalToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :total, :decimal
    add_column :expenses, :amount, :decimal
  end
end
