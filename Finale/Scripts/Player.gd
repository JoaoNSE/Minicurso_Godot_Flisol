extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 400

var life = 3
var can_shoot = true

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if life <= 0:
		morre()
	control()
	move_and_slide(velocity)

func control():
	velocity = Vector2()
	
	if Input.is_action_pressed("Left"):
		velocity.x = -1
	if Input.is_action_pressed("Right"):
		velocity.x = 1
	if Input.is_action_pressed("Up"):
		velocity.y = -1
	if Input.is_action_pressed("Down"):
		velocity.y = 1
	if Input.is_action_pressed("Fire") and can_shoot:
		var lasu = preload("res://Scenes/PlayerLaser.tscn").instance()
		lasu.global_position = get_node("LaserOut").global_position
		get_parent().add_child(lasu)
		$Timer.start()
		can_shoot = false
		
	if position.x - 25 < 0:
		position.x = 25
		velocity = Vector2()
	if position.x + 25 > get_viewport().size.x:
		position.x = get_viewport().size.x - 25
	if position.y - 25 < 0:
		position.y = 25
		velocity = Vector2()
	if position.y + 25 > get_viewport().size.y:
		position.y = get_viewport().size.y - 25
		
	velocity = velocity * speed

func causa_dano():
	life -= 1
	get_parent().get_node("HUD").remove_hp()
	
func morre():
	get_tree().change_scene("res://Scenes/GameOver.tscn")

func _on_Timer_timeout():
	can_shoot = true
