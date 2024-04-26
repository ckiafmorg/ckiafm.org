# frozen_string_literal: true

# Use this example to persist the object to the database
# https://dev.to/viniciuspuerto/using-value-objects-in-ruby-on-rails-3d2

class NaiveTime # rubocop:disable Metrics/ClassLength
  attr_reader :hours, :minutes, :seconds

  def initialize(hours = 0, minutes = 0, seconds = 0)
    raise ArgumentError, 'Hours cannot be negative' if hours.to_i.negative?
    raise ArgumentError, 'Minutes cannot be negative' if minutes.to_i.negative?
    raise ArgumentError, 'Seconds cannot be negative' if seconds.to_i.negative?

    @hours = hours.to_i
    @minutes = minutes.to_i
    @seconds = seconds.to_i
  end

  def self.from_str(str)
    values = str.split(':')

    hours = values[0].to_i || 0
    minutes = values[1].to_i || 0
    seconds = values[2].to_i || 0

    NaiveTime.new(hours, minutes, seconds)
  end

  def self.now
    current_time = Time.zone.now

    NaiveTime.new(current_time.hour, current_time.min, current_time.sec)
  end

  def ==(other)
    return false unless other.is_a?(NaiveTime)

    hours == other.hours && minutes == other.minutes && seconds == other.seconds
  end

  def later?(other)
    raise ArgumentError, 'You must compare two NaiveDate together' unless other.is_a?(NaiveTime)

    return true if @hours > other.hours
    return true if @minutes > other.minutes
    return true if @seconds > other.seconds

    false
  end
  alias > later?

  def later_or_equal?(other)
    return true if self == other

    later?(other)
  end
  alias >= later_or_equal?

  def earlier?(other)
    other.later?(self)
  end
  alias < earlier?

  def earlier_or_equal?(other)
    other.later_or_equal?(self)
  end
  alias <= earlier_or_equal?

  def +(other) # rubocop:disable Metrics/AbcSize,Metrics/MethodLength,Metrics/PerceivedComplexity
    total =
      if other.is_a?(Integer)
        other
      elsif other.is_a?(Duration)
        other.to_sec
      else
        raise ArgumentError, 'You must add NaiveTime with a Duration or an Integer'
      end

    other_hours =
      if total >= 1.hour.to_i
        total / 1.hour.to_i
      else
        0
      end
    total -= other_hours * 1.hour.to_i

    other_minutes =
      if total >= 1.minute.to_i
        total / 1.minute.to_i
      else
        0
      end
    total -= other_minutes * 1.minute.to_i

    new_seconds = @seconds + total
    new_minutes = @minutes + other_minutes
    new_hours = @hours + other_hours

    if new_seconds > 59
      new_minutes += 1
      new_seconds -= 60
    end

    if new_minutes > 59
      new_hours += 1
      new_minutes -= 60
    end

    new_hours -= 24 if new_hours > 23

    NaiveTime.new(new_hours, new_minutes, new_seconds)
  end

  def -(other) # rubocop:disable Metrics/AbcSize,Metrics/CyclomaticComplexity,Metrics/MethodLength,Metrics/PerceivedComplexity
    if other.is_a?(Integer) or other.is_a?(Duration)
      total =
        if other.is_a?(Integer)
          other
        elsif other.is_a?(Duration)
          other.to_sec
        end

      other_hours =
        if total >= 1.hour.to_i
          total / 1.hour.to_i
        else
          0
        end
      total -= other_hours * 1.hour.to_i

      other_minutes =
        if total >= 1.minute.to_i
          total / 1.minute.to_i
        else
          0
        end
      total -= other_minutes * 1.minute.to_i

      new_seconds = @seconds - total
      new_minutes = @minutes - other_minutes
      new_hours = @hours - other_hours

      if new_seconds.negative?
        new_minutes -= 1
        new_seconds += 60
      end

      if new_minutes.negative?
        new_hours -= 1
        new_minutes += 60
      end

      new_hours += 24 if new_hours.negative?

      NaiveTime.new(new_hours, new_minutes, new_seconds)
    elsif other.is_a?(NaiveTime)
      hours = (@hours - other.hours) * 3600
      hours += 24.hours.to_i if hours.negative?
      minutes = (@minutes - other.minutes) * 60
      seconds = @seconds - other.seconds

      total = (hours + minutes + seconds).abs

      Duration.new(total)
    else
      raise ArgumentError, 'You must add NaiveTime with a Duration or an Integer'
    end
  end

  def <=>(other)
    raise ArgumentError, 'You must compare two NaiveDate together' unless other.is_a?(NaiveTime)

    if self == other
      0
    elsif self > other
      1
    else
      -1
    end
  end

  def to_s
    "#{@hours.to_s.rjust(2, '0')}:#{@minutes.to_s.rjust(2, '0')}:#{@seconds.to_s.rjust(2, '0')}"
  end

  def hash
    [@hours, @minutes, @seconds].hash
  end
end
