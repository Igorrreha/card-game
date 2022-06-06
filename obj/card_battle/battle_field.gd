class_name CardBattleField
extends Object


var _size: Vector2i
var _cells: Array[Cell]


func get_line(line_idx: int) -> Array:
	var line := []
	if line_idx > _size.x or line_idx < 0:
		push_error("Line idx is out of range")
		return line
	
	for cell_idx in _cells.size():
		if cell_idx % _size.x == line_idx:
			line.append(_cells[cell_idx])
	
	return line


func _init(size: Vector2i):
	_size = size
	for i in range(size.x * size.y):
		_cells.append(Cell.new())


class Cell:
	var objects: Array[Object]
