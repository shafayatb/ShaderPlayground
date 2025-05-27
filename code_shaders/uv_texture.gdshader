shader_type canvas_item;

uniform sampler2D gradient_texture;

void fragment() {
	vec4 gradient_color = texture(gradient_texture, UV);

	COLOR.rgb = gradient_color.rgb;
}
