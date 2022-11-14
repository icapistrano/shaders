varying vec3 v_position;
uniform float u_time;

float rect(vec2 pt, vec2 size, vec2 centre) {
  vec2 offsetpt = pt - centre;
  vec2 halfsize = size / 2.0;

  float horz = step(-halfsize.x, offsetpt.x) - step(halfsize.x, offsetpt.x);
  float vert = step(-halfsize.y, offsetpt.y) - step(halfsize.y, offsetpt.y);
  
  return horz * vert;
}

mat2 getScaleMatrix(float scalex, float scaley) {
  return mat2(scalex, 0.0, 0.0, scaley);
}


void main() {
  vec2 centre = vec2(0.0);

  vec2 pt = getScaleMatrix((cos(u_time)+1.0) / 2.0 + 0.5, (sin(u_time)+1.0) / 2.0 + 0.5) * v_position.xy;

  float square = rect(pt, vec2(0.5), centre);

  vec3 colour = vec3(1.0, 1.0, 0.0) * square;

  gl_FragColor = vec4(colour, 1.0);
}