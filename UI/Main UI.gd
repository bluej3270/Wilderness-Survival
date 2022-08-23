extends Control

var pos = 1
var selected_item

func _process(delta):
	hotbar_manager()

func set_health(v):
	$"HUD/VBoxContainer/Top/HBoxContainer/Stat Bars/Health/Health Bar".value = v

func set_stamina(v):
	$"HUD/VBoxContainer/Top/HBoxContainer/Stat Bars/Stamina/Stamina Bar".value = v

func set_hunger(v):
	$"HUD/VBoxContainer/Top/HBoxContainer/Stat Bars/Hunger/Hunger Bar".value = v

func set_temperature(v):
	$"HUD/VBoxContainer/Top/HBoxContainer/Temperature/HBoxContainer/Temp".text = str(v)

func hotbar_manager():
	#Sropll wheel, controller bumbers, ect, change the selected item
	if Input.is_action_just_released("hotbar_next"):
		pos += 1
	if Input.is_action_just_released("hotbar_last"):
		pos -= 1
	
	#Chose the selected item with a number key
	if Input.is_key_pressed(49):
		pos = 0
	if Input.is_key_pressed(50):
		pos = 1
	if Input.is_key_pressed(51):
		pos = 2
	if Input.is_key_pressed(52):
		pos = 3
	if Input.is_key_pressed(53):
		pos = 4
	if Input.is_key_pressed(54):
		pos = 5
	if Input.is_key_pressed(55):
		pos = 6
	if Input.is_key_pressed(56):
		pos = 7
	if Input.is_key_pressed(57):
		pos = 8
	if Input.is_key_pressed(48):
		pos = 9
	
	#make the pos loop, if it goes over 10 it should loop back to 1, and under 1 should loop back to 10
	if pos > 9:
		pos = 0
	if pos < 0:
		pos = 9
	
	#get item at position
	selected_item = $Tools.get_item_at(Vector2(pos, 0))
	
	#_select item on ctrlGridInventory 
	$HUD/VBoxContainer/Bottom/HBoxContainer/CtrlInventoryGrid._select(selected_item)
