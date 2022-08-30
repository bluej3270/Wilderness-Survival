extends Spatial

var setup = false

var durability
var power
var raycast

var properties

func set_properties(p):
	properties = p
	print(properties)


func _process(delta):
	print(properties)
	if raycast.is_colliding() and Input.is_action_just_pressed("lclick"):
		if raycast.get_collider().is_in_group("tree"):
			
			durability = properties[0]
			print(durability)

func _ready():
	raycast = get_parent().get_parent().get_parent().get_raycast()
