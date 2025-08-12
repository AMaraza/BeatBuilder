extends Node2D

@onready var nail: Node2D = $"."
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func play_animation():
	animation_player.play("nail_hit")
	
func reset_animation():
	animation_player.play("RESET")
