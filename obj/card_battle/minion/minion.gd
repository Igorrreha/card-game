class_name CardBattleMinion
extends Object


var _owner: CardBattleHero
var _position: Vector2i
var _direction: Vector2i
var _max_health: int
var _current_health: int


func get_owner() -> CardBattleHero:
	return _owner


func get_position() -> Vector2i:
	return _position


func get_direction() -> Vector2i:
	return _direction


func apply_damage(damage: int):
	_current_health = clamp(_current_health - damage, 0, _max_health)


func _init(owner: CardBattleHero, position: Vector2i):
	_owner = owner
	_position = position
