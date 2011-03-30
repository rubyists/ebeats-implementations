#!/bin/awk -f
BEGIN{
  st=systime()
  split(strftime("%T",st,1),hms,":")
  print strftime("d%d.%m.%y@"( ((hms[1])*(1000/24)) + (hms[2]*(1000/1440)) + (hms[3]*(1000/86400)) )".beats",st,1)
}
