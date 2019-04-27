extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var life = get_parent().get_node("Player").life
	
	for i in range(life):
		var tex = TextureRect.new()
		tex.texture = load("res://Sprites/life.png")
		$HBoxContainer.add_child(tex)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func remove_hp():
	$HBoxContainer.get_child(0).queue_free()
