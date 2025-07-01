shader_type canvas_item;

uniform sampler2D noise_tex : filter_linear, repeat_enable; 
uniform float noise_scale : hint_range(1.0, 200.0) = 50.0;
uniform float noise_speed : hint_range(0.0, 5.0) = 0.5;
uniform float speckle_threshold : hint_range(0.0,1.0) = 0.8;
uniform vec4 speckle_color : source_color = vec4(1.0);

uniform float intensity : hint_range(0.0,2.0) = 1.0;
uniform float contrast : hint_range(0.0,2.0) = 1.5;

void fragment() {
    vec4 tex = texture(TEXTURE, UV);

    // --- Desaturate & contrast
    float gray = dot(tex.rgb, vec3(0.33));
    tex.rgb = mix(tex.rgb, vec3(gray), intensity);
    tex.rgb = (tex.rgb - 0.5) * contrast + 0.5;

    // --- Speckles via noise texture
    vec2 uvn = UV * noise_scale + TIME * noise_speed;
    float n = texture(noise_tex, uvn).r;
    if (n > speckle_threshold) {
        tex.rgb = mix(tex.rgb, speckle_color.rgb, 0.5);
    }

    COLOR = tex;
}
