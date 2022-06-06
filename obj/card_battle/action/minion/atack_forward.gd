extends CardBattleAction


@export var damage: int


func do(actor: CardBattleMinion, opponents, battle_field: CardBattleField):
	var actor_position := actor.get_position()
	var line_cells := battle_field.get_line(actor_position.x)
	
	var cells_under_atack := []
	match actor.get_direction():
		Vector2i.DOWN:
			cells_under_atack.append_array(line_cells.slice(actor_position.y + 1))
		Vector2i.UP:
			cells_under_atack.append_array(line_cells.slice(0, actor_position.y))
			cells_under_atack.reverse()
	
	for cell in cells_under_atack:
		cell = cell as CardBattleField.Cell
		if not cell:
			return
		
		# todo atacking objects in cells
