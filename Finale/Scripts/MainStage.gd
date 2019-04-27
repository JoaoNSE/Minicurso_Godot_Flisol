extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn_enemy():
	var en_pos = rand_range(0, get_viewport().size.y)
	var enemy = preload("res://Scenes/Enemy.tscn").instance()
	enemy.position.x = get_viewport().size.x + 30
	enemy.position.y = en_pos
	add_child(enemy)
	

func _on_SpawnTimer_timeout():
	spawn_enemy()
