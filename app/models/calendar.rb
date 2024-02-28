class Calendar < ApplicationRecord
  has_many :weekly_schedules
  belongs_to :team
end
