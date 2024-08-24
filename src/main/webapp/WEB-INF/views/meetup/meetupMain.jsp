<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<jsp:include page="/WEB-INF/views/include/css.jsp" />
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=158c673636c9a17a27b67c95f2c6be5c&libraries=clusterer"></script>
	<style>

	.memberRight {
		min-width : 700px;
	
	}
	#map {
			width : 33vw;
			height : 23vw;
		}
	
	.m_list{
		display: flex;
	  	flex-wrap: wrap;
	  	gap: 10px;
	
	}
	
	.m_list .cardContainer {
		width: 240px;
		height: 440px;
		border-radius: 8px;
		cursor: pointer;
		flex-direction: column;
		align-items: flex-start;
		overflow : hidden;
	
	}
	.m_list .cardContainer .cardImg {	  
		width: 240px;
		height : 320px;
		display: flex;
		justify-content: center;
	}
	
	.cardContainer .cardImg img {
		width: 100%;
		height: auto;
		object-fit: cover;
	}
	.m_list .cardContainer .cardText {
		line-height : 1.5;
		white-space:normal;
	}
  
	.m_list .cardContainer .cardText h3 {
		font-size: 17px;
		color : #141414;
		font-weight : 900;
		margin-top : 10px;
		font-family: "Lato", sans-serif;
	}
	
	.m_list .cardContainer .cardText h5 {
		font-size: 14px;
		color : #3b3b3b;
		font-weight : 600;
	}
	.createdList {
		display : flex;
		justify-content : space-around;
	}
	
	.carouselW{
		display: flex;
		justify-content : center;
		over-flow : hidden;

	}
	
	#myCarousel {
		width : 70vw;
		height : 35vw;
		border-radius : 10px;
		margin : 50px;
		
	}

	.carousel-inner {
		width : 100%;
		height : 100%;
		border-radius : 10px;
	}
	
	.item {
		width : 100%;
		height: 100%;
		display: flex;
		justify-content: center;
	}
	
	.item h3{
		text-shadow: 3px -3px #1c1c1c;
		font-size : 3vw;
		color : #f5c000;
		font-weight : 700;
		white-space : normal;
		cursor : pointer;
		
	} 
	.item p{
		font-size : 1.3vw;
		font-weight : 500;
	}
	.item img{
		width : 100%;
		height: auto;
		object-fit: cover;
	}
	.nearest {
		width : 34vw;
		border-radius :10px;
		border : 5px solid #1c1c1c;
		background : #1c1c1c;
		overflow : hidden;
		color : #f5c000;
		cursor : pointer;
		white-space : normal;
		
	}
	.nearest .n_img{
		width : 100%;
		height : auto;

	}
	.nearest .n_img img{
		width : 100%;
	}
	.nearest .n_txt {
		margin : 30px;
	}
	.n_txt h3{
		font-size : 1.6vw;
		margin-bottom : 20px;
		font-weight : 600;
	}
	.n_txt h5{
		font-size : 0.8vw;
		margin-bottom : 20px;
		font-weight : 500;
		color : white;
	}
	
	.map{
		width : 34vw;
		height : auto;
		border-radius : 10px;
		overflow : hidden;
		white-space: normal;
	}
	.map h4{
		margin : 30px 0;
		font-weight :600;
		font-size : 1vw;
	}
	
	</style>
	
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/left.jsp" />
	<div class="memberRight">
	<div class="carouselW" >
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		    <li data-target="#myCarousel" data-slide-to="3"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
		    <c:forEach var="vo" items="${vos}" end="3" varStatus="st">
		    <div class= <c:if test="${st.index == 0 }">"item active"</c:if> <c:if test="${st.index != 0 }">"item"</c:if>>
		      <img src="${vo.firstimage}" />
		      <div class="carousel-caption">
		        <h3 onclick="location.href='${ctp}/meetup/meetupTo?idx=${vo.idx}';">${vo.title}</h3>
		        <p>${vo.meetingDate} &nbsp;${vo.meetingTime}</p>
		      </div>
		    </div>
		    </c:forEach>
		  </div>
		
	
		  <!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
		</div>

		<div style="margin: 100px 0;">
			<h2 style="text-align:center;" >FIND THE NEAREST MEETUP</h2>
			<h3 style="text-align:right; margin:30px; font-weight:600; font-size:22px"><a href="${ctp}/meetup/meetupAll">View All</a></h3>
			<div class="createdList" style="display:flex; margin:50px; gap:10px;" >
				<div class="m_list" >
					<div class="nearest">
						<div class="n_img">
							<img id="n_img"/></div>
						<div class="n_txt">
							<h3 id="n_title"></h3>
							<h5 id="n_date"></h5>
							
						</div>
					</div>
				</div>
				<div class="map">
					<div id="map"></div>
					<h4 id="n_addr"></h4>
				</div>
			</div>
		</div>
		
	
		
		
		<div class="meetup" style="margin: 100px 0;" >
			<h2 style="text-align:center;" >EVENT</h2>
			<h3 style="text-align:right; margin:30px; font-weight:600; font-size:22px"><a href="${ctp}/meetup/meetupInput">View All</a></h3>
			<div class="m_list" style="display:flex; justify-content : center">
				<c:forEach var="ev" items="${evos}" varStatus="st" end="5">
				<form name="createForm${st.count}"  method="post" action="${ctp}/meetup/meetupCreate">
				<div class="cardContainer" onclick="create(${st.index})">
					<div class="cardImg">
						<img src="${ev.firstImage}" /></div>
					<div class="cardText">
						<h3>${ev.title}</h3>
						<h5 style="margin-bottom:7px">${ev.eventStartDate}
						-
						<c:if test="${ev.eventStartDate.substring(7) == ev.eventEndDate.substring(7) }">${ev.eventEndDate.substring(0,6)}</c:if>
						<c:if test="${ev.eventStartDate.substring(7) != ev.eventEndDate.substring(7) }">${ev.eventEndDate}</c:if>
						</h5>
						<h5 style="color : #999999;">${ev.addr}</h5>
					</div>
				</div>
				<input type="hidden" name="contentId" value="${ev.contentId}" />
				<input type="hidden" name="title" value="${ev.title}" />
				<input type="hidden" name="firstImage" value="${ev.firstImage}" />
				<input type="hidden" name="addr" value="${ev.addr}" />
				<input type="hidden" name="eventStartDate" value="${ev.eventStartDate}" />
				<input type="hidden" name="eventEndDate" value="${ev.eventEndDate}" />
				<input type="hidden" name="mapX" value="${ev.mapX}" />
				<input type="hidden" name="mapY" value="${ev.mapY}" />
				</form>
				</c:forEach>
			</div>
			
		</div>

		<script>
