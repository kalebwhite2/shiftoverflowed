class WeeklyAvailability < ApplicationRecord
    has_many :days
    has_hany :shifts, through: :day
    belongs_to :user
end
