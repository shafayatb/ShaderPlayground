shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;

uniform float wave_frequency = 10.0;
uniform float wave_speed = 4.0;
uniform float wave_amplitude = 0.005;

vec4 overlay(vec4 base, vec4 blend) {
	vec4 limit = step(0.5, base);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}

void fragment() {
	
	float wave_x = sin(UV.x * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;
	float wave_y = cos(UV.y * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;
	
	float wave_x_2 = sin(UV.x * wave_frequency * 3.0 + TIME * -wave_speed * .0) * 0.002 - 0.002;
	
	vec2 final_uv = SCREEN_UV + vec2(wave_x, wave_y);
	vec2 water_uv = UV + vec2(wave_x, wave_y) * 5.0;
	
	float foam = smoothstep(0.0, 0.005, UV.y + wave_x + wave_x_2);
	
	vec4 water_color = texture(TEXTURE, water_uv);
	vec4 screen_color = texture(screen_texture, final_uv);
	
	COLOR = overlay(water_color, screen_color); 
	COLOR.rg *= 0.75;
	COLOR.a *= foam;
}
