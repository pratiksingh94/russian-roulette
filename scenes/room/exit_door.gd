extends Area2D

@export var exit_scene: PackedScene
@export var exit_position: Vector2

var player_near_door := false

func _on_door_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_near_door = true

func _on_door_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		player_near_door = false

func _process(_delta):
	#if player_near_door and Input.is_action_just_pressed("ui_accept"):
	if player_near_door:
		GameManager.next_position = exit_position
		get_tree().change_scene_to_packed(exit_scene)
