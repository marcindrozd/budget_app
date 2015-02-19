class RenameStartMonthColumnInExpenses < ActiveRecord::Migration
  def change
    rename_column :expenses, :start_month, :recurrence
  end
end
