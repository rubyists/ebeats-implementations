#!/usr/bin/env gst

time := DateTime now asUTC.
beats := ((time hour * 3600) + (time minute * 60) + (time second)) / 0.864.
('@', (beats asInteger / 100) asFloat asString) displayNl.
