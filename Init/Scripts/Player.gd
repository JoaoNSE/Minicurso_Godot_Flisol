extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed : int = 300
var velocity : Vector2 =  Vector2()

var Laser = preload("res://Scenes/Laser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	

func _process(delta):
	if Input.is_action_just_pressed("Fire"):
		shoot()

func control(delta):
	
	velocity = Vector2(0, 0)
	
	if Input.is_action_pressed("Left"):
		velocity.x = -1
	if Input.is_action_pressed("Right"):
		velocity.x = 1
	if Input.is_action_pressed("Up"):
		velocity.y = -1
	if Input.is_action_pressed("Down"):
		velocity.y = 1
	
	velocity *= speed
	
	
	
func _physics_process(delta):
	control(delta)
	move_and_slide(velocity)
	
func shoot():
	var laser = Laser.instance()
	laser.global_position = $ShootExit.global_position
	get_parent().add_child(laser)
	