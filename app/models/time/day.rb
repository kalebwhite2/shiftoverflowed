class Day < ApplicationRecord
  has_many :shifts
  belongs_to :weekly_availability, optional: true
  belongs_to :weekly_schedule, optional: true
end
