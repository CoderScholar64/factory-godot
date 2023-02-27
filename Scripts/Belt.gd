extends StaticBody2D

export var move:Vector2

onready var animation_sprite = get_node( @"./CollisionShape2D/AnimatedSprite" )

func _ready():
	pass

func get_move():
	return move

func set_animation_speed( speed:float ):
	if speed != 0:
		var current_frame = animation_sprite.get_frame()
		animation_sprite.play( animation_sprite.get_animation(), speed < 0 )
		animation_sprite.set_frame( current_frame )
	animation_sprite.set_speed_scale( abs(speed) * 1.5 )
