extends Node2D

@export var small_bullet_scene: PackedScene
@export var guard_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("light_shoot") && get_tree().get_nodes_in_group("alive_bullets").size() < 3:
		shoot()

func shoot():
	var small_bullet = small_bullet_scene.instantiate()
	small_bullet.set_position($robo/bullet_pos.get_position() + $robo.get_position())
	small_bullet.add_to_group("alive_bullets")
	add_child(small_bullet)

func _on_mob_timer_timeout():
	var which_enemy
	print("i timed out")
	spawn_guard()

func spawn_guard():
	var guard = guard_scene.instantiate() 
	var spawn_enemy_now = int(randf_range(0, 10))
	
	guard.position = $GuardSpawnLocation.get_position()
	print(str(spawn_enemy_now))
	if spawn_enemy_now < 6:
		add_child(guard)
