shader_type spatial;
render_mode unshaded;
const int num_colors = 4;
uniform vec4 colors[num_colors];
uniform float outline_width = 1;
uniform float outline_softness = 2;
uniform float outline_power = 2;
uniform vec4 outline_base_color = vec4(0.1, 0, 0.3, 1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Stepped Gradient effect
	vec3 light_direction = normalize(vec3(0.4, 1.0, 0.4)); // pointing to light
	float intensity = max(dot(NORMAL, light_direction), 0);
	float number_of_levels = 4.0;
	int index = int(number_of_levels * intensity);
	//intensity = floor(number_of_levels * intensity))/(number_of_levels - 1.0);
	//intensity = max(intensity, 0.1);
	
	
	// Called for every pixel the material is visible on.
	//ALBEDO = vec3(0.9, 0.2, 0.4) * intensity;
	ALBEDO = colors[index].rgb; 
	//ALBEDO = out_color.rgb;
	//ALPHA = colors[index].a;
	//ALPHA = out_color.a;
	
	
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
