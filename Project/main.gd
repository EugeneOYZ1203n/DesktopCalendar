extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	setWindow("MiniMode", false)


func setWindow(windowName, lerp: bool = true):
	var currentWindow: windowInstance = get_node(windowName)
	var window = get_window()
	
	var windowSize = getWindowInitSize(currentWindow.paddingSize, currentWindow.positionType, currentWindow.windowSize)
	var windowPosition = getWindowInitPosition(currentWindow.paddingSize, currentWindow.positionType, windowSize)
	
	window.size = windowSize
	window.position = windowPosition
	
	$Scene.size = windowSize
	$Scene.position = Vector2.ZERO

func getWindowInitSize(padding: Vector2i, position_type: int, initWindowSize: Vector2i):
	var screenSize = DisplayServer.screen_get_usable_rect().size
	var _size:= initWindowSize
	
	match position_type:
		1:
			_size.y = screenSize.y - padding.y * 2
			
		2:
			_size = screenSize - padding * 2
	
	return _size

func getWindowInitPosition(padding: Vector2i, position_type: int, windowSize: Vector2i):
	var screenSize = DisplayServer.screen_get_usable_rect().size
	var _position = Vector2i.ZERO
	
	match position_type:
		0:
			_position += screenSize - windowSize - padding
		1:
			_position.x += screenSize.x - windowSize.x - padding.x
			_position.y += padding.y
		2:
			_position += padding
	
	return _position


