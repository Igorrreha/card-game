@tool
extends EditorScript


func _run():
	var battle_field = CardBattleField.new(Vector2i(5, 4))
	var line = []
	battle_field.try_get_line(1, line)
	print(line)
