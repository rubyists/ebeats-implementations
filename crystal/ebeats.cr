#!/usr/bin/env ruby

time = Time.utc_now
puts "@%.2f" % (5*(60*(60*time.hour+time.minute)+time.second)/432)
