extends Camera2D

func _ready():
	#top_level = true
	global_position.y = 150
	
func _physics_process(delta):
	global_position.x = get_parent().global_position.x
	
