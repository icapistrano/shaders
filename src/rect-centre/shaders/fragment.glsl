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
  float vert = step(-halfsize.y, offsetpt.y) - step(halfsize.x, offsetpt.y);
  
  return horz * vert;
}

void main() {
  vec3 colour = vec3(0.0);
  colour.r = rect(vec2(v_position.xy), vec2(0.5), vec2(0.0));
  colour.g = rect(vec2(v_position.xy), vec2(0.5), vec2(0.0));

  gl_FragColor = vec4(colour, 1.0);
}