class_name CardBattleField
extends Object


var _size: Vector2i
var _cells: Array[Cell]
var _selected_cell: Cell


func get_selected_cell() -> Cell:
	return _selected_cell


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
	for y in range(size.y):
		for x in range(size.x):
			_cells.append(Cell.new(Vector2i(x, y)))



class Cell:
	var _position: Vector2i
	var _objects: Array[Object]
	
	
	func get_position() -> Vector2i:
		return _position
	
	
	func get_objects() -> Array[Object]:
		return _objects
	
	
	func _init(position: Vector2i):
		_position = position
