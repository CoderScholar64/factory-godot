extends Area2D


func _on_Items_body_exited(body):
	# No items should be allocated when they exit the scene.
	body.queue_free()
