varying vec3 v_position;

//float rect(vec2 pt, vec2 size, vec2 centre) {
  //size /= 2.0;

  //float left = centre.x - size.x;
  //float right = centre.x + size.x;
  //float top = centre.y + size.y;
  //float btm = centre.y - size.y;

  //if (pt.x > left && pt.x < right && pt.y < top && pt.y > btm) {
  //  return 1.0;
  //}

  //return 0.0;
//}

float rect(vec2 pt, vec2 size, vec2 centre) {
  vec2 offsetpt = pt - centre;
  vec2 halfsize = size / 2.0;

  float horz = step(-halfsize.x, offsetpt.x) - step(halfsize.x, offsetpt.x);
  float vert = step(-halfsize.y, offsetpt.y) - step(halfsize.y, offsetpt.y);
  
  return horz * vert;
}


void main() {
  float square1 = rect(vec2(v_position.xy), vec2(0.3), vec2(-0.5, 0.0));
  float square2 = rect(vec2(v_position.xy), vec2(0.4), vec2(0.5, 0.0));

  vec3 colour = vec3(1.0, 1.0, 0.0) * square1 + vec3(0.0, 1.0, 0.0) * square2;

  gl_FragColor = vec4(colour, 1.0);
}