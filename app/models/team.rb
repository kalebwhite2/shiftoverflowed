#team_name: string
#invite_code: string
#admin_invite_code: string
class Team < ApplicationRecord
    has_one :calendar, dependent: :destroy
    has_one :weekly_schedule
    has_many :administrators
    has_many :users
    has_many :shift_types, dependent: :destroy

    after_create :build_dependencies
  
    private
    def build_dependencies
      # We want to have an assosciated calendar so we can access the corresponding shifts through days
      # in that calendar
      build_calendar.save
    end
end
