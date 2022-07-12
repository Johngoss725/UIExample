extends Control

onready var audio = $Audio 

export var icon_texture:Texture = load("res://ButtonTextures/Icon.png")
export var button_hovered_texture:Texture = load("res://ButtonTextures/ButtonYellowe.png")
export var button_normal_texture:Texture = load("res://ButtonTextures/ButtonBlue.png")
export var button_clicked_texture:Texture = load("res://ButtonTextures/ButtonRed.png")

onready var vbox = $BackGround/ScrollContainer/VBoxContainer

onready var my_array = [
	"ButtonA",
	"ButtonB",
	"ButtonC",
	"ButtonD",
	"ButtonE",
	"ButtonF",
	"ButtonG",
	"ButtonH",
	"ButtonJ",
	"ButtonK",
	"ButtonL",
	"ButtonG",
	]
	
func _ready():
	var row = 0
	for items in my_array:
		
		var div_holder = ColorRect.new()
		div_holder.color = Color(0.5, 0, 0.8, 0.6)
		div_holder.rect_min_size = Vector2(400, 100)
		
		var button = TextureButton.new()
		button.texture_normal = button_normal_texture
		button.texture_hover = button_hovered_texture
		button.texture_pressed = button_clicked_texture
		button.rect_position.x = 45
		button.rect_position.y = 45
		
		button.connect("pressed", self, "play_sound", [items,"strang"])
		
		var text = Label.new()
		text.text= items
		#text.rect_min_size = Vector2(300, 70)
		
		text.align = Label.ALIGN_CENTER
		text.valign = Label.VALIGN_CENTER
		
		text.margin_left = 100
		text.margin_right = 0
		text.margin_top = 0
		text.margin_bottom = 0
		
		text.anchor_left = 0
		text.anchor_top = 0
		text.anchor_right = 1
		text.anchor_bottom = 1
		
		button.add_child(text)
		
		#var icon = TextureRect.new()
		#icon.texture = icon_texture

		#icon.rect_min_size = Vector2(50, 50)
		#icon.expand=true
		
		#button.add_child(icon)
		div_holder.add_child(button)
		
		row += 1
		vbox.add_child(div_holder)
		
func play_sound(bindings, strang):
	print("you clicked: ", bindings)
	audio.play()
