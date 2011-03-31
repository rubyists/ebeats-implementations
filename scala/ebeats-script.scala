import java.util.{Calendar, TimeZone}
import Calendar._

val now = Calendar.getInstance(TimeZone.getTimeZone("UTC"))
val beats = List(   now.get(HOUR_OF_DAY) * (1000.0 / 24.0), 
                    now.get(MINUTE) * (1000.0 / (24.0 * 60.0)), 
                    now.get(SECOND) * (1000.0 / (24.0 * 60.0 * 60.0))).sum

println("@%.2f".format(beats))