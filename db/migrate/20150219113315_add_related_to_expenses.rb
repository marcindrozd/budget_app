class AddRelatedToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :related_to, :string
  end
end
