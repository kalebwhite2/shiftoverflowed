class WeeklyAvailability < ApplicationRecord
    has_many :days
    has_many :shifts, through: :day
    belongs_to :user
end
