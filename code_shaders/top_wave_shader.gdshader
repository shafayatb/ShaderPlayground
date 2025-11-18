shader_type canvas_item;

uniform float wave_frequency = 20.0;
uniform float wave_speed = 1.0;
uniform float wave_amplitude = 0.025;

void fragment() {
	
	float wave_x = sin(UV.x * wave_frequency + TIME * wave_speed) * wave_amplitude - wave_amplitude;
	float wave_x_2 = sin(UV.x * wave_frequency * 2.0 + TIME * -2.0) * 0.01 - 0.01;
	
	float mask = smoothstep(0, 0.025, UV.y + wave_x + wave_x_2);
	
	COLOR = texture(TEXTURE, UV);
	COLOR.a *= mask;
}
