
#ifdef VERTEX
const float PI = 3.14159;


vec4 position(mat4 transform_projection, vec4 vertex_position) {
    return transform_projection * vertex_position;
}
#endif

#ifdef PIXEL

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    return vec4(1.0, 1.0, 1.0, 0.1);
}
#endif
