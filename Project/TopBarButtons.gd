extends Node

func _on_mini_button_pressed():
	get_window().mode = Window.MODE_MINIMIZED

func _on_close_button_pressed():
	get_tree().quit()

func _on_pin_button_pressed():
	get_window().always_on_top = not get_window().always_on_top
	
	var pinButton: Control = $"../Scene/Body/TopBar/HBoxContainer/PinButton"
	
	if get_window().always_on_top:
		pinButton.modulate = Color(0.68823530077934, 0.69607843756676, 0.85980393886566)
	else:
		pinButton.modulate = Color(0.27843138575554, 0.28235295414925, 0.54901963472366)


var following = false
var dragging_offset = Vector2i()

func _on_top_bar_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_offset = get_window().position - DisplayServer.mouse_get_position()


func _process(_delta):
	if following:
		get_window().position =  DisplayServer.mouse_get_position() + dragging_offset
