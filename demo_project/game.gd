extends Node2D

var health = 50
onready var words = loadfile('res://ordliste.tres')
var enemy = load("res://enemy.tscn")

var spawnrate = 0.8
var spawn_tick = 0
var time = 0


var colors = [
	Color.green,
	Color.aliceblue,
	Color.cornflower,
	Color.darkmagenta,
]


func _on_Danger_Zone_area_entered(area):
	health = health - area.get_owner().damage
	if health < 0:
		pass  # end game (not implemented)
	area.get_owner().queue_free()


func _ready():
	add_enemy()


func _process(delta):
	spawn_tick += delta
	time += delta  # score (not implemented)
	if spawn_tick > spawnrate:
		add_enemy()
		spawn_tick = 0


func add_enemy():
	var o = enemy.instance()
	o.text = random_word()
	o.damage = len(o.text)
	o.position.x = rand_range(0, get_viewport().size.x - (len(o.text) * 12))
	o.position.y = rand_range(-25, -150)
	o.gravity_scale = 3 / len(o.text) + 0.1
	o.typing_color = Color.gold
	o.text_color = colors[randi() % colors.size()]
	add_child(o)
	

func loadfile(lang: String):
	var file = File.new()
	file.open(lang, File.READ)
	var content = file.get_as_text()
	file.close()
	return content.split('\n')


func random_word():
	randomize()
	var word = words[randi() % words.size()]
	if word:
		return word
	return random_word()
