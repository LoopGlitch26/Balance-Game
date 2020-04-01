uniform vec4 diffuseColor;
uniform int hasTexture;
uniform float incandescence;
uniform vec2 textureScale;
uniform vec2 textureOffset;
uniform int opacityState;
uniform int multiplyAlpha;

varying vec2 texCoord;
varying vec4 lightViewportTexCoordDivW;
varying vec3 worldPosition;
varying vec3 worldNormal;
varying float viewDepth;

#pragma include PTLight.inc.fsh

void main() {
    float shadow = 1.0;
    computeShadow(worldNormal, viewDepth, lightViewportTexCoordDivW, shadow);

	float inc = mix(0.5, 0.0, incandescence);
    vec4 shade = vec4(shadow, shadow, shadow, 1.0);
    
	if (hasTexture == 1) {
		gl_FragColor = texture2D(CC_Texture0, texCoord / textureScale + textureOffset) * diffuseColor * mix(vec4(1.0, 1.0, 1.0, 0.0), shade, vec4(inc, inc, inc, 1.0));  // was 0.5
	}
	else {
		gl_FragColor = diffuseColor * mix(vec4(1.0, 1.0, 1.0, 0.0), shade, vec4(inc, inc, inc, 1.0));  // was 0.5
	}
    
    if (opacityState == 0) {
        gl_FragColor.a = 1.0;
    }
    else if (diffuseColor.a < 1.0 && multiplyAlpha == 1) {
        gl_FragColor.r *= diffuseColor.a;
        gl_FragColor.g *= diffuseColor.a;
        gl_FragColor.b *= diffuseColor.a;
    }
}
