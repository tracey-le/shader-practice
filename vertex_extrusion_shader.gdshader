shader_type spatial;
render_mode unshaded;
render_mode cull_front;
const int num_colors = 4;
uniform vec4 colors[num_colors];
uniform float outline_width = 1;
uniform float outline_softness = 2;
uniform float outline_power = 2;
uniform vec4 outline_base_color : source_color = vec4(0.1, 0, 0.3, 1);


void vertex() {
	// Called for every vertex the material is visible on.
	VERTEX += NORMAL * outline_width;
}

void fragment() {
	// Stepped Gradient effect
	ALBEDO = outline_base_color.rgb; 
	//ALBEDO = out_color.rgb;
	//ALPHA = colors[index].a;
	//ALPHA = out_color.a;
	
	
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
