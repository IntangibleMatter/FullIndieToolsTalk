@tool
extends Control

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

var playing : bool = false

func play() -> void:
	playing = true
	animation.play("amog")
	audio.play()
	show()


func stop() -> void:
	playing = false
	animation.stop()
	audio.stop()
	hide()
