// C# implemenation of ebeats
//
// mcs ebeats.cs && mono ebeats.exe

using System;
public class Ebeats {
	static public void Main() {
		DateTime dt = DateTime.UtcNow;
		Console.WriteLine( String.Format("@{0:0.00}", 
				(dt.Hour * 3600 + 
				 dt.Minute * 60 + 
				 dt.Second)  * 0.01157407));
	}
}
		



