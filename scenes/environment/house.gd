extends Area2D

@export var room_scene: PackedScene
@export var entry_point: Vector2

var player_in_area := false
const prompt: Array[String] = ["Thingamajig: press SPACE to enter"]

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		DialogManager.start_dialog(global_position, prompt)
		player_in_area = true

func _process(delta):
	if player_in_area and Input.is_action_just_pressed("ui_accept"):
		GameManager.next_position = entry_point
		get_tree().change_scene_to_packed(room_scene)
