shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform bool invert = false;
uniform float contrast: hint_range(0.1, 1.0, 0.05);

void fragment() {
	vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	vec3 grey = vec3(0.5);
	float dist = screen_color.r - grey.r;

	COLOR.rgb = grey + vec3(dist * contrast);

	if(invert){
		COLOR.rgb = grey - vec3(dist * contrast);
	}
}

