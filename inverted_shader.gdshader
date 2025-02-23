shader_type canvas_item;

uniform bool invert = false;

void fragment() {
	if(invert){
		COLOR.rgb = vec3(1.0 - COLOR.r);
	}
}

