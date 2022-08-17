extends Spatial

func _process(delta):
	if Input.is_action_pressed("forward"):
		$"Viewport/Snow Gradient".position.y -= 12.5/2 * delta / 0.016667
		$"Viewport/Snow Gradient".show()

	if Input.is_action_pressed("backward"):
		$"Viewport/Snow Gradient".position.y += 12.5/2 * delta / 0.016667
		$"Viewport/Snow Gradient".show()

	if Input.is_action_pressed("left"):
		$"Viewport/Snow Gradient".position.x -= 12.5/2 * delta / 0.016667
		$"Viewport/Snow Gradient".show()

	if Input.is_action_pressed("right"):
		$"Viewport/Snow Gradient".position.x += 12.5/2 * delta / 0.016667
		$"Viewport/Snow Gradient".show()

func _input(event):
	if event is InputEventKey and !event.pressed:
		$"Viewport/Snow Gradient".hide()
