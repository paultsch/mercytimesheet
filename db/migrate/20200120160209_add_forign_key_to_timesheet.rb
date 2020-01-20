class AddForignKeyToTimesheet < ActiveRecord::Migration[5.1]
  def change
    remove_column :timesheets, :user_id, :integer
    add_column :timesheets, :user_id, :integer, references: :user
    add_foreign_key :timesheets, :users, column: :user_id, primary_key: :id
  end
end
