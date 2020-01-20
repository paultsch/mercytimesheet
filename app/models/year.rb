class Year < ApplicationRecord
  has_many :timesheets
  has_many :schedules
end
