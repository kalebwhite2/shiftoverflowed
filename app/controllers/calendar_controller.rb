class CalendarController < UserController
    def calendar
        find_user

        # Array of days
        @week = []
        i = 0
        while i <= 6
            @week.append(Time.now.advance(days: i))
            i += 1
        end
    end
end