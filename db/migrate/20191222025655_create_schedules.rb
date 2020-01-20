class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.date :date
      t.boolean :before_after_school
      t.boolean :during_school
      t.timestamps
    end
    (Date.new(2020,1,6)..Date.new(2020,6,1)).each do |date|
      Schedule.create(:date => date )
    end
  end

end
