<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="root" value="${pageContext.request.contextPath }" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>


	<div id="container"></div>
		<script type="module">

			import * as THREE from '${root}/js/three.module.js';

			import Stats from '${root}/js/stats.module.js';

			

      
			var container, stats;

			var camera, scene, renderer;

			var points;
			
					init();
			animate();

			function init() {
				
		
				
				
				container = document.getElementById( 'container' )

				//

				camera = new THREE.PerspectiveCamera( 27, window.innerWidth / window.innerHeight, 5, 3500 );
				camera.position.z = 2750;

				scene = new THREE.Scene();
				scene.background = new THREE.Color( 0x050505 );
				scene.fog = new THREE.Fog( 0x050505, 2000, 3500 );

				//

				var particles = 5000;

				var geometry = new THREE.BufferGeometry();

				var positions = [];
				var colors = [];

				var color = new THREE.Color();
				
				var n = 1000, n2 = n / 2; // particles spread in the cube

				for ( var i = 0; i < particles; i ++ ) {

					// positions

					var x = Math.random() * n - n2;
					var y = Math.random() * n - n2;
					var z = Math.random() * n - n2;

					positions.push( x, y, z );

					// colors

					var vx = ( x / n ) + 0.5;
					var vy = ( y / n ) + 0.5;
					var vz = ( z / n ) + 0.5;

					color.setRGB( vx, vy, vz );

					colors.push( color.r, color.g, color.b );

				}

				geometry.setAttribute( 'position', new THREE.Float32BufferAttribute( positions, 3 ) );
				geometry.setAttribute( 'color', new THREE.Float32BufferAttribute( colors, 3 ) );

				geometry.computeBoundingSphere();

				//

				var material = new THREE.PointsMaterial( { size: 15, vertexColors: true } );

				points = new THREE.Points( geometry, material );
				scene.add( points );

				//

				renderer = new THREE.WebGLRenderer();
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );

				container.appendChild( renderer.domElement );

				//

				stats = new Stats();
				container.appendChild( stats.dom );

				//

				window.addEventListener( 'resize', onWindowResize, false );

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}

			//

			function animate() {

				requestAnimationFrame( animate );

				render();
				stats.update();

			}

			function render() {
               
				var time = Date.now() * 0.001;

				//points.rotation.x = time * 0.25;
				//points.rotation.y = time * 0.5;

				renderer.render( scene, camera );

			}


		</script>
		
		<script>
function openTextFile() {
    var input = document.createElement("input");
 
    input.type = "file";
    input.accept = "text/plain"; // 확장자가 xxx, yyy 일때, ".xxx, .yyy"
 
    input.onchange = function (event) {
        processFile(event.target.files[0]);
    };
 
    input.click();
}
 
function processFile(file) {
    var reader = new FileReader();
 
    reader.onload = function () {
        output.innerText = reader.result;
    };
 
    reader.readAsText(file, /* optional */ "euc-kr");
	
}
//if($("#output").val != null){
	//DModel();
//}

		</script>

<button onclick="openTextFile()">Open</button>
<div>

</div>
<div>
	<input type="hidden" value="">

</div>
</body>
</html>
