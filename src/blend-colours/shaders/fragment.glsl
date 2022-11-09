uniform vec2 u_resolution;
uniform vec3 u_colour1;
uniform vec3 u_colour2;

void main() {
  vec2 uv = gl_FragCoord.xy / u_resolution;
  vec3 colour = mix(u_colour1, u_colour2, uv.x);
  gl_FragColor = vec4(colour, 1.0);
}