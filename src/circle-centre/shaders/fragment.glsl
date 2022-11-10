varying vec3 v_position;

float inverseColour(float s) {
  if (s == 0.0) {
    return 1.0;
  }
  return 0.0;
}

void main() {
  vec3 colour = vec3(0.0);
  colour.r = 1.0 - step(0.2, length(v_position.xy));
  colour.g = 1.0 - step(0.2, length(v_position.xy));

  gl_FragColor = vec4(colour, 1.0);
}