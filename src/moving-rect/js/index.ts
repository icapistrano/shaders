import '../css/style.css';

import {
  PlaneGeometry,
  ShaderMaterial,
  Mesh,
  Clock
} from 'three';

import SceneManager from '../../components/SceneManager';

import vertexShader from '../shaders/vertex.glsl';
import fragmentShader from '../shaders/fragment.glsl';


const sceneManager = new SceneManager(document.getElementById("webgl-canvas"));

// data passed to control program and shaders
const uniforms = {
  u_time: { value: 0.0 },
  u_resolution: { value: {x:window.innerWidth, y:window.innerHeight} }
}

const clock = new Clock();

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
  uniforms.u_time.value += clock.getDelta();
  sceneManager.update();
}

animate();