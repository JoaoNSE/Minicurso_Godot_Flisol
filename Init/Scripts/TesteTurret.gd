extends Node2D

var bodies = []

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bodies.size() > 0:
		$"Canhão".look_at(bodies[0].position)
		$"Canhão".rotate(-PI/2)


func _on_Area2D_body_entered(body):
	bodies.append(body)


func _on_Area2D_body_exited(body):
	var id = bodies.find(body)
	print("ID:" + str(id))
	if id >= 0:
		bodies.remove(id)