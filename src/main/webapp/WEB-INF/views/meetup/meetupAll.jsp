<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<jsp:include page="/WEB-INF/views/include/css.jsp" />
	<style>

	.c_wrapper{
		display: flex;
	  	flex-wrap: wrap;
	  	gap: 20px;
	  	margin-left: 30px;
	
	}
	
	.c_wrapper .cardContainer {
		width: 400px;
		height: 440px;
		border-radius: 8px;
		cursor: pointer;
		flex-direction: column;
		align-items: flex-start;
		overflow : hidden;
	
	}
	.c_wrapper .cardContainer .cardImg {	  
		width: 400px;
		height : 320px;
		display: flex;
		justify-content: center;
	}
	
	.cardContainer .cardImg img {
		width: 100%;
		height: auto;
		object-fit: cover;
	}
	.c_wrapper .cardContainer .cardText {
		line-height : 1.5;
		white-space:normal;
	}
  
	.c_wrapper .cardContainer .cardText h3 {
		font-size: 20px;
		color : #141414;
		font-weight : 900;
		margin-top : 10px;
		font-family: "Lato", sans-serif;
	}
	
	.c_wrapper .cardContainer .cardText h5 {
		font-size: 14px;
		color : #3b3b3b;
		font-weight : 600;
	}
	


	.filterBtn{
		font-size: 25px;
		color:#3399ff;
		position : relative;
		cursor : pointer;
	}
	


	</style>
	<script>
	

	
	function search(){
		let date = $("#dateShow").val();
		let searchStr = $("#searchStr").val();
		if(date.trim()=='' && searchStr == ''){
			alert("검색어를 입력하세요.")
			return false;
		}
		
		searchForm.submit();
	}
	
	$(function(){
	    $('[type="date"]').prop('min', function(){
	        return new Date().toJSON().split('T')[0];
	    });
	});
	
	function create(idx) {
		$('form')[idx].submit();
	}
	
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/left.jsp" />
	<div class="memberRight">
		<div class="sortIcon" style="display : flex;" >
				<div class="filterBtn"  style="display : flex; align-items : center; padding-left:13px" >
					<a href="${ctp}/meetup/meetupAll"><i class="bi bi-bookmark"></i></a>
				</div>
				<div class="filterBtn"  style="display : flex; align-items : center; padding-left:13px" >
					<a href="${ctp}/meetup/meetupAll?sort=my"><i class="bi bi-bookmark-heart"></i></a>
				</div>
				<div class="filterBtn"  style="display : flex; align-items : center; padding-left:13px" >
					<a href="${ctp}/meetup/meetupAll?sort=not"><i class="bi bi-bookmarks"></i></a>
				</div>
		</div>
		<div class="c_wrapper">
			<c:forEach var="ev" items="${vos}" varStatus="st">
			<div class="cardContainer" onclick="location.href='${ctp}/meetup/meetupTo?idx=${ev.idx}';">
				<div class="cardImg">
					<img src="${ev.firstimage}" /></div>
				<div class="cardText">
					<h3>${ev.title}</h3>
					<h5 style="margin-bottom:7px"><i class="bi bi-calendar-week"></i>&nbsp;${ev.meetingDate}&nbsp;&nbsp;&nbsp;&nbsp;<i class="bi bi-clock"></i>&nbsp;${ev.meetingTime}</h5>
					<h5 style="color : #999999;"><i class="bi bi-geo"></i>&nbsp;${ev.addr}</h5>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>