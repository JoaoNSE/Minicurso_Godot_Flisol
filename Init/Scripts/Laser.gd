extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed:Vector2 = Vector2(800, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position += speed.rotated(rotation) * delta

func _on_Laser_body_entered(body):
	if body.has_method("damage"):
		body.damage()
		
	queue_free()
