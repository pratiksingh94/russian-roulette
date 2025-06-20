extends Control



@onready var w: AnimatedSprite2D = $HBoxContainer/VBoxContainer/Node/AnimatedSprite2D
@onready var s: AnimatedSprite2D = $HBoxContainer/VBoxContainer/Node/AnimatedSprite2D2
@onready var a: AnimatedSprite2D = $HBoxContainer/VBoxContainer/Node/AnimatedSprite2D3
@onready var d: AnimatedSprite2D = $HBoxContainer/VBoxContainer/Node/AnimatedSprite2D4



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	
	if Input.is_action_just_pressed("ui_up"):
		w.play("w")
	if Input.is_action_just_pressed("ui_down"):
		s.play("s")
	if Input.is_action_just_pressed("ui_left"):
		a.play("a")
	if Input.is_action_just_pressed("ui_right"):
		d.play("d")
