class AddMonthIdToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :month_id, :integer
    add_column :expenses, :paid, :boolean
  end
end
