extends "res://Items/item.gd"

var durability
var power

func read_properties(properties):
	durability = properties[0]
	power = properties[1]
	
	print(durability)
	print(power)
