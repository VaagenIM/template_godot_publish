extends RichTextLabel

var t = self.text  # text
var p = 0  # progress

var translate = {
	'Apostrophe': 'æ',
	'QuoteLeft': 'ø',
	'BracketRight': 'å',
}


func _ready():
	color()


func _input(event):
	var e = event.as_text()
	if not "scancode" in event or event.pressed:
		return
	if event.as_text() in translate:
		e = translate[event.as_text()]
	if e.to_lower() == t[p].to_lower():
		correct_input()
		color()
		if p >= len(t):
			self.get_owner().queue_free()
	else:
		p = 0
		color()
	
		
func correct_input():
	p += 1
	if p < len(t) and t[p] == ' ':
		correct_input()


func color():
	self.text = ''
	self.push_color(self.get_owner().typing_color)
	self.add_text(t.left(p))
	self.push_color(self.get_owner().text_color)
	self.add_text(t.right(p))
