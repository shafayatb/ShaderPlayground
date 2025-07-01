shader_type canvas_item;

uniform float intensity : hint_range(0.0, 2.0) = 1.0;
uniform float contrast : hint_range(0.0, 2.0) = 1.5;
uniform vec4 speckle_color : source_color = vec4(1.0);
uniform float speckle_amount : hint_range(0.0, 1.0) = 0.1;
uniform float scratch_strength : hint_range(0.0, 1.0) = 0.5;
uniform float scratch_speed : hint_range(0.0, 10.0) = 1.0;
// @param scratch_dir Set scratch direction (X, Y)
uniform vec2 scratch_dir = vec2(1.0, 0.0);

float rand(vec2 co) {
    return fract(sin(dot(co.xy, vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    vec2 uv = UV;
    vec4 tex = texture(TEXTURE, uv);

    // Desaturate + contrast
    float gray = dot(tex.rgb, vec3(0.33));
    tex.rgb = mix(tex.rgb, vec3(gray), intensity);
    tex.rgb = (tex.rgb - 0.5) * contrast + 0.5;

    // Animated chalk speckles
    vec2 v = uv * SCREEN_UV.xy * 256.0;
    float t = TIME * scratch_speed;
    float noise = rand(floor(v) + t);
    if (noise < speckle_amount) {
        tex.rgb = mix(tex.rgb, speckle_color.rgb, 0.5);
    }

    // Chalkboard scratch lines
    float projection = dot(uv, scratch_dir);
    float scratch = sin((projection * 50.0) + t * 10.0) * 0.5 + 0.5;
    scratch = smoothstep(0.6, 0.7, scratch);
    tex.rgb = mix(tex.rgb, vec3(0), scratch * scratch_strength);

    COLOR = tex;
}
