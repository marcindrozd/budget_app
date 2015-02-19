class AddDefaultToExpenses < ActiveRecord::Migration
  def change
    change_column_default :expenses, :paid, false
  end
end
