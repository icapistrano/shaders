varying vec3 v_position;
uniform float u_time;

float rect(vec2 pt, vec2 size, vec2 centre) {
  vec2 offsetpt = pt - centre;
  vec2 halfsize = size / 2.0;

  float horz = step(-halfsize.x, offsetpt.x) - step(halfsize.x, offsetpt.x);
  float vert = step(-halfsize.y, offsetpt.y) - step(halfsize.y, offsetpt.y);
  
  return horz * vert;
}


void main() {
  float radius = 0.4;
  float speed = u_time * 2.0;
  vec2 centre = vec2(cos(speed) * radius, sin(speed) * radius);

  float square = rect(vec2(v_position.xy), vec2(0.1), centre);

  vec3 colour = vec3(1.0, 1.0, 0.0) * square;

  gl_FragColor = vec4(colour, 1.0);
}