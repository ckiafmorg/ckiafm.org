# frozen_string_literal: true

require 'test_helper'

class DurationTest < ActiveSupport::TestCase # rubocop:disable Metrics/ClassLength
  test '#new default to zero time duration' do
    d = Duration.new

    assert_equal d.to_sec, 0
  end

  test '#new handle days correctly' do
    d = Duration.new(1.day)

    assert_equal d.to_sec, 1.day
  end

  test '#new handle hours correctly' do
    d = Duration.new(1.hour)

    assert_equal d.to_sec, 1.hour
  end

  test '#new handle minutes correctly' do
    d = Duration.new(5.minutes)

    assert_equal d.to_sec, 5.minutes
  end

  test '#new handle seconds correctly' do
    d = Duration.new(25.seconds)

    assert_equal d.to_sec, 25.seconds
  end

  test '#to_s display seconds correctly' do
    d = Duration.new(33.seconds.to_i)

    assert_equal '00:00:33', d.to_s
  end

  test '#to_s display minutes correctly' do
    d = Duration.new(13.minutes.to_i + 33.seconds.to_i)

    assert_equal '00:13:33', d.to_s
  end

  test '#to_s display hours correctly' do
    d = Duration.new(7.hours.to_i + 13.minutes.to_i + 33.seconds.to_i)

    assert_equal '07:13:33', d.to_s
  end

  test '#equal? when both duration a equal' do
    d1 = Duration.new
    d2 = Duration.new

    assert d1 == d2
  end

  test '#equal? when both duration a different' do
    d1 = Duration.new
    d2 = Duration.new(1.day)

    assert_not d1 == d2
  end

  test '#gt? with equal value' do
    d1 = Duration.new(1.day)
    d2 = Duration.new(1.day)

    assert_not d1 > d2
  end

  test '#gt? with greater value' do
    d1 = Duration.new(1.day)
    d2 = Duration.new(1.hour)

    assert d1 > d2
  end

  test '#gt? with smaller value' do
    d1 = Duration.new(1.hour)
    d2 = Duration.new(1.day)

    assert_not d1 > d2
  end

  test '#ge? with equal value' do
    d1 = Duration.new
    d2 = Duration.new

    assert d1 >= d2
  end

  test '#lt? with greater value' do
    d1 = Duration.new(1.day)
    d2 = Duration.new(1.hour)

    assert_not d1 < d2
  end

  test '#lt? with smaller value' do
    d1 = Duration.new(1.hour)
    d2 = Duration.new(1.day)

    assert d1 < d2
  end

  test '#le? with equal value' do
    d1 = Duration.new
    d2 = Duration.new

    assert d1 <= d2
  end

  test '#add two duration' do
    d1 = Duration.new(1.day)
    d2 = Duration.new(1.day + 6.hours)

    result = d1 + d2

    assert_equal result.to_sec, 2.days + 6.hours
  end

  test '#add duration with integer' do
    d1 = Duration.new(1.day)
    d2 = 6.hours

    result = d1 + d2

    assert_equal result.to_sec, 1.day + 6.hours
  end

  test '#sub two duration' do
    d1 = Duration.new(1.day)
    d2 = Duration.new(6.hours)

    result = d1 - d2

    assert_equal result.to_sec, 18.hours
  end

  test '#sub a duration with an integer' do
    d1 = Duration.new(1.day)
    d2 = 6.hours

    result = d1 - d2

    assert_equal result.to_sec, 18.hours
  end
end
