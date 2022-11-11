varying vec3 v_position;
uniform float u_time;

float rect(vec2 pt, vec2 size, vec2 centre, vec2 anchor) {
  vec2 offsetpt = pt - centre;
  vec2 halfsize = size / 2.0;

  float horz = step(-halfsize.x - anchor.x, offsetpt.x) - step(halfsize.x - anchor.x, offsetpt.x);
  float vert = step(-halfsize.y - anchor.y, offsetpt.y) - step(halfsize.y - anchor.y, offsetpt.y);
  
  return horz * vert;
}

mat2 getRotationMatrix(float theta) {
  float s = sin(theta);
  float c = cos(theta);

  return mat2(c, -s, s, c);
}


void main() {
  vec2 centre = vec2(0.0);

  mat2 matr = getRotationMatrix(u_time);
  vec2 p = matr * v_position.xy;

  // tl: (0.25, -0.25) bl: (-0.25), br: (0.25, 0.0), tr: (0.25)
  vec2 anchor = vec2(0.25, -0.25);

  float square = rect(p, vec2(0.5), centre, anchor);

  vec3 colour = vec3(1.0, 1.0, 0.0) * square;

  gl_FragColor = vec4(colour, 1.0);
}