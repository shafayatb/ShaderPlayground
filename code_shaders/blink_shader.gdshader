shader_type canvas_item;

void fragment() {
	COLOR = vec4((sin(TIME*10.0)+1.0)/2.0, (cos(TIME*10.0)+1.0/2.0), 0.0, 1.0);
}


