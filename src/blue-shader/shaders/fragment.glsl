uniform vec3 u_colour;

void main() {
  //gl_FragColor = vec4(0.0, 0.0, 1.0, 1.0);
  gl_FragColor = vec4(u_colour, 1.0);
}