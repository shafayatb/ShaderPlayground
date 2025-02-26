shader_type canvas_item;

uniform float g_color: hint_range(0.0, 1.0, 0.1) = 0;
uniform float b_color: hint_range(0.0, 1.0, 0.1) = 0;
uniform float millies;
uniform vec3 color;
const int num_circles = 100;
uniform vec3 circles[num_circles];

varying vec2 pos;

void fragment() {
	/* Basic gradient shader example
	float current_a = texture(TEXTURE, UV).a;
	vec2 newPos = fract(UV * 2.);
	float c= (sin(UV.x * 16. + millies / 1000.) + 1.)/2.;
	vec4 target_color = mix(texture(TEXTURE, UV), vec4(vec3(c, g_color, b_color), current_a), .5);
	COLOR = target_color;
	*/
	/*
	//Image manipulation
	vec4 col = texture(TEXTURE, UV);
	float avg = (col.r + col.g + col.b) / 3.0; //grey scale
	COLOR = vec4(avg, avg, avg,1.0);
	*/
	/*
	uniform array example
	COLOR = vec4(color, 1);
	*/
	/*
	Circle SDF
	
	vec3 circle = vec3(0.5, 0.5, 0.3);
	float d = length(UV - circle.xy) - circle.z;
	//COLOR = vec4(d, d, d, 1.0);
	d = smoothstep(0.0, 0.01, d);
	float current_a = texture(TEXTURE, UV).a;
	vec4 target_color = mix(texture(TEXTURE, UV), vec4(vec3(d, d, d), current_a), .8);
	COLOR = target_color;
	*/
	float colour = 1.0;
	for (int i = 0; i < num_circles; i++) {
		float d = length(UV - circles[i].xy) - circles[i].z;
		d = step(0.0, d);
		colour *= d;
	}
	
	float current_a = texture(TEXTURE, UV).a;
	vec4 target_color = mix(texture(TEXTURE, UV), vec4(vec3(colour, colour, colour), current_a), .8);
	COLOR = target_color;
}

