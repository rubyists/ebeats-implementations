(function() {
  var beatsPerHour, beatsPerMinute, beatsPerSecond, dateToBeats;
  beatsPerHour = 1000.0 / 24.0;
  beatsPerMinute = 1000.0 / (24.0 * 60.0);
  beatsPerSecond = 1000.0 / (24.0 * 60.0 * 60.0);
  dateToBeats = function(date) {
    var beats, day, hours, minutes, month, seconds, year, _ref;
    _ref = [date.getUTCFullYear(), date.getUTCMonth() + 1, date.getUTCDate(), date.getUTCHours(), date.getUTCMinutes(), date.getUTCSeconds()], year = _ref[0], month = _ref[1], day = _ref[2], hours = _ref[3], minutes = _ref[4], seconds = _ref[5];
    beats = (hours * beatsPerHour) + (minutes * beatsPerMinute) + (seconds * beatsPerSecond);
    return [year, month, day, beats];
  };
}).call(this);
