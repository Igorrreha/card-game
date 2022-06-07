extends CardBattleAction


@export var _damage: int


func do(actor: CardBattleMinion, opponents, battle_field):
	if _try_apply_damage_to_cells(actor, battle_field):
		return
	
	_apply_damage_to_opponent(opponents[0])


func _try_apply_damage_to_cells(actor: CardBattleMinion, battle_field: CardBattleField) -> bool:
	var cells_under_atack_queue = _get_cells_under_atack_queue(actor, battle_field)
	
	for cell in cells_under_atack_queue:
		cell = cell as CardBattleField.Cell
		if not cell:
			continue
		
		# try to damage some object
		for object in cell.objects:
			object.apply_damage(_damage)
			return true
	
	return false


func _get_cells_under_atack_queue(actor: CardBattleMinion, battle_field: CardBattleField) -> Array:
	var actor_position := actor.get_position()
	var line_cells := battle_field.get_line(actor_position.x)
	
	var cells_under_atack := []
	match actor.get_direction():
		Vector2i.DOWN:
			cells_under_atack.append_array(line_cells.slice(actor_position.y + 1))
		Vector2i.UP:
			cells_under_atack.append_array(line_cells.slice(0, actor_position.y))
			cells_under_atack.reverse()
	
	return cells_under_atack


func _apply_damage_to_opponent(opponent: CardBattleHero):
	opponent.apply_damage(_damage)
