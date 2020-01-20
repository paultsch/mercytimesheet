class CreateCreateYearsTables < ActiveRecord::Migration[5.1]
  def change
    create_table :years do |t|
      t.string :year
      t.timestamps
    end
    add_column :timesheets, :year_id, :integer, references: :year
    add_foreign_key :timesheets, :years, column: :year_id, primary_key: :id
  end
end
