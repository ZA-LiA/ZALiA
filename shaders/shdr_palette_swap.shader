//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~

//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// Get palette as texture
uniform sampler2D Palette;

// Color Offset Index
uniform float Offset;


void main()
{
    // reference color
    // gm_BaseTexture = the sprite image
    vec4 ref = texture2D(gm_BaseTexture, v_vTexcoord);
    // vec2 uv_coord = vec2(column, row);
    vec2 uv_coord = vec2(ref.r, Offset);
    // vec2 uv_coord = vec2(0.013, Offset);
    
    vec4 new_color = texture2D(Palette, uv_coord);
    gl_FragColor = new_color;
    gl_FragColor.a = ref.a;
}
