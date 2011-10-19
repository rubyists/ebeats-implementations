String timeToBeats(Date date) {
  Date now = date.changeTimeZone(new TimeZone.utc());
  double beats = now.hours   * (1000 /            24)
               + now.minutes * (1000 /      (60 * 24))
               + now.seconds * (1000 / (60 * 60 * 24));

  return beats.toStringAsFixed(2);
}

main() {
  print(timeToBeats(new Date.now()));
}