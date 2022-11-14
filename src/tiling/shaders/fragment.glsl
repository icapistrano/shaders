varying vec2 v_uv;
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
  float tilecount = 60.0;
  vec2 centre = vec2(0.5);

  vec2 p = fract(v_uv * tilecount);
  vec2 pt = (p-centre) + centre;

  float square = rect(pt, vec2(0.2), centre);

  vec3 colour = vec3(1.0, 1.0, 0.0) * square;

  gl_FragColor = vec4(colour, 1.0);
}