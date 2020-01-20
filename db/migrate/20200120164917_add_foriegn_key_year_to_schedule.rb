class AddForiegnKeyYearToSchedule < ActiveRecord::Migration[5.1]
  def change
    add_column :schedules, :year_id, :integer, references: :year
    add_foreign_key :schedules, :years, column: :year_id, primary_key: :id
  end
end
