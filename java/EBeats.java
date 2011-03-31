import java.util.Calendar;
import java.util.TimeZone;

public class EBeats {

	public static double ebeats(){
		Calendar now = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
		double beats = now.get(Calendar.HOUR_OF_DAY)  * (1000.0 / 24.0) +
				        now.get(Calendar.MINUTE)      * (1000.0 / (24.0 * 60.0)) +
				        now.get(Calendar.SECOND)      * (1000.0 / (24.0 * 60.0 * 60.0));

		return beats;
	}
	
	public static void main(String args[]){
		System.out.println(EBeats.ebeats());
	}
}
