extends Control


signal output_updated(Vector2)


@export var _max_drag_distance: float

var _is_dragged: bool
var _drag_position: Vector2


func _start_drag(drag_position: Vector2):
	if drag_position.length() > _max_drag_distance:
		return
	
	_is_dragged = true
	_drag(drag_position)


func _drag(drag_position: Vector2):
	if drag_position.length() > _max_drag_distance:
		drag_position = drag_position.normalized() * _max_drag_distance
	
	_drag_position = drag_position
	output_updated.emit(_drag_position)
	update()


func _end_drag():
	_drag_position = Vector2.ZERO
	_is_dragged = false
	_drag(_drag_position)


func _draw():
	draw_arc(Vector2.ZERO, _max_drag_distance, 0, PI * 2, 64, Color.WHITE, 10)
	draw_circle(_drag_position, 30, Color.WHITE)


func _input(event):
	var screen_touch = event as InputEventScreenTouch
	if screen_touch:
		if _is_dragged and not screen_touch.pressed:
			_end_drag()
			return
		
		if not _is_dragged and screen_touch.pressed:
			_start_drag(screen_touch.position - global_position)
	
	if not _is_dragged:
		return
	
	var screen_drag = event as InputEventScreenDrag
	if _is_dragged and screen_drag:
		_drag(screen_drag.position - global_position)
