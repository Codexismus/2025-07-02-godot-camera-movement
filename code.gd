extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("__center_camera"):
		var _player : Node2D = get_tree().get_first_node_in_group("Player")
		var _position : Vector2 = Vector2.ZERO

		if _player != null:
			_position = _player.global_position
		
		get_window().get_camera_2d().global_position = _position
	pass

func _process(delta: float) -> void:
	_move_camera()
	pass

func _move_camera() -> void:
	var _viewport = get_viewport_rect().size
	var _camera_pos : Vector2 = get_window().get_camera_2d().global_position
	var _margin = _viewport * (Vector2.ONE / get_window().get_camera_2d().zoom)
	var _mouse_pos : Vector2 = get_global_mouse_position()
	var _camera_speed : int = 10

	if _mouse_pos.x < (_camera_pos.x - _margin.x / 2):
		get_window().get_camera_2d().global_position.x -= _camera_speed
	elif _mouse_pos.x > _camera_pos.x + _margin.x / 2:
		get_window().get_camera_2d().global_position.x += _camera_speed

	if _mouse_pos.y < (_camera_pos.y - _margin.y / 2):
		get_window().get_camera_2d().global_position.y -= _camera_speed
	elif _mouse_pos.y > _camera_pos.y + _margin.y / 2:
		get_window().get_camera_2d().global_position.y += _camera_speed
	pass
