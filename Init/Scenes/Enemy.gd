extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed : int = 300

var Laser = preload("res://Scenes/EnemyLaser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		shoot()
	
func _physics_process(delta):
	move_and_slide(Vector2(-speed, 0))
	
func shoot():
	var laser = Laser.instance()
	laser.global_position = $ShootExit.global_position
	laser.rotation_degrees = 180
	get_parent().add_child(laser)

func damage():
	queue_free()

func _on_ShootTimer_timeout():
	shoot()
