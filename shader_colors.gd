extends MeshInstance3D
@export var colors: PackedColorArray

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var color_shader_material := mesh.surface_get_material(0) as ShaderMaterial
	color_shader_material.set_shader_parameter("colors", colors)
	var colors_from_shader = color_shader_material.get_shader_parameter("colors")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
