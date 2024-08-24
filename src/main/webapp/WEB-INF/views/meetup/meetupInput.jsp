<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<c:set var="lang">
    <spring:message code="lang" />
</c:set>
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
	  	gap: 10px;
	
	}
	
	.c_wrapper .cardContainer {
		width: 240px;
		height: 440px;
		border-radius: 8px;
		cursor: pointer;
		flex-direction: column;
		align-items: flex-start;
		overflow : hidden;
	
	}
	.c_wrapper .cardContainer .cardImg {	  
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
	.c_wrapper .cardContainer .cardText {
		line-height : 1.5;
		white-space:normal;
	}
  
	.c_wrapper .cardContainer .cardText h3 {
		font-size: 17px;
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
	
  	.searchGroup {
		width : 100%;
	}
	
	.search_b {
		display: flex;
		align-items: center;
		max-width : 1400px;
		height : 50px;
	}
	
	.searchInput {

		width: 100%;
		color : #1c1c1c;
		font-weight : 500;
		height: 100%;
		outline: none;
		border: none;
		font-size: 25px;
		background-color: #EDF3FF;
	}
	
	.searchBtn, .filterBtn{
		font-size: 25px;
		flex: 1;
		outline: none;
		border: none;
		font-weight: 500;
		color: #EDF3FF;
		cursor: pointer;
		height: 100%;
		padding: 0 25px;
		background-color: #A7C7E7;
	}
	.filterBtn{
		background-color: #EDF3FF;
		color:#3399ff;
		position : relative;
	}
	
	input[type="date"]::-webkit-calendar-picker-indicator {
	    background: transparent;
	    bottom: 0;
	    color: transparent;
	    cursor: pointer;
	    left: 13px;
	    position: absolute;
	    right: 0;
	    top: 10px;
	    width: 22px;
	    height: 22px;
	}
	
	#dateShow {
		width:0px; 
		height:0px; 
		overflow:hidden;
		border : none;
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
		<form name="searchForm" method="post" 
		

		
		action="${ctp}/meetup/meetupInput?lang=<c:if test="${lang == 'EN'}">en</c:if>
		<c:if test="${lang == 'DE'}">de</c:if>
		<c:if test="${lang == 'KO'}">ko</c:if>">
		<div class="searchGroup">
			<div class="search_b">
				<div class="filterBtn"  style="display : flex; align-items : center; padding-left:13px" >
					<label for="dateShow"><i class="bi bi-calendar2-week"></i></label>
					<input type="date" id="dateShow" name="date"/>
				</div>
				<input type="text" class="searchInput" id="searchStr" name="searchStr">
				<button type="button" class="searchBtn" onclick="search()">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</div>
		<input type="hidden" name="lang" value="${param.lang}">
		</form>
		<div class="c_wrapper">
			<c:forEach var="ev" items="${eventVos}" varStatus="st">
			<form name="createForm${st.count}"  method="post" action="${ctp}/meetup/meetupCreate">
			<div class="cardContainer" onclick="create(${st.count})">
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
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>