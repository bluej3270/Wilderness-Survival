extends Spatial

var setup = false

var durability
var power
var raycast

var properties

onready var player = get_parent().get_parent().get_parent()

func setup(p):
	properties = p
	durability = properties[0]
	power = properties[1]

func _process(delta):
	if raycast.is_colliding() and Input.is_action_just_pressed("lclick"):
		if raycast.get_collider().is_in_group("tree"):
			pass #run the tree chopping mini-game

func _ready():
	raycast = player.get_raycast()

	#Remove self if the selected item changes
	var main_ui = player.get_main_ui()
	main_ui.connect("remove_hand_item", self, "_remove_item")

func _remove_item():
	self.queue_free()
