extends Control

func set_health(v):
	$"HUD/VBoxContainer/Top/HBoxContainer/Stat Bars/Health/Health Bar".value = v

func set_stamina(v):
	$"HUD/VBoxContainer/Top/HBoxContainer/Stat Bars/Stamina/Stamina Bar".value = v

func set_hunger(v):
	$"HUD/VBoxContainer/Top/HBoxContainer/Stat Bars/Hunger/Hunger Bar".value = v

func set_temperature(v):
	$"HUD/VBoxContainer/Top/HBoxContainer/Temperature/HBoxContainer/Temp".text = str(v)

#TODO: set hotbar function
