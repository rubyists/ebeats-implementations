include time
import os/Time

// struct tm *gmtime_r(const time_t *timep, struct tm *result);
gmtime_r: extern func(TimeT*, TMStruct*) -> TMStruct*

main: func () {
  clock : TimeT
  time(clock&)

  time : TMStruct
  gmtime_r(clock&, time&)

  "@%f" cformat(timeToBeats(time)) println()
}

timeToBeats: func (time: TMStruct) -> Float {
  beats : Float
  beats = ((time tm_hour) * (1000.0 / 24.0)) +
          ((time tm_min)  * (1000.0 / (24.0 * 60.0))) +
          ((time tm_sec)  * (1000.0 / (24.0 * 60.0 * 60.0)))

  return beats
}
