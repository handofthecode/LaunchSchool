class Clock
  def self.at(hour, minute = 0)
    Clock.new(hour, minute)
  end

  def initialize(hour, minute)
    @hours, @minutes = hour, minute
  end

  def to_s
    format('%02d:%02d', @hours % 24, @minutes)
  end

  def +(more_minutes)
    @minutes += more_minutes
    if @minutes > 60
      multiple = @minutes / 60.0
      @minutes = ((multiple - multiple.floor) * 60).round
      @hours += multiple.floor
    end
    to_s
  end

  def -(less_minutes)
    @minutes -= less_minutes
    if @minutes < 0
      multiple = @minutes / 60.0
      @minutes = (60 + (multiple - multiple.ceil) * 60).round
      @hours += multiple.ceil - 1
    end
    to_s
  end

  def ==(clock)
    to_s == clock.to_s
  end
end
