varying float distToCamera;

void main() {
    float depth = (distToCamera + 100.0) * 0.007;
    
    gl_FragColor =  vec4(depth, depth, depth, 1.0);
}
