shader_type canvas_item;

uniform float darkness : hint_range(0.0, 1.0) = 0.0;

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    color.rgb *= 1.0 - darkness;
    COLOR = color;
}
