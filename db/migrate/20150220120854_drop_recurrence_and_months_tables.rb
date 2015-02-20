class DropRecurrenceAndMonthsTables < ActiveRecord::Migration
  def change
    drop_table :recurrences
    drop_table :monthly_budgets
    drop_table :months
  end
end
