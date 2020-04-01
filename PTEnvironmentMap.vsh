uniform mat4 viewMatrix;
uniform mat4 worldToLightViewportTexCoord;

attribute vec4 a_position;
attribute vec3 a_normal;

varying vec4 lightViewportTexCoordDivW;
varying vec3 viewWorldPosition;
varying vec3 worldPosition;
varying vec3 worldNormal;

void main() {
    viewWorldPosition = (CC_MVPMatrix * a_position).xyz;
    worldPosition = (CC_MVMatrix * a_position).xyz;
    worldNormal = (CC_NormalMatrix * a_normal).xyz;
    lightViewportTexCoordDivW = worldToLightViewportTexCoord * vec4(worldPosition, 1.0);

    gl_Position = CC_MVPMatrix * a_position;

}
