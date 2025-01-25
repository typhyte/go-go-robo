extends CharacterBody2D


const SPEED = 300.0
@onready var guard_sprite = $sprite

func _physics_process(delta):
	guard_sprite.play("idle")
	move_and_collide(Vector2(-1,0).normalized() * delta * SPEED)

func onBulletHit(body):
	if body.get_collision_layer() == 2:
		queue_free()
