<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html> 
<html>
<head>    
  <title>Example 01.01 - Basic skeleton</title>   
  <meta charset="UTF-8" />    
  <script  src="${root }/js/three.js"></script>    
  <script src="${root }/js/TrackballControls.js"></script>   
  <script src="${root }/js/stats.js"></script>
  <script src="${root }/js/dat.gui.js"></script>
  <script type="module" src="${root }/js/PCDLoader.js"></script>
  <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	
  <script type="text/javascript">
  	
  	
  </script>

<body>    
  <!-- Div which will hold the Output -->    
  <div id="webgl-output"></div>
    <!-- Javascript code that runs our Three.js examples -->    
  <script type="module">        
  import * as THREE from './js/three.module.js';

			import Stats from './js/stats.module.js';
			import {GUI} from './js/dat.gui.module.js';
			import { TrackballControls } from './js/TrackballControls.module.js';
			import { PCDLoader } from './js/PCDLoader.js';

			var container, stats;
			var camera, controls, scene, renderer;

			init();
			animate();
			function init() {

				scene = new THREE.Scene();
				scene.background = new THREE.Color( 0x000000 );

				camera = new THREE.PerspectiveCamera( 15, window.innerWidth / window.innerHeight, 0.01, 40 );
				camera.position.x = 0.4;
				camera.position.z = - 2;
				camera.up.set( 0, 0, 1 );
				


				scene.add( camera );

				renderer = new THREE.WebGLRenderer( { antialias: true } );
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				document.body.appendChild( renderer.domElement );

				var loader = new PCDLoader();
				loader.load( './storage/Zaghetto.pcd', function ( points ) {
					
					scene.add( points );
					var center = points.geometry.boundingSphere.center;
					controls.target.set( center.x, center.y, center.z );

					controls.update();


				} );

				container = document.createElement( 'div' );
				document.body.appendChild( container );
				container.appendChild( renderer.domElement );

				controls = new TrackballControls( camera, renderer.domElement );

				controls.rotateSpeed = 2.0;
				controls.zoomSpeed = 10;
				controls.panSpeed = 0.2;

				controls.staticMoving = true;

				controls.minDistance = 0.3;
				controls.maxDistance = 0.3 * 100;

				stats = new Stats();
				container.appendChild( stats.dom );

				window.addEventListener( 'resize', onWindowResize, false );

				window.addEventListener( 'keypress', keyboard );

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				renderer.setSize( window.innerWidth, window.innerHeight );
				controls.handleResize();

			}

			function keyboard( ev ) {

				var points = scene.getObjectByName( 'Zaghetto.pcd' );

				switch ( ev.key || String.fromCharCode( ev.keyCode || ev.charCode ) ) {

					case '+':
						points.material.size *= 1.2;
						points.material.needsUpdate = true;
						break;

					case '-':
						points.material.size /= 1.2;
						points.material.needsUpdate = true;
						break;

					case 'c':
						points.material.color.setHex( Math.random() * 0xffffff );
						points.material.needsUpdate = true;
						break;

				}

			}
						  class MinMaxGUIHelper {
			    constructor(obj, minProp, maxProp, minDif) {
			      this.obj = obj;
			      this.minProp = minProp;
			      this.maxProp = maxProp;
			      this.minDif = minDif;
			    }
			    get min() {
			      return this.obj[this.minProp];
			    }
			    set min(v) {
			      this.obj[this.minProp] = v;
			      this.obj[this.maxProp] = Math.max(this.obj[this.maxProp], v + this.minDif);
			    }
			    get max() {
			      return this.obj[this.maxProp];
			    }
			    set max(v) {
			      this.obj[this.maxProp] = v;
			      this.min = this.min;  // this will call the min setter
			    }
			  }
		  function updateCamera() {
			    camera.updateProjectionMatrix();
			  }
		var gui = new GUI();
		gui.add(camera, 'fov', 1, 180).onChange(updateCamera);
		  var minMaxGUIHelper = new MinMaxGUIHelper(camera, 'near', 'far', 0.1);
		  gui.add(minMaxGUIHelper, 'min', 0.1, 50, 0.1).name('near').onChange(updateCamera);
		  gui.add(minMaxGUIHelper, 'max', 0.1, 50, 0.1).name('far').onChange(updateCamera);

			function animate() {

				requestAnimationFrame( animate );
				controls.update();
				renderer.render( scene, camera );
				stats.update();

			}
  </script> 
  </body>
</html>