attribute vec4 a_position;

varying float distToCamera;

void main() {
    distToCamera = -(CC_MVMatrix * a_position).z;
    
    gl_Position = CC_MVPMatrix * a_position;
}
