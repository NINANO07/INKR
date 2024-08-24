<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<c:set var="lang">
    <spring:message code="lang" />
</c:set>
<style>

.lang-group {
	display: none;
	position: absolute;
	top:50px;
	right:0;
	background-color: #1c1c1c;
	width: 79.43px;
	z-index: 9;
}

.lang {
	height:40px;
	display:flex;
	align-items: center;
  	justify-content:center;
  	
}

.lang-group .lang a{
	color:#f5c000 !important;
}

.lang a:hover {
     color: #f5d400;
     text-decoration: none;
}
.globe:hover .lang-group {display: block;}

.globe:hover > a{
	background-color: #1c1c1c !important;
	color:#f5c000 !important;
}
</style>
<script>
function changeLanguage(lang) {
    let currentUrl = window.location.href;
    let url = new URL(currentUrl);

    url.searchParams.set('lang', lang);

    window.location.href = url.toString();
}
</script>

<nav class="navbar navbar-default navbar-fixed-top" >
  <div class="container" style="width: 100%;">
    <div class="navbar-header" >
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" 
      <c:if test="${empty sMid}">href="${ctp}/"</c:if>
      <c:if test="${!empty sMid && sMid != 'admin'}">href="${ctp}/member/memberMain"</c:if>
      <c:if test="${!empty sMid && sMid == 'admin'}">href="${ctp}/admin/adminMain"</c:if>
      >INKR</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${empty login && empty join && empty sMid}">
	        <li><a href="#about"><spring:message code='nav.about' /></a></li>
	        <li><a href="#k-now"><spring:message code='nav.now' /></a></li>
	        <li><a href="#contact"><spring:message code='nav.contact' /></a></li>
        </c:if>
        <c:if test="${!empty sMid && sMid != 'admin'}">
	        <li><a href="${ctp}/bookclub/bookclubList"><spring:message code='nav.bookclub' /></a></li>
	        <li><a href="${ctp}/challenge/challengeMain"><spring:message code='nav.challenge' /></a></li>
	        <li><a href="${ctp}/meetup/meetupMain"><spring:message code='nav.meetup' /></a></li>
	    </c:if>
        <c:if test="${empty login && empty sMid}">
        <li><a href="${ctp}/member/memberLogin"><spring:message code='nav.login' /></a></li>
        </c:if>
        <c:if test="${!empty sMid}">
        <li><a href="${ctp}/member/memberLogout"><spring:message code='nav.logout' /></a></li>
        </c:if>
        <c:if test="${login}">
        <li><a href="${ctp}/member/memberJoin"><spring:message code='nav.signup' /></a></li>
        </c:if>
        <li class="globe" style="width:79.43px" id="langMenu">
        	<a href="#"><i class="bi bi-globe"></i>${lang}</a>
       		<div class="lang-group" >
       			<c:if test="${lang != 'DE'}"><div class="lang"><a href="#" onclick="changeLanguage('de')">DE</a></div></c:if>
       			<c:if test="${lang != 'EN'}"><div class="lang"><a href="#" onclick="changeLanguage('en')">EN</a></div></c:if>
       			<c:if test="${lang != 'KO'}"><div class="lang"><a href="#" onclick="changeLanguage('ko')">KO</a></div></c:if>
		   	</div>
        </li>
      </ul>
    </div>
  </div>
</nav>


