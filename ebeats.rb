#!/usr/bin/env ruby

time = Time.now.utc.to_a
ratio = Rational(1000, 24 * 60 * 60), Rational(1000, 24 * 60), Rational(1000, 24)

puts "@%.2f" % time[0,3].zip(ratio).map{|t,r| t * r }.inject(:+)
