extends Node2D

@export var scrollVelocity = 500
var onOddRepeat = false
var bgsToPick = ["default_bg", "picture_bg", "striped_bg", "window_bg"]

func _ready():
	$bg1.play(bgsToPick[int(randf_range(0,3))])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= scrollVelocity * delta
	


func on_screen_exit():
	position.x = 1504
	$bg1.play(bgsToPick[int(randf_range(0,3))])
