extends CardBattleAction


@export var _minion_configuration: Resource:
	set(value):
		if value is MinionConfiguration:
			_minion_configuration = value
			return
		
		push_error("Minion configuration is not MinionConfiguration type")


func do(actor: CardBattleHero, opponents, battle_field, target = null):
	pass
