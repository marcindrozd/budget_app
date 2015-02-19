class CreateMonthlyBudgets < ActiveRecord::Migration
  def change
    create_table :monthly_budgets do |t|
      t.integer :total
      t.timestamps
    end
  end
end
