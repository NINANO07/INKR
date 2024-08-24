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
	<style>
		
		.book, .meet {
			display:flex;
			margin :30px 10px;
			width : 100%;
		}
		
		.chal {
			min-height : 100%;
			
		}
		
		.meet .meettxt{
			flex :1;
			white-space:wrap;
			padding : 0 100px;
			display: flex;
			padding-left :20px;
			flex-direction : column;
			justify-content : center;
		}
		
		.book .booktxt{
			flex :1;
			white-space:wrap;
			margin-left:100px;
			display: flex;
			padding-left :20px;
			flex-direction : column;
			justify-content : center;

			transform: rotate(-2deg);
		
		}
		
		
		.meet .meettxt{

			align-items : center;
			justify-content : center;
		}
		
	
		.book .bookimg {
			display: flex;
			align-items: center;
			flex :1;
			justify-content : center;
			padding : 50px 0;
			z-index:-1;
			margin:50px; 
			
			
			
		}
		.book .bookimg video {
			width : 100%;
			opacity : 0.9;
			transform: rotate(20deg);
		}
		
		.chal {
			position : relative;
			border-radius : 15px;
			padding :0 20px;
		}

		.chal .chalimg {
			width : 100%;
			padding : 100px 0;

		}
		.chal .chalimg video{
			width : 100%;
			height :auto;
			min-width : 250px;
			border-radius : 15px;
			z-index : -1;
			opacity : 0.7;
		}
		.chaltxt {
			position : absolute;
			
			top : 35%;
			left : 34%;
			
		}
		.chaltxt h2{
			font-size : 6vw;
			color : #f5c000;
			text-shadow: 2px -3px #1c1c1c;
		}
		
		.meet .meetimg{
			width : 100%;
			flex : 1;

		}
		.meet .meetimg img{
			width : 75%;
			min-width : 350px;

		}
		
		
		h2{
			font-family: "Kirang Haerang", system-ui;
			text-shadow: 2px -3px #f5c000;
			font-size: 3.6vw;
			cursor : pointer;
			transform : rotate(1deg);
		}
		h4{
			font-family: "Orbit", sans-serif;
			font-size: 22px;
			font-weight : 500;
			letter-spacing: -3px;
			transform : rotate(1deg);
		}

		.meettxt h2{
			transform : rotate(-4deg);
			font-size :4.3vw;
		}
		.meettxt h4{
			padding-left:30px;
		}
		h2:hover{
			transform : scale(1.2);
			
		}
		
		a:hover {
			text-decoration : none;
			
		}
		
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/left.jsp" />
	<div class="memberRight">
		<div class="book">
			
			<div class="booktxt">
				<h2 onclick="location.href='${ctp}/bookclub/bookclubList';">BOOK CLUB </h2>
				<h4>Dive into the world of Korean books with us. Let's make learning Korean fun and share the joy of reading!  </h4>				
			</div>
			<div class="bookimg">
				<video src="${ctp}/video/bookclub.mp4" autoplay muted loop></video>
			</div>
			
		</div>
		<div class="chal">
			<div class="chalimg">
				<video src="${ctp}/video/challenge.mp4" autoplay muted loop></video>
			</div>
			<div class="chaltxt" ><h2 onclick="location.href='${ctp}/challenge/challengeMain';">CHALLENGE</h2></div>
		</div>
		<div class="meet">
			<div class="meettxt">
				<h2 onclick="location.href='${ctp}/meetup/meetupMain';">MEET UP</h2>
				<h4>For those interested in Korea, This is a great way to make new friends.</h4>	
			</div>
			<div class="meetimg"><img src="${ctp}/images/meetup1.png"></div>
		</div>
	</div>
</div>
<br/><br/>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>