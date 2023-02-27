extends TileMap

var belt = preload("res://Prefabs/Belt.tscn")

export var speed:float = 40.0

func _ready():
	var usedCells = get_used_cells()
	
	for cellIndex in usedCells.size():
		var object = get_cellv( usedCells[ cellIndex ] )
		
		if object == 0:
			var belt_instance = belt.instance()
			add_child(belt_instance)
			belt_instance.position = map_to_world( usedCells[cellIndex] )
			belt_instance.move = Vector2( 1, 0 )
		elif object == 1:
			var belt_instance = belt.instance()
			add_child(belt_instance)
			belt_instance.position = map_to_world( usedCells[cellIndex] )
			belt_instance.move = Vector2( -1, 0 )
	
	clear()
	change_speed( speed )
	

func change_speed( new_speed:float ) -> void:
	speed = new_speed
	
	for it in self.get_children():
		it.move = Vector2( it.move.x, 0 ) / abs( it.move.x ) * speed
		it.set_animation_speed( it.move.x / 40.0 )
