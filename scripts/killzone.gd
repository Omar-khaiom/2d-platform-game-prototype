extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	print("you died")
	Engine.time_scale =0.7
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	



	


func _on_timer_timeout() -> void:
	Engine.time_scale =.8
	
	get_tree().reload_current_scene()
