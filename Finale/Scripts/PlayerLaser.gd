extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed = 600

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += speed * delta

func _on_PlayerLaser_body_entered(body):
	if body.has_method("destroi"):
		body.destroi()
		
	queue_free()
