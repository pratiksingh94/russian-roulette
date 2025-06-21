extends MarginContainer

@onready var letter_display_timer: Timer = $LetterDisplayTimer
@onready var label: Label = $MarginContainer/Label

const MAX_WIDTH = 256

var text = ""

var letter_index = 0
var letter_time = 0.03
var space_time = 0.06 # we got albert einstien over here
var punctuation_time = 0.02

signal finished()

func display_text(display_text: String):
	text = display_text
	label.text = display_text
	
	await resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)
	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized
		await resized
		
		custom_minimum_size.y = size.y
	
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24
	
	label.text = ""
	display_letters()


func display_letters():
	label.text += text[letter_index]
	letter_index += 1
	
	if letter_index >= text.length():
		finished.emit()
		return
	
	match text[letter_index]:
		"!", ".", "?", ",":
			letter_display_timer.start(punctuation_time)
		" ":
			letter_display_timer.start(space_time)
		_:
			letter_display_timer.start(letter_time)


func _on_letter_display_timer_timeout() -> void:
	display_letters()
