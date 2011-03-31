#!/usr/bin/env python

from datetime import datetime

def ebeats():
    t = datetime.now()
    perHour = 1000.0 / 24.0
    perMinute = 1000.0 / (24.0 * 60.0)
    perSecond = 1000.0 / (24.0 * 60.0 * 60.0)
    beats = t.hour * perHour + t.minute * perMinute + t.second * perSecond
    return "%0.2f" % beats
