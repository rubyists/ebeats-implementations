beatsPerHour = 1000.0 / 24.0
beatsPerMinute = 1000.0 / (24.0 * 60.0)
beatsPerSecond = 1000.0 / (24.0 * 60.0 * 60.0)

dateToBeats = (date) ->
  [year, month, day, hours, minutes, seconds] = [
    date.getUTCFullYear(), date.getUTCMonth() + 1, date.getUTCDate(),
    date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds(),
  ]
  beats = (hours * beatsPerHour) +
          (minutes * beatsPerMinute) +
          (seconds * beatsPerSecond)
  [year, month, day, beats]

