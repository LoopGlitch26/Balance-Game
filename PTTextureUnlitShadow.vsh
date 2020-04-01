uniform mat4 worldToLightViewportTexCoord;

attribute vec4 a_position;
attribute vec3 a_normal;
attribute vec2 a_texCoord;

varying vec2 texCoord;
varying vec4 lightViewportTexCoordDivW;
varying vec3 worldPosition;
varying vec3 worldNormal;
varying float viewDepth;

void main() {
    texCoord = a_texCoord;
    texCoord.y = 1.0 - texCoord.y;

    worldPosition = (CC_MVMatrix * a_position).xyz;
    worldNormal = (CC_NormalMatrix * a_normal).xyz;
    lightViewportTexCoordDivW = worldToLightViewportTexCoord * vec4(worldPosition, 1.0);
	
    gl_Position = CC_MVPMatrix * a_position;
    viewDepth = gl_Position.z;
}
