#!/usr/bin/env ruby

beats_per_day = 1000.0
seconds_per_beat = beats_per_day / (24 * 60 * 60)
minutes_per_beat = beats_per_day / (24 * 60)
hours_per_beat   = beats_per_day / 24

now = Time.now.utc

puts "@%.2f" % (
  time.sec * seconds_per_beat +
  time.min * minutes_per_beat +
  time.hour * hours_per_beat)
