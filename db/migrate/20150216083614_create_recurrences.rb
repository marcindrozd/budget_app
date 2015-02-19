class CreateRecurrences < ActiveRecord::Migration
  def change
    create_table :recurrences do |t|
      t.string :frequency
      t.timestamps
    end
  end
end
