extends Spatial

var setup = false

var durability
var power
var raycast
var tree

var properties

onready var player = get_parent().get_parent().get_parent()
onready var minigame = load("res://Player/Inventory/Items/Minigames/axe minigame.tscn")

func setup(p):
	properties = p
	durability = properties[0]
	power = properties[1]

func _process(delta):
	if raycast.is_colliding() and Input.is_action_just_pressed("lclick"):
		if raycast.get_collider().is_in_group("tree"):
			#child the minigame to the camera
			var i = minigame.instance()
			minigame.connect("axe_player_clicked", self, "_damage_tree")
			player.get_camera().add_child(i)
			tree = raycast.get_collider()
			

func _ready():
	raycast = player.get_raycast()

	#Remove self if the selected item changes
	var main_ui = player.get_main_ui()
	main_ui.connect("remove_hand_item", self, "_remove_item")

func _remove_item():
	self.queue_free()

func _damage_tree(value):
	print(value)
