shader_type canvas_item;

uniform float uv_scale : hint_range(0.0, 5.0, 0.1) = 1.0;
varying vec2 world_uv;

void vertex() {
	world_uv = (MODEL_MATRIX * vec4(VERTEX.xy, 0.0, 1.0)).xy / 128.0;
}

void fragment() {
	COLOR = texture(TEXTURE, world_uv * uv_scale);
}
