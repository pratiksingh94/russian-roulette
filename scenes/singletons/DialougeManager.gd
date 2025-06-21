extends Node


@onready var dialog_box_scene = preload("res://scenes/dialouge_box/dialouge.tscn")

var dialog_lines: Array[String] = []
var current_line = 0

var dialog_box
var dialog_box_position: Vector2

var is_dialog_active = false
var can_advance_line = false 

func start_dialog(position: Vector2, lines: Array[String]):
	if is_dialog_active:
		return
	
	dialog_lines = lines
	dialog_box_position = position
	
	show_dialog_box()
	is_dialog_active = true

func show_dialog_box():
	dialog_box = dialog_box_scene.instantiate()
	dialog_box.finished.connect(dialog_box_finished_displaying)
	
	get_tree().root.add_child(dialog_box)
	dialog_box.global_position = dialog_box_position
	
	dialog_box.display_text(dialog_lines[current_line])
	can_advance_line = false

func dialog_box_finished_displaying():
	can_advance_line = true

func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("ui_accept") && is_dialog_active && can_advance_line):
		dialog_box.queue_free()
		current_line += 1
		
		if current_line >= dialog_lines.size():
			is_dialog_active = false
			current_line = 0
			return
		
		show_dialog_box()
