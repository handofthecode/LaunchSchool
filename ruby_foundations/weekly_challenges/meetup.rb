require 'date'
class Meetup
  WEEK_DAY = { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, 
               friday: 5, saturday: 6, sunday: 7 }.freeze
  def initialize(month, year)
    @year, @month = year, month
    @week_of_month = { teenth: (13..19), first: (1..7), second: (8..14), 
                      third: (15..21), fourth: (22..28), 
                      last: ((last_week - 6)..last_week) }.freeze
  end
  
  def day(week_day, schedule)
    @week_of_month[schedule].each do |day| 
      if Date.new(@year, @month, day).cwday == WEEK_DAY[week_day]
        return Date.new(@year, @month, day)
      end
    end
  end

  def last_week
     (Date.new(@year, @month).next_month - Date.new(@year, @month)).to_i
  end
end
