attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4(in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}




//######################_==_YOYO_SHADER_MARKER_==_######################@~// This is a modified version of Pixelated Pope's palette swapper

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 texel_size;
uniform sampler2D palette_texture;
uniform float palette_index;

/* `palette_texture_UVs.xyzw`: normalized coords of 
`palette_texture`(`global.palette_image`) within its 
texture page(within itself if it's a surface) PLUS half `texel_size`(texel w/h)
`x`: xl + (half `texel_size.x`)
`y`: yt + (half `texel_size.y`)
`z`: xr + (half `texel_size.x`)
`w`: yb + (half `texel_size.y`)
*/
uniform vec4 palette_texture_UVs;

/* ALPHA0_COLOR: Color of `global.C_ALPHA0` which is mid-grey $7F7F7F(as of 2025/05/15).
Any pixels of this color will have their alpha set to 0.0.
This can be useful if you need to remove specific pixels, like an odd shape, 
from an image created during runtime.
Example: See how the map tears are dealt with in `PauseMenu_draw_map()`
*/
uniform vec3 ALPHA0_COLOR;




void main()
{
    vec4 _source = texture2D(gm_BaseTexture, v_vTexcoord);
    
    //DoAlphaTest(_source); // is this necessary? I(HoverBat) don't know what this does. Commenting it out seems to work fine.
    
    if (_source.rgb==ALPHA0_COLOR)
    {   // Modification by HoverBat to cut out complicated shapes from an image on the fly.
        _source.a = 0.0;
    }
    else
    {
        for(float _i=palette_texture_UVs.y; _i<palette_texture_UVs.w; _i+=texel_size.y) // goes through each base color in `global.palette_image`
        {   /* `if (distance(_source, texture2D(palette_texture, vec2(palette_texture_UVs.x, _i))) <= 0.004)`:
            `<= 0.004`: I(HoverBat) didn't write this code so I'm not sure why this 
            doesn't just check if the colors are equal.
            Maybe this is a color tolerance condition where the colors don't need to be exact?
            Or maybe the `texture2D` return value may not be precise enough on certain platforms?
            According to (https://gmshaders.com/tutorials/datatypes/#dimensions), 
            low precision(lowp) floats are adequate for colors.
            */
            if (_source==texture2D(palette_texture, vec2(palette_texture_UVs.x, _i)))
            //if (distance(_source, texture2D(palette_texture, vec2(palette_texture_UVs.x, _i))) <= 0.004)
            {
                float _palette_VX = palette_texture_UVs.x + texel_size.x * palette_index;
                _source = texture2D(palette_texture, vec2(_palette_VX, _i));
                break;//_i
            }
        }
    }

    gl_FragColor = _source * v_vColour;
}


/*
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;

void main()
{
    vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
    
    DoAlphaTest( source );
    
    for(float i = palette_UVs.y; i < palette_UVs.w; i+=texel_size.y )
    {
        if (distance(source, texture2D(palette_texture, vec2(palette_UVs.x, i))) <= 0.004)
        {
            float palette_V = palette_UVs.x + texel_size.x * palette_index;
            source = texture2D(palette_texture, vec2(palette_V, i));
            break;
        }
    }

    gl_FragColor = source * v_vColour;
}
*/




