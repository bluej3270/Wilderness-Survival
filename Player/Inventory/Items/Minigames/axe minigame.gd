extends TextureProgress

#when the player clicks, the minigame brodcasts the value, which the axe is watching for.
signal axe_player_clicked(value)

var frame_inc = 1 #How much per frame the value changes, modified by the setup

func _process(delta):
	if Input.is_action_just_pressed("lclick"):
		emit_signal("axe_player_clicked", self.value)
	
	self.value += frame_inc

#Set configurable values ect.
func setup(new_frame_inc):
	frame_inc = new_frame_inc

func _remove_item():
	self.queue_free()

func _ready():
	get_parent().connect("remove_hand_item", self, "_remove_item")
