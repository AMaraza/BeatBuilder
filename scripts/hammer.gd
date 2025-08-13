extends Node2D

@onready var hammer: Node2D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var swipe: AudioStreamPlayer = $Swipe
@onready var whack: AudioStreamPlayer = $Whack

func _input(event):
	if event.is_action_pressed("hammer"):
		animation_player.play("swing")
		
