extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_grain_mix_slider_value_changed(value: float) -> void:
	var mat = material as ShaderMaterial
	mat.set_shader_parameter("u_fx", value)


func _on_grain_amount_slider_value_changed(value: float) -> void:
	var mat = material as ShaderMaterial
	mat.set_shader_parameter("u_grain_amount", value)
