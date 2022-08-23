extends Spatial

func _process(delta):
	if Input.is_action_pressed("forward"):
		$"Viewport/Sprite".position.y -= 12.5/2 * delta / 0.016667
		$"Viewport/Sprite".show()

	if Input.is_action_pressed("backward"):
		$"Viewport/Sprite".position.y += 12.5/2 * delta / 0.016667
		$"Viewport/Sprite".show()

	if Input.is_action_pressed("left"):
		$"Viewport/Sprite".position.x -= 12.5/2 * delta / 0.016667
		$"Viewport/Sprite".show()

	if Input.is_action_pressed("right"):
		$"Viewport/Sprite".position.x += 12.5/2 * delta / 0.016667
		$"Viewport/Sprite".show()

func _input(event):
	if event is InputEventKey and !event.pressed:
		$"Viewport/Sprite".hide()
