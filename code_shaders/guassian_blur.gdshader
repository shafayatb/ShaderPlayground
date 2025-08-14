shader_type canvas_item;

uniform vec2 target = vec2(0.5);
uniform float intensity: hint_range(0.0, 100.0, 0.01) ;
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
	COLOR.rgb = textureLod(screen_texture, SCREEN_UV, 6.0 * intensity *
			(distance(target, UV)/sqrt(2))).rgb;
}
