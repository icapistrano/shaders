import {
  Scene,
  OrthographicCamera,
  WebGLRenderer,
} from 'three';

export default class SceneManager {
  public scene: Scene;
  private camera: OrthographicCamera;
  private renderer: WebGLRenderer;

  constructor(canvas) {
    this.scene = new Scene();

    const left = -1;
    const right = 1;
    const top = 1;
    const btm = -1;
    const near = 0.1;
    const far = 10;
    this.camera = new OrthographicCamera(left, right, top, btm, near, far);
    this.camera.position.setZ(1);

    this.renderer = new WebGLRenderer({ canvas: canvas });
    this.renderer.setSize(window.innerWidth, window.innerHeight);

    this.onWindowResize();
  }

  onWindowResize() {
    const aspectRatio = window.innerWidth / window.innerHeight;
    let width, height;
    if (aspectRatio >= 1) {
      width = 1;
      height = (window.innerHeight / window.innerWidth) * width;
      
    } else {
      width = aspectRatio;
      height = 1;
    }

    this.camera.left = -width;
    this.camera.right = width;
    this.camera.top = height;
    this.camera.bottom = -height;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(window.innerWidth, window.innerHeight);
  }

  addChild(obj) {
    this.scene.add(obj);
  }

  update() {
    this.renderer.render( this.scene, this.camera );
  }
}