<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
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
		
	</style>
	<script>
	function join(flag) {

		let ans;; 
		if(flag ==1){
			ans = confirm("Your contact details will be shared with other members.");
		}
		else ans = confirm("This Meetup is full, put youself on the waitlist.");
		
		if(ans){
			joinForm.submit();
		}
		else return false;
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
				<img src="${vo.firstimage}">	
			</div>
			<h1>${vo.title}</h1>
			<h3><i class="bi bi-calendar3"></i> ${vo.meetingDate} ${vo.meetingTime}</h3>
			<h3 style="font-family: 'Gowun Batang', serif; color:#403f3f; font-weight:500">${fn:replace(vo.description,newLine,'<br/>')}</h3>
			
		</div> 
		<div class="eventMap" style="display:flex; flex-direction:column; justify-content:space-between">
			<div>
				<div id="map"></div>
				<h5>${vo.addr}</h5>	
			</div>
			<c:if test="${vo.curNumber < vo.memNumber and flag == '0' }"><div style="text-align:right"><button type="button" class="btn btn-success btn-lg" onclick="join(1)" >JOIN MEETUP</button></div></c:if>
			<c:if test="${vo.curNumber >= vo.memNumber and flag == '0' }"><div style="text-align:right"><button type="button" class="btn btn-success btn-lg" onclick="join(2)" >JOIN WAITLIST</button></div></c:if>
			<c:if test="${flag == '1' }"><div style="text-align:right"><button type="button" class="btn btn-success btn-lg" disabled >You're Waitlisted</button></div></c:if>			
			<c:if test="${flag == '2' }"><div style="text-align:right"><button type="button" class="btn btn-success btn-lg" disabled >Once You've canceled the meetup, you can't join again.</button></div></c:if>			
			<form name="joinForm" method="post">
				<input type="hidden" name="idx" value="${vo.idx}">
				<input type="hidden" name="mid" value="${sMid}">
			</form>
		</div>
	</div>
	<div class="who">
		
	</div>
	<script>
	var mapContainer = document.getElementById('map'),	  
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.mapy},${vo.mapx}), 
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