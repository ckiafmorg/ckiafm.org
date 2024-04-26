# frozen_string_literal: true

class Duration
  def initialize(seconds = 0)
    @seconds = seconds
  end

  def self.from_dhms(days = 0, hours = 0, minutes = 0, seconds = 0) # rubocop:disable Metrics/ParameterLists
    secs = days * 1.day
    secs += hours * 1.hour
    secs += minutes * 1.minute
    secs += seconds

    Duration.new(secs)
  end

  def to_sec
    @seconds
  end

  def to_s
    secs = @seconds
    hours =
      if secs >= 3600
        secs / 1.hour.to_i
      else
        0
      end
    secs -= hours * 1.hour.to_i

    minutes =
      if secs >= 60
        secs / 1.minute.to_i
      else
        0
      end
    secs -= minutes * 1.minute.to_i

    str = ''
    str += "#{hours.to_s.rjust(2, '0')}:"
    str += "#{minutes.to_s.rjust(2, '0')}:"
    str += secs.to_s.rjust(2, '0')
    str
  end

  def equal?(other)
    return false unless other.is_a?(Duration)

    @seconds == other.to_sec
  end
  alias == equal?

  def gt?(other)
    raise ArgumentError, 'You must compare two Duration together' unless other.is_a?(Duration)

    @seconds > other.to_sec
  end
  alias > gt?

  def ge?(other)
    return true if self == other

    self > other
  end
  alias >= ge?

  def lt?(other)
    other.gt?(self)
  end
  alias < lt?

  def le?(other)
    other.ge?(self)
  end
  alias <= le?

  def add(other)
    if other.is_a?(Duration)
      # FIXME: This is a little bit hacky,
      # there's probably a way to have a better API
      Duration.new(@seconds + other.to_sec)
    elsif other.is_a?(Integer)
      Duration.new(@seconds + other)
    end
  end
  alias + add

  def sub(other)
    if other.is_a?(Duration)
      Duration.new(@seconds - other.to_sec)
    elsif other.is_a?(Integer)
      Duration.new(@seconds - other)
    else
      raise ArgumentError, 'You must substract with Duration or Integer'
    end
  end
  alias - sub
end
