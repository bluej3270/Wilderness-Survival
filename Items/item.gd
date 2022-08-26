extends Spatial

var properties

func set_properties(p):
	properties = p
	read_properties(properties)

func read_properties(_properties):
	print("Item doesn't override read_properties!")
