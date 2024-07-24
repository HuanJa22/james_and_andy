extends AudioStreamPlayer

const level_music = preload("res://Songs/violet2.wav")

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()

func play_music_level():
	await wait(0)
	_play_music(level_music)

func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout
