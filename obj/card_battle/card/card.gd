class_name Card
extends Resource


@export var title: String
@export var description: String
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
