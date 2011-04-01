REBOL [ Title: "ebeats" File: %ebeats.r ]
beats: to integer! (now/time - now/zone * 115740 / 100000)
print  join "@" beats / 100 

