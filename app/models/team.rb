class Team < ApplicationRecord
    has_many :ulas
    has_one :calendar
    has_one :weekly_schedule
    has_many :administrators
end
