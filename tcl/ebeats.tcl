# tcl implementation of ebeats
set ebeat [expr [clock format [clock seconds] \
	-format { (%k*3600 + %M*60 + %S)*11574.0 / 1000000 } \
	-timezone :UTC]]
puts [format "@%.2f" $ebeat]

