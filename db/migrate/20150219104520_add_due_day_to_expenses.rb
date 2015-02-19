class AddDueDayToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :due_date, :datetime
  end
end
