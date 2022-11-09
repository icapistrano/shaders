uniform vec2 u_mouse;
uniform vec2 u_resolution;


void main() {
  vec2 pos = vec2(u_mouse / u_resolution);
  gl_FragColor = vec4(pos.x, 1.0, pos.y, 1.0);
}