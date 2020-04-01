uniform vec3 shadowPoint[6];
uniform int shadowPointSize;
uniform sampler2D shadowRemapTexture;

uniform vec3 u_DirLightSourceColor[1];
uniform vec3 u_DirLightSourceDirection[1];
uniform vec3 u_AmbientLightSourceColor;

varying vec2 texCoord;
varying vec3 worldPosition;
varying vec3 worldNormal;

vec3 computeLighting(vec3 normalVector, vec3 lightDirection, vec3 lightColor, float attenuation) {
    return lightColor * max(dot(normalVector, lightDirection), 0.0) * attenuation;
}

void main() {
	float da = 1.0;
    
	for (int i = 0; i < u_shadowPointSize; ++i) {
		float d = distance(u_shadowPoint[i], worldPosition) / 150.0;
		d = min(d, 1.0);
		da *= d;
	}
    
	da = texture2D(u_shadowRemap, vec2(da, 0)).a;
	da = 1.0 - da;
    
	vec4 combinedColor = vec4(u_AmbientLightSourceColor, 1.0);
    vec3 lightDirection = normalize(u_DirLightSourceDirection[0] * 2.0);
    
    combinedColor.xyz += computeLighting(normal, -lightDirection, u_DirLightSourceColor[0], 1.0);
    
    gl_FragColor =  vec4(da, da, da, 1.0) * texture2D(CC_Texture0, texCoord) * combinedColor;
}
