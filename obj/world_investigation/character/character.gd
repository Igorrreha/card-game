extends CharacterBody2D


@export_node_path(Area2D) var _interaction_area_path
@export var _speed = 300.0

var _move_input: Vector2

@onready var _interaction_zone: Area2D = get_node(_interaction_area_path) as Area2D


func update_move_input(input: Vector2):
	_move_input = input


func interact():
	print("interaction")
	var interactive_areas = _interaction_zone.get_overlapping_areas().filter(func(area):
		area.is_in_group("interactable"))
	
	if interactive_areas.is_empty():
		return
	
	interactive_areas.interact()


func _physics_process(delta):
	_process_move(delta)


func _process_move(delta):
	if _move_input.length() == 0:
		return
	
	velocity = _move_input.normalized() * _speed
	move_and_slide()