/*  		 let latitude = 0;  
	     let longitude =0;  */

	        function calculateDistance(lat1, lon1, lat2, lon2) {
	            const R = 6371; 
	            const dLat = (lat2 - lat1) * (Math.PI / 180);
	            const dLon = (lon2 - lon1) * (Math.PI / 180);
	            const a =
	                Math.sin(dLat / 2) * Math.sin(dLat / 2) +
	                Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *
	                Math.sin(dLon / 2) * Math.sin(dLon / 2);
	            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
	            return R * c;
	        }

	        function getLocation() {
	            if (navigator.geolocation) {
	                navigator.geolocation.getCurrentPosition(
	                    (position) => {
	                      
	                       let latitude = position.coords.latitude;
	                       let longitude = position.coords.longitude;
	                       
	                       cMeetUp(latitude, longitude);

	                    },
	                    (error) => {
	                        console.error("Error getting location: ", error);
	                        cMeetUp(37.5796, 126.9770)

	                    }
	                );
	            } else {
	                alert("Geolocation is not supported by this browser.");
	                cMeetUp(37.5796, 126.9770)

	            }
	      
	        }
	        getLocation();
	       


       		function cMeetUp(latitude, longitude){
            var vos = ${jsonVos}; 

            var mapContainer = document.getElementById('map'); 
            var mapOption = { 
                center: new kakao.maps.LatLng(latitude, longitude), 
                level: 6
            }; 
            var map = new kakao.maps.Map(mapContainer, mapOption); 

            let closestMeetup = null;
               let minDistance = Infinity;
            
            vos.forEach(function(meetup) {
            	var eventLat = meetup.mapy;
                   var eventLng = meetup.mapx;

                   var distance = calculateDistance(latitude, longitude, eventLat, eventLng);

                var latlng = new kakao.maps.LatLng(meetup.mapy, meetup.mapx);

                if (distance < minDistance) {
                       minDistance = distance;
                       closestMeetup = meetup;
                   }
                
                var marker = new kakao.maps.Marker({
                    map: map, 
                    position: latlng, 
                    title: meetup.title
                });
                
        
                
                
            });
            if (closestMeetup) {
    
                   var latlng = new kakao.maps.LatLng(closestMeetup.mapy, closestMeetup.mapx);
                   var marker = new kakao.maps.Marker({
                       map: map,
                       position: latlng,
                       title: closestMeetup.title,
                       
                   });
                   $(".nearest").attr('onclick', 'location.href="${ctp}/meetup/meetupTo?idx='+closestMeetup.idx+'";')
                   $("#n_img").attr('src', closestMeetup.firstimage );
                   $("#n_title").text(closestMeetup.title);
                   $("#n_date").text(closestMeetup.meetingDate +" "+ closestMeetup.meetingTime );
                   $("#n_addr").text(closestMeetup.addr + " ("+Math.round(minDistance)+" Km)");
                   
                   map.setCenter(latlng);   
                   
                   var clusterer = new kakao.maps.MarkerClusterer({
   	 	            map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
   	 	            averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
   	 	            minLevel: 10 // 클러스터 할 최소 지도 레벨 
   	 	        });

  	 	            var markers = $(vos).map(function(i, position) {
  	 	                return new kakao.maps.Marker({
  	 	                    position : new kakao.maps.LatLng(position.mapy, position.mapx),
  	 	                    title : position.title
  	 	                });
  	 	            });


  	 	            clusterer.addMarkers(markers);
                       
                   
               } else {
                   console.log("No meetups found.");
               }
       		}

	
       		function create(idx) {
       			$('form')[idx].submit();
       		}
	</script>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>