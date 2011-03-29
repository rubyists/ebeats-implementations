import times

proc printf(formatstr: cstring) {.importc: "printf", nodecl, varargs.}

var time = getTime().getGMTime
var beats = (
  (time.hour.float   * (1000.0 / 24.0)) +
  (time.minute.float * (1000.0 / 1440.0)) +
  (time.second.float * (1000.0 / 86400.0)))

printf("@%.2f\n", beats)
