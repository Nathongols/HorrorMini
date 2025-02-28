
#ifdef VERTEX
const float PI = 3.14159;


vec4 position(mat4 transform_projection, vec4 vertex_position) {
    return transform_projection * vertex_position;
}
#endif

#ifdef PIXEL
// extern number time;
extern float setting1 = 400.f;
extern float setting2 = 600.f;
extern float curve = 0.2f;
extern float time;

vec4 effect(vec4 color, Image tex, vec2 tex_uv, vec2 pix_uv) {
    vec2 centered = tex_uv - vec2(0.5);
    float dist = dot(centered, centered);
    vec2 curved_uv = centered * (1.0 + curve * dist) + vec2(0.5);

    if (curved_uv.x < 0.0 || curved_uv.x > 1.0 ||
        curved_uv.y < 0.0 || curved_uv.y > 1.0) {
            return vec4(0.0, 0.0, 0.0, 0.0);
    }
    
    float f  = sin(tex_uv.y * setting1 * 3.14f);
    float o  = f * (0.15f / setting2);
    float s  = f * 0.07f + 0.97f;
    
    float r = Texel(tex, vec2(curved_uv.x + o, curved_uv.y + o)).x;
    float g = Texel(tex, vec2(curved_uv.x - o, curved_uv.y + o)).y;
    float b = Texel(tex, vec2(curved_uv.x,      curved_uv.y - o)).z;
    
    return vec4(r * 0.90f, g, b * 0.90f, 1) * s;
}
#endif
