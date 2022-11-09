import '../css/style.css';

import {
  PlaneGeometry,
  ShaderMaterial,
  Mesh,
  Color
} from 'three';

import SceneManager from '../../components/SceneManager';

import vertexShader from '../shaders/vertex.glsl';
import fragmentShader from '../shaders/fragment.glsl';


const sceneManager = new SceneManager(document.getElementById("webgl-canvas"));

// data passed to control program and shaders
const uniforms = {
  u_resolution: {value: { x:window.innerWidth, y:window.innerHeight }},
  u_colour1: {value: new Color(0xFF0000)},
  u_colour2: {value: new Color(0x0000FF)}
}

// init plane to apply our shaders on
const geometry = new PlaneGeometry(2, 2);
const material = new ShaderMaterial({
  uniforms: uniforms,
  vertexShader: vertexShader,
  fragmentShader: fragmentShader
});

const plane = new Mesh(geometry, material);
sceneManager.addChild(plane);

window.addEventListener('resize', (e) => {
  sceneManager.onWindowResize();
  uniforms.u_resolution.value.x = window.innerWidth;
  uniforms.u_resolution.value.y = window.innerHeight;
})

function animate() {
  requestAnimationFrame(animate);
  sceneManager.update();
}

animate();