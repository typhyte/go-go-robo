extends CharacterBody2D

const SPEED = 1500;

func _physics_process(delta):
	var collision_info = move_and_collide(Vector2(1,0).normalized() * delta * SPEED)

func enemyHit(area):
	queue_free()

func onExitScreen():
	queue_free()
