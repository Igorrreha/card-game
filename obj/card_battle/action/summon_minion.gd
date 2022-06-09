extends CardBattleAction


enum Target {
	SELECTED_CELL,
}


@export var _target: Target
@export var _minion_configuration: Resource:
	set(value):
		if value is CardBattleMinionConfiguration:
			_minion_configuration = value
			return
		
		push_error("Minion configuration is not MinionConfiguration type")


func do(actor: CardBattleHero, opponents, battle_field):
	match _target:
		Target.SELECTED_CELL:
			var target_cell = battle_field.get_selected_cell()
			var minion = CardBattleMinion.new(_minion_configuration, actor, target_cell.get_position())
			target_cell.get_objects().append(minion)
			minion.spawn()
