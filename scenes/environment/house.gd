extends StaticBody2D

const line: Array[String] = [
	"Thingamajig: are you sure you want to enter the house? if yes then press X"
]




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		DialogManager.start_dialog(global_position, line)
	
