shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0;
uniform float noise_scale = 40.0; 

float rand(vec2 vector) {
	return fract(sin(dot(vector.xy, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
	vec4 tex = texture(TEXTURE, UV);
	
	float noise_val = rand(floor(UV * noise_scale));
	
	float mask = 1.0 - step(progress, noise_val);
	
	COLOR.a *= mask;
}


