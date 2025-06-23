extends Node2D


#@onready var camera_2d: Camera2D = $Camera2D

#const lines: Array[String] = ["Press SPACE to exit house"]

const PLAYER_SCENE = preload("res://scenes/characters/player.tscn")

func _ready():
	if GameManager.next_position != Vector2.ZERO:
		var p = PLAYER_SCENE.instantiate()
		add_child(p)
		p.global_position = GameManager.next_position
	
		$Camera2D.make_current()
		GameManager.next_position = Vector2.ZERO
