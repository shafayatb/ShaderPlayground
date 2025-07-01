shader_type canvas_item;

uniform float intensity : hint_range(0.0, 2.0) = 1.0;     // chalkiness
uniform float contrast : hint_range(0.0, 2.0) = 1.5;      // contrast boost
uniform vec4 speckle_color : source_color = vec4(1,1,1,1); // chalk speckles color
uniform float speckle_amount : hint_range(0.0, 1.0) = 0.2; // density of speckles

float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    vec4 tex = texture(TEXTURE, UV);
    // desaturate toward grayscale
    float gray = dot(tex.rgb, vec3(0.33));
    tex.rgb = mix(tex.rgb, vec3(gray), intensity);

    // increase contrast
    tex.rgb = (tex.rgb - 0.5) * contrast + 0.5;

    // overlay random speckles
    float noise = rand(UV * SCREEN_UV.xy * 512.0);
    if (noise < speckle_amount) {
        tex.rgb = mix(tex.rgb, speckle_color.rgb, 0.5);
    }

    COLOR = tex;
}
