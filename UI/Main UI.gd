extends Control

var pos = 1
var selected_item
var selected_item_instance
var pos_switched = false
var properties

var tab_shown = false

signal remove_hand_item

func _process(delta):
	hotbar_manager()

	if Input.is_action_just_pressed("esc"):
		tab_shown = not tab_shown
		
		if tab_shown:
			$"Tab UI".show()
			$HUD.hide()
		else:
			$"Tab UI".hide()
			$HUD.show()

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
		pos_switched = true
	if Input.is_action_just_released("hotbar_last"):
		pos -= 1
		pos_switched = true
	
	#Chose the selected item with a number key
	if Input.is_key_pressed(49):
		pos = 0
		pos_switched = true
	if Input.is_key_pressed(50):
		pos = 1
		pos_switched = true
	if Input.is_key_pressed(51):
		pos = 2
		pos_switched = true
	if Input.is_key_pressed(52):
		pos = 3
		pos_switched = true
	if Input.is_key_pressed(53):
		pos = 4
		pos_switched = true
	if Input.is_key_pressed(54):
		pos = 5
		pos_switched = true
	if Input.is_key_pressed(55):
		pos = 6
		pos_switched = true
	if Input.is_key_pressed(56):
		pos = 7
		pos_switched = true
	if Input.is_key_pressed(57):
		pos = 8
		pos_switched = true
	if Input.is_key_pressed(48):
		pos = 9
		pos_switched = true
	
	#make the pos loop, if it goes over 10 it should loop back to 1, and under 1 should loop back to 10
	if pos > 9:
		pos = 0
	if pos < 0:
		pos = 9
	
	if pos_switched:
		pos_switched = false

		#Remove the item cuttently in the hand
		emit_signal("remove_hand_item")
		
		#get item at position
		selected_item = $Tools.get_item_at(Vector2(pos, 0))
		
		#_select item on ctrlGridInventory 
		$HUD/VBoxContainer/Bottom/HBoxContainer/CtrlInventoryGrid._select(selected_item)
		
		if selected_item:
			

			#instance item
			selected_item_instance = load(selected_item.get_property("path")).instance()
			
			#feed properties to item
			properties = selected_item.get_property("properties")
			selected_item_instance.setup(properties)
			
			#apply transforms. 
			var transform_prop = selected_item.get_property("transform")
			var t = Transform(Vector3(transform_prop[0][0], transform_prop[0][1], transform_prop[0][2]), Vector3(transform_prop[1][0], transform_prop[1][1], transform_prop[1][2]), Vector3(transform_prop[2][0], transform_prop[2][1], transform_prop[2][2]), Vector3(transform_prop[3][0], transform_prop[3][1], transform_prop[3][2]))
			selected_item_instance.set_transform(t)
			
			#add to scene
			if selected_item.get_property("location"): #if selected_item.get_property("location") returns a path, put the thing there. Otherwise, it should return null
				pass #put the instance at the bone provided by selected_item.get_property("location")
			else:
				get_parent().get_parent().get_parent().get_righthand_bone().add_child(selected_item_instance) 
		
