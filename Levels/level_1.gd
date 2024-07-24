extends Node2D

var circle = preload("res://Levels/pathing.tscn")

var time: float = 0
var current: float = 0
var n: int = 0
var nums = []
var circles = []

func _ready():
	AudioPlayer.play_music_level()
	var file = FileAccess.open("res://csv/num.csv", FileAccess.READ)
	
	while !file.eof_reached():
		nums.append_array(file.get_csv_line())
	
	file.close()
	print(nums)
		
func _process(delta):
	var i = 0
	time = round(AudioPlayer.get_playback_position() * 10)/10
	print(time)
	print(float(nums[n]))
	if current != time:
		current = time
		if current == float(nums[n]) + 2:
			var instance = circle.instantiate()
			circles.append(instance)
			add_child(instance)
			n += 1
	while i < circles.size():
		if circles[i].pos() == Vector2(150,550):
			remove_child(circles[i])
			circles.remove_at(i)
		i += 1
