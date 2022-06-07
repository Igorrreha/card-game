class_name CardBattleHero
extends Object


var _atack_direction := Vector2i.DOWN 
var _max_health: int
var _current_health: int
var _max_mana: int
var _current_mana: int
var _card_pack: Array[Card]


func apply_damage(damage: int):
	_current_health = clamp(_current_health - damage, 0, _max_health)
