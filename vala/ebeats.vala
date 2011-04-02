//
// vala implementation of ebeats.
//
// valac ebeats.vala && ./ebeats
//

void main () {
	var time = new DateTime.now_utc();
	print("@%.2f\n" , 0.01157407 * 
		(time.get_hour() * 3600 + time.get_minute() * 60 + time.get_seconds())
	);
}

