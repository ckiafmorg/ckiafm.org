# frozen_string_literal: true

require 'test_helper'

class NaiveTimeTest < ActiveSupport::TestCase # rubocop:disable Metrics/ClassLength
  test '#new default value is midnight' do
    t = NaiveTime.new

    assert_equal 0, t.hours
    assert_equal 0, t.minutes
    assert_equal 0, t.seconds
  end

  test '#new set hours correctly' do
    t = NaiveTime.new(5)

    assert_equal 5, t.hours
  end

  test '#new set minutes correctly' do
    t = NaiveTime.new(10, 15)

    assert_equal 15, t.minutes
  end

  test '#new set seconds correctly' do
    t = NaiveTime.new(10, 15, 30)

    assert_equal 30, t.seconds
  end

  test '#new hours cannot be negative' do
    assert_raise(ArgumentError) { NaiveTime.new(-1) }
  end

  test '#new minutes cannot be negative' do
    assert_raise(ArgumentError) { NaiveTime.new(0, -1) }
  end

  test '#new seconds cannot be negative' do
    assert_raise(ArgumentError) { NaiveTime.new(0, 0, -1) }
  end

  test '#to_s works' do
    t = NaiveTime.new(15, 15, 15)

    assert_equal '15:15:15', t.to_s
  end

  test '#to_s is zero padded' do
    t = NaiveTime.new(5, 15)

    assert_equal '05:15:00', t.to_s
  end

  test '#from_str parse data correctly' do
    str = '12:12:12'

    t = NaiveTime.from_str(str)

    assert_equal 12, t.hours
    assert_equal 12, t.minutes
    assert_equal 12, t.seconds
  end

  test '#from_str parse padded data correctly' do
    str = '02:15:00'

    t = NaiveTime.from_str(str)

    assert_equal 2, t.hours
    assert_equal 15, t.minutes
    assert_equal 0, t.seconds
  end

  test '#from_str parse string with only hours and minute correctly' do
    str = '12:15'

    t = NaiveTime.from_str(str)

    assert_equal 12, t.hours
    assert_equal 15, t.minutes
    assert_equal 0, t.seconds
  end

  test '#from_str parse padded string with only hours and minute correctly' do
    str = '02:15'

    t = NaiveTime.from_str(str)

    assert_equal 2, t.hours
    assert_equal 15, t.minutes
    assert_equal 0, t.seconds
  end

  test '#from_str parse non-padded string with only hours and minute correctly' do
    str = '2:15'

    t = NaiveTime.from_str(str)

    assert_equal 2, t.hours
    assert_equal 15, t.minutes
    assert_equal 0, t.seconds
  end

  test '#now create a NaiveTime with the current time' do
    t = NaiveTime.now

    assert_not_equal 0, t.hours
    assert_not_equal 0, t.minutes
    assert_not_equal 0, t.seconds
  end

  test '#equal? two default NaiveTime are equal' do
    t1 = NaiveTime.new
    t2 = NaiveTime.new

    assert_equal t1, t2
  end

  test '#equal? same value' do
    t1 = NaiveTime.new(15, 15, 15)
    t2 = NaiveTime.new(15, 15, 15)

    assert_equal t1, t2
  end

  test '#equal? not the same value' do
    t1 = NaiveTime.new(15, 15, 15)
    t2 = NaiveTime.new(10, 10, 10)

    assert_not_equal t1, t2
  end

  test '#later? with same value' do
    t1 = NaiveTime.new
    t2 = NaiveTime.new

    assert_not t1 > t2
  end

  test '#later? with greater value' do
    t1 = NaiveTime.new(20)
    t2 = NaiveTime.new(15)

    assert t1 > t2
  end

  test '#later? with smaller value' do
    t1 = NaiveTime.new(15)
    t2 = NaiveTime.new(20)

    assert_not t1 > t2
  end

  test '#later_or_equal? same value' do
    t1 = NaiveTime.new(15)
    t2 = NaiveTime.new(15)

    assert t1 >= t2
  end

  test '#later_or_equal? greater value' do
    t1 = NaiveTime.new(20)
    t2 = NaiveTime.new(15)

    assert t1 >= t2
  end

  test '#later_or_equal? smaller value' do
    t1 = NaiveTime.new(15)
    t2 = NaiveTime.new(20)

    assert_not t1 >= t2
  end

  test '#earlier? with same value' do
    t1 = NaiveTime.new
    t2 = NaiveTime.new

    assert_not t1 < t2
  end

  test '#earlier? with greater value' do
    t1 = NaiveTime.new(20)
    t2 = NaiveTime.new(15)

    assert_not t1 < t2
  end

  test '#earlier? with smaller value' do
    t1 = NaiveTime.new(15)
    t2 = NaiveTime.new(20)

    assert t1 < t2
  end

  test '#earlier_or_equal? same value' do
    t1 = NaiveTime.new(15)
    t2 = NaiveTime.new(15)

    assert t1 <= t2
  end

  test '#earlier_or_equal? greater value' do
    t1 = NaiveTime.new(22)
    t2 = NaiveTime.new(20)

    assert_not t1 <= t2
  end

  test '#earlier_or_equal? smaller value' do
    t1 = NaiveTime.new(20)
    t2 = NaiveTime.new(22)

    assert t1 <= t2
  end

  test '#add with seconds duration' do
    t1 = NaiveTime.new(13)
    d = Duration.new(30)

    result = t1 + d

    assert_equal 13, result.hours
    assert_equal 0, result.minutes
    assert_equal 30, result.seconds
  end

  test '#add with minutes duration' do
    t1 = NaiveTime.new(13)
    d = Duration.new(90)

    result = t1 + d

    assert_equal 13, result.hours
    assert_equal 1, result.minutes
    assert_equal 30, result.seconds
  end

  test '#add with hours duration' do
    t1 = NaiveTime.new(13)
    d = Duration.new(3690)

    result = t1 + d

    assert_equal 14, result.hours
    assert_equal 1, result.minutes
    assert_equal 30, result.seconds
  end

  test '#add with integer seconds duration' do
    t1 = NaiveTime.new(13)
    d = 30.seconds

    result = t1 + d

    assert_equal 13, result.hours
    assert_equal 0, result.minutes
    assert_equal 30, result.seconds
  end

  test '#add with integer minutes duration' do
    t1 = NaiveTime.new(13)
    d = 1.minute + 30.seconds

    result = t1 + d

    assert_equal 13, result.hours
    assert_equal 1, result.minutes
    assert_equal 30, result.seconds
  end

  test '#add with integer hours duration' do
    t1 = NaiveTime.new(13)
    d = 1.hour + 90.seconds

    result = t1 + d

    assert_equal 14, result.hours
    assert_equal 1, result.minutes
    assert_equal 30, result.seconds
  end

  test '#add seconds that go over the minute mark' do
    t1 = NaiveTime.new(13, 1, 50)
    d = 1.hour + 15.seconds

    result = t1 + d

    assert_equal 14, result.hours
    assert_equal 2, result.minutes
    assert_equal 5, result.seconds
  end

  test '#add minutes that go over the hours mark' do
    t1 = NaiveTime.new(13, 59)
    d = 6.minutes

    result = t1 + d

    assert_equal 14, result.hours
    assert_equal 5, result.minutes
    assert_equal 0, result.seconds
  end

  test '#add hours that go over the day mark' do
    t1 = NaiveTime.new(23)
    d = 3.hours

    result = t1 + d

    assert_equal 2, result.hours
    assert_equal 0, result.minutes
    assert_equal 0, result.seconds
  end

  test '#add hours, minutes, seconds that all overlap' do
    t1 = NaiveTime.new(23, 59, 58)
    d = 3.hours + 5.minutes + 17.seconds

    result = t1 + d

    assert_equal 3, result.hours
    assert_equal 5, result.minutes
    assert_equal 15, result.seconds
  end

  test '#sub with integer seconds duration' do
    t1 = NaiveTime.new(13, 0, 30)
    d = 30.seconds.to_i

    result = t1 - d

    assert_equal 13, result.hours
    assert_equal 0, result.minutes
    assert_equal 0, result.seconds
  end

  test '#sub with minutes duration' do
    t1 = NaiveTime.new(13, 5)
    d = Duration.new(300)

    result = t1 - d

    assert_equal 13, result.hours
    assert_equal 0, result.minutes
    assert_equal 0, result.seconds
  end

  test '#sub with hours duration' do
    t1 = NaiveTime.new(13)
    d = 1.hour

    result = t1 - d

    assert_equal 12, result.hours
    assert_equal 0, result.minutes
    assert_equal 0, result.seconds
  end

  test '#sub with seconds duration overlaping a minute' do
    t1 = NaiveTime.new(13, 0, 5)
    d = 10.seconds

    result = t1 - d

    assert_equal 12, result.hours
    assert_equal 59, result.minutes
    assert_equal 55, result.seconds
  end

  test '#sub with minutes duration overlaping a hour' do
    t1 = NaiveTime.new(13, 5)
    d = 10.minutes

    result = t1 - d

    assert_equal 12, result.hours
    assert_equal 55, result.minutes
    assert_equal 0, result.seconds
  end

  test '#sub with hours duration overlaping a day' do
    t1 = NaiveTime.new(3)
    d = 5.hours

    result = t1 - d

    assert_equal 22, result.hours
    assert_equal 0, result.minutes
    assert_equal 0, result.seconds
  end

  test '#sub with NaiveTime with seconds difference' do
    t1 = NaiveTime.new(10, 30, 5)
    t2 = NaiveTime.new(10, 30, 0)

    result = t1 - t2

    assert_equal Duration.new(5.seconds.to_i), result
  end

  test '#sub with NaiveTime with minutes difference' do
    t1 = NaiveTime.new(10, 35, 5)
    t2 = NaiveTime.new(10, 30)

    result = t1 - t2

    assert_equal Duration.new(5.minutes.to_i + 5.seconds.to_i), result
  end

  test '#sub with NaiveTime with hours difference' do
    t1 = NaiveTime.new(11)
    t2 = NaiveTime.new(9, 54, 55)

    result = t1 - t2

    assert_equal Duration.new(1.hour.to_i + 5.minutes.to_i + 5.seconds.to_i), result
  end

  test '#sub with NaiveTime with hours overlaping a day' do
    t1 = NaiveTime.new(2)
    t2 = NaiveTime.new(23)

    result = t1 - t2

    assert_equal Duration.new(3.hours.to_i), result
  end

  test '#sub with NaiveTime with minutes overlaping a hour' do
    t1 = NaiveTime.new(0, 55)
    t2 = NaiveTime.new(0, 30)

    result = t1 - t2

    assert_equal Duration.new(25.minutes.to_i), result
  end

  test '#sub with NaiveTime with seconds overlaping a minute' do
    t1 = NaiveTime.new(0, 0, 55)
    t2 = NaiveTime.new(0, 0, 30)

    result = t1 - t2

    assert_equal Duration.new(25.seconds.to_i), result
  end

  test '#sub with NaiveTime with bigger time seconds' do
    t1 = NaiveTime.new(0, 0, 30)
    t2 = NaiveTime.new(0, 0, 55)

    result = t1 - t2

    assert_equal Duration.new(25.seconds.to_i), result
  end

  test '#<=> is returning 0 if objects are equal' do
    t1 = NaiveTime.new
    t2 = NaiveTime.new

    result = t1 <=> t2

    assert_equal 0, result
  end

  test '#<=> is returning 1 if t1 is greater then t2' do
    t1 = NaiveTime.new(15)
    t2 = NaiveTime.new(10)

    result = t1 <=> t2

    assert_equal 1, result
  end

  test '#<=> is returning -1 if t1 is less then t2' do
    t1 = NaiveTime.new(15)
    t2 = NaiveTime.new(20)

    result = t1 <=> t2

    assert_equal(-1, result)
  end
end
