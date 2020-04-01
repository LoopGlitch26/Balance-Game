attribute vec4 a_position;
attribute vec2 a_texCoord;

varying vec2 texCoord;

void main() {
    texCoord = a_texCoord;
    texCoord.y = 1.0 - texCoord.y;
    
    gl_Position = CC_MVPMatrix * a_position; 
}
