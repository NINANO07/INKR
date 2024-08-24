<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<jsp:include page="/WEB-INF/views/include/css.jsp" />
	<style>
		.eventWrapper{
			display: flex;
			padding :3px 20px;
			gap :30px;
			white-space: normal;
			min-width : 1069px;
		}
		.eventInfo{
			width : 50%;
		}
		
		.eventImg {
			width: 100%;
			height : auto;
			max-height : 500px;
			display: flex;
			justify-content: center;
		}
		.eventImg img{
			width: 100%;
			height: auto;
			border-radius : 10px;
		}
		#map {
			width : 450px;
			height : 350px;
		}
		
		.eventWrapper h1 {
		font-size: 38px;
		color : #141414;
		font-weight : 900;
		margin :10px 0;
		font-family: "Lato", sans-serif;
		}
		
		.eventWrapper h5 {
			font-size: 14px;
			color : #3b3b3b;
			font-weight : 600;
		}
		
		textarea {
		  resize: none;
		}
				
		#createForm {
			display : flex;
			flex-direction : column;
			gap: 20px;
			margin-top :50px;
		}
		
		#createForm .bi{
			font-size : 22px;
			-webkit-text-stroke: 1px #1c1c1c; 
		}
		
		.disabled {
			cursor: no-drop;
            pointer-events: none;
		}
		
		
	</style>
	<script>
	

    document.addEventListener('DOMContentLoaded', function() {
        let langMenu = document.getElementById('langMenu');
        langMenu.classList.add('disabled');

    });
	
	
	$(function(){
		let today = new Date().toISOString().split('T')[0];
		let min = today <= $("#sd").val() ? $("#sd").val() : today; 
	    $('#date').prop('min', min);
	});
	
	function create(){
		let time = $("#time").val();
		let date = $("#date").val();
		let memNumber = $("#memNumber").val();
		let description = $("#description").val();
		
		if(time.trim() == "" || date.trim()=="" || memNumber <2 || description.trim()==""){
			alert("invalid");
			return false;
		}
		
		createForm.submit();
	}
	
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/left.jsp" />
	
	<div class="memberRight">
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=158c673636c9a17a27b67c95f2c6be5c"></script>
	
	<div class="eventWrapper">
		<div class="eventInfo">
			<div class="eventImg">
				<img src="${vo.firstImage}">	
			</div>
			<div style="display:flex; justify-content:space-between; align-items:flex-end">
			<h1>${vo.title}</h1>
			<h5 style="text-align:right">${vo.eventStartDate} ~ ${vo.eventEndDate}</h5></div>
			<form name="createForm" id="createForm" method="post" action="${ctp}/meetup/meetupCreateInput">
			<div class="input-group" style="display:flex; gap:30px;">
				<input type="hidden" id="sd" value="${vo.eventStartDate}">
				<input type="date" lang="en-US" name="meetingDate" id="date"  max="${vo.eventEndDate}" class="form-control input-lg">
				<input type="time" id="time" name="meetingTime" class="form-control input-lg" >
				<div style="display:flex; gap:10px;"><i class="bi bi-person"></i><input type="number" name="memNumber" id="memNumber" class="form-control input-lg" min="2" style="width:100px;"/></div>
			</div>
			<div>
			<i class="bi bi-blockquote-left"></i><textarea rows="7" class="form-control" id ="description" name="description"></textarea></div>
			<input type="hidden" name="host" value="${sMid}"/>
			<input type="hidden" name="contentid" value="${vo.contentId}"/>
			<input type="hidden" name="title" value="${vo.title}"/>
			<input type="hidden" name="addr" value="${vo.addr}"/>
			<input type="hidden" name="firstimage" value="${vo.firstImage}"/>
			<input type="hidden" name="eventstartdate" value="${vo.eventStartDate}"/>
			<input type="hidden" name="eventenddate" value="${vo.eventEndDate}"/>
			<input type="hidden" name="mapx" value="${vo.mapX}"/>
			<input type="hidden" name="mapy" value="${vo.mapY}"/>
			</form>
		</div> 
		<div class="eventMap" style="display:flex; flex-direction:column; justify-content:space-between">
			<div>
				<div id="map"></div>
				<h5>${vo.addr}</h5>	
			</div>
			<div style="text-align:right"><button type="button" class="btn btn-warning btn-lg" onclick="create()" >Create</button></div>
		</div>
	</div>
	<script>
	var mapContainer = document.getElementById('map'),	  
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.mapY},${vo.mapX}), 
        level: 3
    };
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var marker = new kakao.maps.Marker({ 
		    position: map.getCenter() 
		}); 

		marker.setMap(map);
		
	</script>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>