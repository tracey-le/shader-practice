shader_type spatial;
render_mode unshaded;
const int num_colors = 3;
uniform vec4 colors[num_colors];
uniform float outline_width = 1;
uniform float outline_softness = 1;
uniform float outline_power = 1;
uniform vec4 outline_base_color = vec4(1);

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {

	
	// Stepped Gradient effect
	vec3 light_direction = normalize(vec3(0.4, 1.0, 0.4)); // pointing to light
	float intensity = max(dot(NORMAL, light_direction), 0);
	float number_of_levels = 3.0;
	int index = int(number_of_levels * intensity);
	//intensity = floor(number_of_levels * intensity))/(number_of_levels - 1.0);
	//intensity = max(intensity, 0.1);
	
	// Outline effect
	float edge1 = 1.0 - outline_width;
	float edge2 = edge1 + outline_softness;
	float fresnel = pow(1.0 - clamp(dot(NORMAL, VIEW), 0, 1), outline_power);
	float outline_intensity = mix(1.0, smoothstep(edge1, edge2, fresnel), step(0.0, edge1));
	vec4 outline_color = outline_intensity * outline_base_color;
	vec3 out_color = outline_color.rgb + colors[index].rgb * (1.0 - outline_color.a);
	
	
	// Called for every pixel the material is visible on.
	//ALBEDO = vec3(0.9, 0.2, 0.4) * intensity;
	//ALBEDO = colors[index].rgb; 
	ALBEDO = out_color.rgb;
	//ALPHA = colors[index].a;
	//ALPHA = out_color.a;
	
	
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
