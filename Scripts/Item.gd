extends KinematicBody2D

const Belt = preload("res://Scripts/Belt.gd")

export var gravity = Vector2(0.0, 98)
export var drop_velocity = Vector2(0.0,0.0)

func _ready():
	pass

func _physics_process( delta : float ):
	drop_velocity += gravity * delta
	var collision : KinematicCollision2D = \
		move_and_collide(drop_velocity * delta)
	
	if collision != null:
		# Stop the velocity from acumlimating.
		drop_velocity = Vector2(0,0)
		
		# If there a collision with the belt then do this instead.
		var belt_col := collision.get_collider() as Belt
		
		if belt_col != null:
			# Make some movements
			move_and_slide( belt_col.get_move(), Vector2(0,-1) )
		
		# If there is a collision with the same type then delete them both
		if collision.get_collider().get_script() == get_script():
			collision.get_collider().queue_free()
			queue_free()
