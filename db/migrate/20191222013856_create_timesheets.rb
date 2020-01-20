class CreateTimesheets < ActiveRecord::Migration[5.1]
  def change
    create_table :timesheets do |t|
      t.date :signed_in
      t.integer :user_id
      t.timestamps
    end
  end
end
