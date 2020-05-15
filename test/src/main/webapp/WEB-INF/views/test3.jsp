
<%@page import="com.amazonaws.services.s3.model.S3ObjectInputStream"%>
<%@page import="com.amazonaws.services.s3.model.S3Object"%>
<%@page import="com.amazonaws.auth.profile.ProfileCredentialsProvider"%>
<%@page import="com.amazonaws.services.s3.AmazonS3ClientBuilder"%>
<%@page import="com.amazonaws.services.s3.AmazonS3"%>
<%@page import="com.google.cloud.storage.BlobId"%>
<%@page import="com.google.cloud.storage.Blob"%>
<%@page import="com.google.cloud.storage.StorageOptions"%>
<%@page import="com.google.cloud.storage.Storage"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.google.auth.oauth2.GoogleCredentials"%>
<%@page import="com.google.auth.Credentials"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
// String jsonPath = "D:\\GCP\\woven-arcadia-275102-b91e1cf60783.json";

// Credentials credentials;

// credentials = GoogleCredentials.fromStream(new FileInputStream(jsonPath));

// Storage storage = StorageOptions.newBuilder().setCredentials(credentials).setProjectId("woven-arcadia-275102")
// 		.build().getService();
// String bucketName = "haanstorage2";

// Blob blobZ = storage.get(BlobId.of(bucketName, "3d(64).txt"));
// Blob blobALL = storage.get(BlobId.of(bucketName, "ALL2.txt"));

// String Z = new String(blobZ.getContent());
// String ALL = new String(blobALL.getContent());


// Z = Z.replaceAll("NaN", "0");
// Z = Z.replaceAll("\\r?\\n?\\s", ",");
// ALL = ALL.replaceAll("\\r?\\n?\\s", ",");
		String clientRegion = "ap-northeast-2";
		String bucketName = "haanstorage";
		String keyName = "3d(64).txt";
		AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
		.withCredentials(new ProfileCredentialsProvider()).withRegion(clientRegion).build();
		
		System.out.println(s3Client.doesBucketExistV2(bucketName));
		boolean flag = s3Client.doesBucketExistV2(bucketName);
		
		S3Object o = s3Client.getObject(bucketName,keyName);
		S3ObjectInputStream s3is = o.getObjectContent();
		String Z = s3Client.getObjectAsString(bucketName, keyName);
		String ALL = s3Client.getObjectAsString(bucketName, "ALL2.txt");
		
		Z = Z.replaceAll("NaN", "0");
		ALL = ALL.replaceAll("\\r?\\n?\\s", ",");
		ALL = ALL.replaceAll("\\r?\\n?\\s", ",");
		
%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<title>3D Viewer</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<script src="${root }/js/three.js"></script>
<script src="${root }/js/TrackballControls.js"></script>
<script src="${root }/js/dat.gui.js"></script>
    <link rel="stylesheet" href="${root}/DermaMirror_files/mobile_style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	var width = 1920; // 가로
	var height = 1080; // 세로
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
 				var center = line.geometry.boundingSphere.center;
 				trackballControls.target.set( center.x, center.y, center.z );
				trackballControls.update();
			return trackballControls;
		}
		// container 개념  무언갈 담을수 있는 공간
		var scene = new THREE.Scene();
		// 신 에서 보여주는 것 (시야 화면에 표시되는 범위, 종횡비 , 근거리  , 원거리/ 카메라에서 멀거나 가까운 값보다 가까운 거리에 있는 물체는 렌더링 안됨)
		var camera = new THREE.PerspectiveCamera(22, window.innerWidth / window.innerHeight,0.1, 3500); 
// 		camera.position.x = 10;
 		camera.position.z = 500;
		camera.position.y = 10;
		camera.up.set( 0, 1, 0);
		//GPU 를 이용 
		var renderer = new THREE.WebGLRenderer(); 
		//랜더링 
		renderer.setClearColor(new THREE.Color(0x000000)); // 랜더러 색설정 
		renderer.setPixelRatio( window.devicePixelRatio ); // 
		renderer.setSize(window.innerWidth, window.innerHeight); // 화면을 꽉채움
		renderer.shadowMap.Enabled = true; // 그림자 허
		//화면에 반응하는 3D뷰어
		function onResize(){
			camera.aspect=window.innerWidth/window.innerHeight;
			camera.updateProjectionMatrix();
			renderer.setSize(window.innerWidth,window.innerHeight);
		}	
		var geometry = new THREE.BufferGeometry();
		var positions = [];
		var colors = [];
		var text2 = [<%=Z%>];
		var all = [<%=ALL%>];
		var color = new THREE.Color();
		var text2length = text2.length;
		var xx = new Array();
		var yy = new Array();
		for(var i=1919; i>=0;i--){
			xx.push(i/10);
		}
		for(var i=1019;i>=0;i--){
			yy.push(i/10);
		}
		var xxlength = xx.length;
		var yylength = yy.length;
		var n = 1000, n2 = n / 2; // particles spread in the cube
			// positions
				var e = 0;
				var d = 0;
				var x,y,z;
				var vx,vy,vz;
					for(var i = 0;i<text2length;i++){
						
						if(d==xxlength){
							++e;	
							d=0;
						};
 						x = xx[d] ;
 						y = yy[e];
 						z = text2[i];
					if(z != 0){
						positions.push(x,y,z);
						vx = all[i]/1000;
						vy = all[i+(text2length*2)]/1000;
						vz = all[i+text2length]/1000;

						color.setRGB( vx, vy, vz);
							
						colors.push( color.r, color.g, color.b );
					}
						
						if(e==yylength){
							e=0;
							break;
						}
						d++;
					}
		geometry.setAttribute( 'position', new THREE.Float32BufferAttribute( positions,3) );
		geometry.setAttribute( 'color', new THREE.Float32BufferAttribute( colors, 3 ) );
		geometry.computeBoundingSphere();
		var material = new THREE.LineBasicMaterial( { linewidth:1,vertexColors: true,opacity:1 } );
		var line = new THREE.Line( geometry, material );
		scene.add( line );
		//클래스 역할
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
		var gui = new dat.GUI();
		gui.add(camera, 'fov', 1, 180).onChange(updateCamera);
		  var minMaxGUIHelper = new MinMaxGUIHelper(camera, 'near', 'far', 0.1);
		  gui.add(minMaxGUIHelper, 'min', 0.1, 50, 0.1).name('near').onChange(updateCamera);
		  gui.add(minMaxGUIHelper, 'max', 0.1, 5000, 0.1).name('far').onChange(updateCamera);
		document.getElementById("webgl-output").appendChild(renderer.domElement);
		var trackballControls = initTrackballControls(camera,renderer); //초기화
		var clock = new THREE.Clock();
		renderScene();
		var step = 0;
		function renderScene(){
			trackballControls.update(clock.getDelta());//화면 전환 	
			requestAnimationFrame(renderScene); // 애니메이션
			renderer.render(scene, camera); 
		}
	}
  </script>
</body>
</html>