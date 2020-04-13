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
  <script type="text/javascript">        
    (function () {            
    	// contains the code for the example            
    	init();        
	})();    
	
	function init(){
		window.addEventListener('resize',onResize,false);

		//트랙볼 초기화 함수
		function initTrackballControls(camera, renderer) {
				var trackballControls = new THREE.TrackballControls(camera, renderer.domElement);
				trackballControls.rotateCamera();
				trackballControls.rotateSpeed = 3.0; 
				trackballControls.zoomSpeed = 10.2;
				trackballControls.panSpeed = 1.8;
				trackballControls.noZoom = false;
				trackballControls.noPan = false;
				trackballControls.staticMoving = true;
				trackballControls.dynamicDampingFactor = 0.3;
				trackballControls.keys = [65, 83, 68];

			return trackballControls;
		}




		var scene = new THREE.Scene();
		var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight,0.1, 4500); 
		var renderer = new THREE.WebGLRenderer(); 
		//랜더링 
		renderer.setClearColor(new THREE.Color(0x000000)); 
		renderer.setPixelRatio( window.devicePixelRatio );
		renderer.setSize(window.innerWidth, window.innerHeight); 
		renderer.shadowMap.Enabled = true;
		//화면에 반응하는 3D뷰어
		function onResize(){
			camera.aspect=window.innerWidth/window.innerHeight;
			camera.updateProjectionMatrix();
			renderer.setSize(window.innerWidth,window.innerHeight);
		}
		//축
// 		var axes = new THREE.AxesHelper(20); 
		
		//면
	/*	var planeGeometry = new THREE.PlaneGeometry(60, 40,1,1); 
		var planeMaterial = new THREE.MeshLambertMaterial({color:   0xffffff});  //basic = 기본색 유지 Lambert = 랜더링될떄 light 고려 
		var plane = new THREE.Mesh(planeGeometry, planeMaterial); 
		plane.rotation.x = -0.5 * Math.PI; 
		plane.position.set(0, 0, 0); 


		//큐브형태
		var cubeGeometry = new THREE.BoxGeometry(4,4,4);
		var cubeMaterial = new THREE.MeshLambertMaterial({ color: 0x00ff00});
		var cube = new THREE.Mesh(cubeGeometry,cubeMaterial);
		cube.position.set(-4,3,0);

		
		//구
		
		var sphereGeometry = new THREE.SphereGeometry(4,20,20);
		var sphereMaterial = new THREE.MeshLambertMaterial({color: 0x7777ff });
		var sphere = new THREE.Mesh(sphereGeometry,sphereMaterial);
		sphere.position.set(20,4,2);
		



		//빛 shadow 그림자
		var spotLight = new THREE.SpotLight(0xffffff);
		spotLight.position.set(-40,60,-15);
		spotLight.castShadow = true; //그림자 설정 true
		spotLight.shadow.mapSize = new THREE.Vector2(1024,1024);
		spotLight.shadow.camera.far=130;
		spotLight.shadow.camera.near-40;*/
		
		var particles = 100;
		
		var geometry = new THREE.BufferGeometry();

		var positions = [];
		var colors = [];
		var text2 = 2;
		var color = new THREE.Color();
		
		var xx = new Array();
		var yy = new Array();
		var y = 10;
		for(var i=0; i<y;i++){
			xx.push(i);
			yy.push(i);
		}

 		
// 		var z=0;
		var n = 1000, n2 = n / 2; // particles spread in the cube
	//	for(var e=0;e<text.length;e++){
// 			x[e];

// 			y[e];
// 			z = text[e];		

	
// 		for ( var i = 0,e = 0,d=0; i < text.length; i++) {
			// positions
				var e = 0;
				var d = 0;
				switch (e) {
				case 0:
					for(var i = 0;i<text2.length;i++){
						
						if(d==xx.length){
							++e;	
							d=0;
						};
						var x = xx[d];
						var y = yy[e];
						var z = text2[i];
						positions.push(x,y,z);
						
// 	alert(x+"--"+y+"--"+z+"--"+xx.length+"--"+yy.length+"--"+d+"--"+e);
						if(i>=text2.length/2){
							
						
							var vx = Math.random()*x;//( x / n ) + 0.5;
							var vy = Math.random()*y;//( y / n ) + 0.5;
							var vz = Math.random()*z;//( z / n ) + 0.5;
					
							color.setRGB( vx, vy, vz );
							
							colors.push( color.r, color.g, color.b );
							
						}else{
						var vx = Math.random()*x;//( x / n ) + 0.5;
						var vy = Math.random()*y//( y / n ) + 0.5;
						var vz = Math.random()*z;//( z / n ) + 0.5;

						color.setRGB( vx, vy, vz );

						colors.push( color.r, color.g, color.b );
						}
						
						
						if(e==yy.length){
							e=0;
							break;
						}
						d++;
					}
					
					break;
				default:
					break;
				}
				
