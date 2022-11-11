varying vec3 v_position;
uniform float u_time;

float rect(vec2 pt, vec2 size, vec2 centre) {
  vec2 offsetpt = pt - centre;
  vec2 halfsize = size / 2.0;

  float horz = step(-halfsize.x, offsetpt.x) - step(halfsize.x, offsetpt.x);
  float vert = step(-halfsize.y, offsetpt.y) - step(halfsize.y, offsetpt.y);
  
  return horz * vert;
}

mat2 getRotationMatrix(float theta) {
  float s = sin(theta);
  float c = cos(theta);

  return mat2(c, -s, s, c);
}


void main() {
  vec2 centre = vec2(0.2);

  mat2 mat = getRotationMatrix(u_time);

  // to apply offset, - offset to original point, rotate point, + offset to point
  //vec2 p = (mat * (v_position.xy - centre)) + centre;

  vec2 p = mat * v_position.xy;

  float square = rect(p, vec2(0.1), centre);

  vec3 colour = vec3(1.0, 1.0, 0.0) * square;

  gl_FragColor = vec4(colour, 1.0);
}