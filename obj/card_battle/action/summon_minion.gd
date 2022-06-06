extends CardBattleAction


@export var minion_configuration: Resource:
	set(value):
		if value is MinionConfiguration:
			minion_configuration = value
			return
		
		push_error("Minion configuration is not MinionConfiguration type")


func do(actor, opponents, battle_field):
	pass