// 				var x = xx[e];//Math.random() * n - n2;
				
				
// 				var y = yy[d];//Math.random() * n - n2;
				
// 				var z = text[i];//Math.random() * n - n2;
			
			
// 			positions.push( x, y, z );
			
			// colors



// 		}
	
		geometry.setAttribute( 'position', new THREE.Float32BufferAttribute( positions,3) );
		geometry.setAttribute( 'color', new THREE.Float32BufferAttribute( colors, 3 ) );

		geometry.computeBoundingSphere();
		
		//

		var material = new THREE.PointsMaterial( { size:0.5, vertexColors: true } );

		points = new THREE.Points( geometry, material );
		scene.add( points );

		//
		
		
		//그림자 허용
// 	/*	sphere.castShadow = true;
// 		cube.castShadow = true;
// 		plane.castShadow = true;
// 		plane.receiveShadow = true;// 받는 그림자
// 		//추가
// 		scene.add(spotLight); //신에 추가
// 	scene.add(axes);
// 		scene.add(plane);
// 		scene.add(cube);
// 		scene.add(sphere);*/
		scene.add(points);
		
		//클래스 역할
		var controls = new function(){
			this.rotationSpeed = 0.1;
			this.bouncingSpeed = 0.2;
			  this.numberOfObjects = scene.children.length;

			  this.removeCube = function(){

			   var allChildren = scene.children;

			   var lastObject = allChildren[allChildren.length-1]

			   if(lastObject instanceof THREE.Mesh){

			     scene.remove(lastObject);

			     this.numberOfObjects = scene.children.length;

			  }

			 };
			 this.addCube = function () {
				 
				var cubeSize = Math.ceil((Math.random()*500));
				var cubeGeometry = new THREE.BoxGeometry(cubeSize,cubeSize,cubeSize);
				var cubeMaterial = new THREE.MeshLambertMaterial({color:0xffffff*Math.random()})
				var cube = new THREE.Mesh(cubeGeometry,cubeMaterial);
				cube.castShadow = true;
				cube.name = "cube-"+scene.children.length;
				cube.position.x = -10+Math.round((Math.random()*planeGeometry.parameters.width))
				cube.position.y = Math.round((Math.random()*5));
				cube.position.z = -20 + Math.round((Math.random()*planeGeometry.parameters.height));
				scene.add(cube);
				this.numberOfObjects = scene.children.length;
			};
			
			
		}
		var gui = new dat.GUI();
// 		gui.add(controls,'rotationSpeed',0,0.5);
// 		gui.add(controls,'bouncingSpeed',0,0.5);
		gui.add(controls,'removeCube');
// 		gui.add(controls,'addCube');
		camera.position.set(100, 100, 10);
		
		document.getElementById("webgl-output").appendChild(renderer.domElement);
		var trackballControls = initTrackballControls(camera,renderer); //초기화
		var clock = new THREE.Clock();
		renderScene();
		var step = 0;
		function renderScene(){
			trackballControls.update(clock.getDelta());//화면 전환 
// 			cube.rotation.x += controls.rotationSpeed;//클래스 이용 속도 변환 라이브러리
// 			cube.rotation.y += controls.rotationSpeed;
// 			cube.rotation.z += controls.rotationSpeed;

			
// 			step += controls.bouncingSpeed;

// 			cube.position.x = 3+(4*Math.cos(step));
// 			cube.position.y=2+(5*Math.abs(Math.sin(step)));

// 			sphere.position.x = 20+10*Math.cos(step);
// 			sphere.position.y = 2+10 * Math.abs(Math.sin(step));

			requestAnimationFrame(renderScene); // 애니메이션

			renderer.render(scene, camera); 
		}
	}
  </script> 
  </body>
</html>