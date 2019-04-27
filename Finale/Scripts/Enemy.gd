extends KinematicBody2D

var speed = 200

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	speed += int(rand_range(-100, 100))
	set_process(true)

func _process(delta):
	position.x -= speed * delta
	
	if position.x + 28 < 0:
		queue_free()

func destroi():
	queue_free()

func _on_ShootTimer_timeout():
	var lasu = preload("res://Scenes/EnemyLaser.tscn").instance()
	lasu.global_position = get_node("LaserOut").global_position
	get_parent().add_child(lasu)
