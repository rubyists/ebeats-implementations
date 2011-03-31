#!/usr/bin/env gst

time := DateTime now asUTC.

beats_per_day := 1000.
seconds_per_beat := beats_per_day / (24 * 60 * 60).
minutes_per_beat := beats_per_day / (24 * 60).
hours_per_beat := beats_per_day / 24.

beats := ((time hour)   * (1000 / 24)) +
         ((time minute) * (1000 / (24 * 60))) +
         ((time second) * (1000 / (24 * 60 * 60))).

('@', (((((beats * 10) asInteger) / 10) asFloat)) asString) displayNl
