create function ebeats() returns float(4,2) not deterministic
return (hour(utc_time()) * (1000 / 24))
      + (minute(utc_time) * (1000 / (24 * 60)))
      + second(utc_time) * (1000 / (24 * 60 * 60));