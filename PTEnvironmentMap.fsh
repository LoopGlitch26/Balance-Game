uniform vec3 lightDirection;
uniform float incandescence;

#if defined(PT_PCF_SHADOWS)
uniform sampler2DShadow shadowMapTexture;
#else
uniform sampler2D shadowMapTexture;
#endif

varying vec3 viewWorldPosition;
varying vec3 worldNormal;
varying vec4 lightViewportTexCoordDivW;
varying vec3 worldPosition;

void main() {
    vec3 reflection = reflect(normalize(viewWorldPosition), normalize(worldNormal));
    float m = 2.0 * sqrt(pow(reflection.x, 2.0) + pow(reflection.y, 2.0) + pow(reflection.z + 1.0, 2.0));
    
    vec2 vN = reflection.xy / m + 0.5;
    vN.y = 1.0 - vN.y;
    
    vec3 baseColor = texture2D(CC_Texture0, vN).rgb;
    float inc = mix(0.5, 0.0, incandescence);

	float bias = max(0.0025 * (1.0 - dot(worldNormal, lightDirection)), 0.0005);
	float shadow = 1.0;

#ifdef PT_PCF_SHADOWS
#ifdef GL_EXT_shadow_samplers 
    shadow = shadow2DProjEXT(shadowMapTexture, lightViewportTexCoordDivW + vec4(0, 0, -bias / lightViewportTexCoordDivW.w, 0));
#else
    shadow = shadow2DProj(shadowMapTexture, lightViewportTexCoordDivW + vec4(0, 0, -bias / lightViewportTexCoordDivW.w, 0)).z;
#endif
#else
    float depth = texture2DProj(shadowMapTexture, lightViewportTexCoordDivW + vec4(0, 0, -bias / lightViewportTexCoordDivW.w, 0)).x;
    float R = (lightViewportTexCoordDivW + vec4(0, 0, -bias / lightViewportTexCoordDivW.w, 0)).p / (lightViewportTexCoordDivW + vec4(0, 0, -bias / lightViewportTexCoordDivW.w, 0)).q;
            
    shadow = (R <= depth) ? 1.0 : 0.0;
#endif

    gl_FragColor = vec4(baseColor, 1.0) * mix(vec4(1.0, 1.0, 1.0, 0.0), vec4(shadow, shadow, shadow, 1.0), vec4(inc, inc, inc, 1.0));
}
