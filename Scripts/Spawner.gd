extends Node2D

var Item = preload("res://Prefabs/Item.tscn")

onready var timer = $Timer

export var time_min : float = 1.5
export var time_max : float = 3.0
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	timer.set_wait_time( rng.randf_range(time_min, time_max) )

func _on_Timer_timeout():
	var new_item = Item.instance()
	
	new_item.set_position( get_position() )
	
	get_parent().add_child(new_item)
	
	timer.set_wait_time( rng.randf_range(time_min, time_max) )
