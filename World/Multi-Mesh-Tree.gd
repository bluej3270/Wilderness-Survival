extends MultiMeshInstance

func _ready():
	var multimesh = get_node('.').multimesh
	
	for index in multimesh.instance_count:
		var collision_shape = CollisionShape.new()
		var mesh_tran = multimesh.get_instance_transform(index)
		
		collision_shape.shape = multimesh.mesh.create_trimesh_shape()
		
		collision_shape.transform.basis.x = mesh_tran.basis.x
		collision_shape.transform.basis.z = mesh_tran.basis.z
		collision_shape.transform.basis.y = mesh_tran.basis.y
		collision_shape.scale = Vector3(1, 1, 1)
		
		collision_shape.rotation.y = 25.132
		collision_shape.rotation.z = 25.132
		collision_shape.rotation.x = 25.132
		
		var static_body = StaticBody.new()
		static_body.add_to_group("tree")
		static_body.transform = mesh_tran
		static_body.add_child(collision_shape)
		self.add_child(static_body)
		
		index += 1
