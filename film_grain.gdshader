shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform float u_grain_amount = 0.7;
uniform float u_fx = 0.5;

float rand(vec2 coord) {
	return fract(sin(dot(coord.xy, vec2(12.9898, 78.233))) * 43558.5453);
}

vec4 grain(vec4 fragColor, vec2 uv) {
	vec4 color = fragColor;
	float diff = (rand(uv) - 0.0) * u_grain_amount;
	color.r += diff;
	color.g += diff;
	color.b += diff;
	return color;
}

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 texel = texture(screen_texture, SCREEN_UV);
	
	vec4 grain = grain(texel, SCREEN_UV);
	
	COLOR = mix(texel, grain, u_fx);
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
