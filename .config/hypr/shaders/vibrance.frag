#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

void main() {
    vec4 color = texture(tex, v_texcoord);
    float average = (color.r + color.g + color.b) / 3.0;
    float saturation = 1.7; 
    
    vec3 outColor = average + saturation * (color.rgb - average);
    fragColor = vec4(outColor, color.a);
}
