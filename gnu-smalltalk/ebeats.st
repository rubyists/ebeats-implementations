#!/usr/bin/env gst

time := DateTime now asUTC.
beats := ((time hour)   * (1000 / 24)) +
         ((time minute) * (1000 / (24 * 60))) +
         ((time second) * (1000 / (24 * 60 * 60))).

('@', (((((beats * 10) asInteger) / 10) asFloat)) asString) displayNl
