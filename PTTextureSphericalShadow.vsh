attribute vec4 a_position;
attribute vec2 a_texCoord;
attribute vec3 a_normal;

varying vec2 texCoord;
varying vec3 worldPosition;
varying vec3 worldNormal;

void main() {
    texCoord = a_texCoord;
    texCoord.y = 1.0 - texCoord.y;
    
    worldPosition = (CC_MVMatrix * a_position).xyz;
    worldNormal = (CC_NormalMatrix * a_normal).xyz;
    
    gl_Position = CC_MVPMatrix * a_position;
}
