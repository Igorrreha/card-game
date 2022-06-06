class_name MinionConfiguration
extends Resource


@export var max_health: int
@export var start_health: int
@export var actions: Array[Resource]:
	set(value):
		var valid_resources: Array[CardBattleAction] = []
		for resource in value:
			if resource == null or resource is CardBattleAction:
				valid_resources.append(resource)
				continue
			
			push_error("Action is not CardBattleAction type")
			valid_resources.append(null)
		
		actions = value
