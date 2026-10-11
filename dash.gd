extends Node2D

@onready var timer = $DashTimer

func startdash(dur):
	timer.wait_time = dur
	timer.start()
	
func isdashing():
	return !timer.is_stopped()
