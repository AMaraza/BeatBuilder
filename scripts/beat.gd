#Delay - await get_tree().create_timer(#ofseconds).timeout

extends Node2D
@onready var metronome: AudioStreamPlayer = $Metronome
@onready var song: AudioStreamPlayer = $Song
@onready var nail: Node2D = $"../Nail"
#@export var test_nail: Node2D

var last_beat_time = 0.0
var hit_window = 200

func _on_rhythm_notifier_beat(current_beat: int) -> void:
	metronome.play()
	last_beat_time = Time.get_ticks_msec()
	Global.current_beat = current_beat


func _input(event):
	if Input.is_action_just_pressed("hammer"):
		var now = Time.get_ticks_msec()
		var time_diff = now - last_beat_time
		
		if abs(time_diff) <= hit_window:
			print("Pass")
			await get_tree().create_timer(0.05).timeout
			nail.play_animation()
			await get_tree().create_timer(3).timeout
			nail.reset_animation()
		else:
			print("Fail")
			
			
