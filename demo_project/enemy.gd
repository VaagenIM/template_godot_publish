tool
extends RigidBody2D

export var damage := 1
export var text := 'default' setget set_text, get_text
export var typing_color: = Color.white
export var text_color: = Color.red


func get_text():
	return $text.text


func set_text(val):
	$text.text = val
	$text.t = val
