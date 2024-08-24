<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<jsp:include page="/WEB-INF/views/include/css.jsp" />
	<style>


.table {
    width: 100%;
    height: 100%;
    background: var(--light);
    backdrop-filter: blur(7px);
    box-shadow: 0 .4rem .8rem #0005;
    border-radius: .8rem;
    overflow: hidden;
    font-family: "Dongle", sans-serif;
    color : #1c1c1c;
    font-size : 2.5rem;
}

.table__header {
    width: 100%;
    height: 10%;
    padding: .8rem 1rem;
	font-size : 3rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.table__header .input-group {
    width: 35%;
    height: 100%;
    background-color: #fff5;
    padding: 0 .8rem;
    border-radius: 2rem;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: .2s;
}

.table__header .input-group:hover {
    width: 45%;
    background-color: #fff8;
    box-shadow: 0 .1rem .4rem #0002;
}

.table__header .input-group img {
    width: 1.2rem;
    height: 1.2rem;
}

.table__header .input-group input {
    width: 100%;
    padding: 0 .5rem 0 .3rem;
    background-color: transparent;
    border: none;
    outline: none;
}

.table__body {
    width: 95%;
    max-height: calc(89% - 1.6rem);
    background-color: #fffb;
    margin: .8rem auto;
    border-radius: .6rem;
    overflow: auto;
    overflow: overlay;
}


.table__body::-webkit-scrollbar{
    width: 0.5rem;
    height: 0.5rem;
}

.table__body::-webkit-scrollbar-thumb{
    border-radius: .5rem;
    background-color: #0004;
    visibility: hidden;
}

.table__body:hover::-webkit-scrollbar-thumb{ 
    visibility: visible;
}


table {
    width: 100%;
}

td img {
    width: 36px;
    height: 36px;
    margin-right: .5rem;
    border-radius: 50%;

    vertical-align: middle;
}

table, th, td {
    border-collapse: collapse;
    padding: 1rem;
    text-align: left;
    
}

thead th {
    position: sticky;
    top: 0;
    left: 0;
    background-color:#edf3ff;
    cursor: pointer;
    text-transform: capitalize;
    font-size : 2rem;
}

tbody tr:nth-child(even) {
    background-color: #0000000b;
}

tbody tr {
    --delay: .1s;
    transition: .5s ease-in-out var(--delay), background-color 0s;
}

tbody tr.hide {
    opacity: 0;
    transform: translateX(100%);
}

tbody tr:hover {
    background-color: #fff6 !important;
}

tbody tr td,
tbody tr td p,
tbody tr td img {
    transition: .2s ease-in-out;
}

tbody tr.hide td,
tbody tr.hide td p {
    padding: 0;
    font: 0 / 0 sans-serif;
    transition: .2s ease-in-out .5s;
}

tbody tr.hide td img {
    width: 0;
    height: 0;
    transition: .2s ease-in-out .5s;
}

.status {
    padding: .4rem 0;
    border-radius: 2rem;
    text-align: center;
}


@media (max-width: 1000px) {
    td:not(:first-of-type) {
        min-width: 12.1rem;
    }
}

thead th span.icon-arrow {
    display: inline-block;
    width: 1.3rem;
    height: 1.3rem;
    border-radius: 50%;
    border: 1.4px solid transparent;
    
    text-align: center;
    font-size: 1rem;
    
    margin-left: .5rem;
    transition: .2s ease-in-out;
}

thead th:hover span.icon-arrow{
    border: 1.4px solid #6c00bd;
}

thead th:hover {
    color: #6c00bd;
}

thead th.active span.icon-arrow{
    background-color: #6c00bd;
    color: #fff;
}

thead th.asc span.icon-arrow{
    transform: rotate(180deg);
}

thead th.active,tbody td.active {
    color: #6c00bd;
}
    
    
	
	</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/sideMenu.jsp" />

<section id="content">
	 <main>
	 <div class="table" id="customers_table">
        <section class="table__header">
            <h1 style="cursor:pointer" onclick='location.href="${ctp}/admin/adminUser"'>회원 리스트</h1>
            <div class="input-group">
                <input type="search" placeholder="Search">
            </div>       
        </section>
        <section class="table__body">
            <table>
                <thead>
                    <tr>
                        <th>No <span class="icon-arrow" onclick='location.href="${ctp}/admin/adminUser?pag=1&pageSize=${pageSize}&sort=idx";'>&UpArrow;</span></th>
                        <th>회원<span class="icon-arrow" onclick='location.href="${ctp}/admin/adminUser?pag=1&pageSize=${pageSize}&sort=id";'>&UpArrow;</span></th>
                        <th>이름<span class="icon-arrow" onclick='location.href="${ctp}/admin/adminUser?pag=1&pageSize=${pageSize}&sort=name";'>&UpArrow;</span></th>
                        <th>지역<span class="icon-arrow" onclick='location.href="${ctp}/admin/adminUser?pag=1&pageSize=${pageSize}&sort=region";'>&UpArrow;</span></th>
                        <th>생년월일<span class="icon-arrow" onclick='location.href="${ctp}/admin/adminUser?pag=1&pageSize=${pageSize}&sort=birthday";'>&UpArrow;</span></th>
                        <th>가입날짜<span class="icon-arrow" onclick='location.href="${ctp}/admin/adminUser?pag=1&pageSize=${pageSize}&sort=date";'>&UpArrow;</span></th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="vo" items="${mvos}" varStatus="st">
                	<c:if test="${vo.isActive}"><c:set var="active" value="탈퇴신청"/></c:if>
			        <c:if test="${!vo.isActive}"><c:set var="active" value="활동중"/></c:if>
                    <tr>
                        <td>${curScrStartNo}</td>
                        <td> <img src="${ctp}/member/${vo.photo}" alt="">
                        <c:if test="${vo.mid != 'admin'}"><a href="${ctp}/admin/adminUserInfo/${vo.mid}">${vo.mid}</a></c:if></td>
                        <td> ${vo.firstName} ${vo.lastName} </td>
                        <td> ${vo.region} </td>
                        <td> ${vo.birthday}</td>
                        <td> ${vo.signUpDate.substring(0,10)} </td>
                        
	   
                    </tr>
                    <c:set var="curScrStartNo" value="${curScrStartNo - 1}"/>
                    </c:forEach>
                 
                </tbody>
            </table>
			<div class="text-center">	
			  <ul class="pagination justify-content-center">
			    <c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminUser?pag=1&pageSize=${pageSize}&sort=${sort}&search=${search}">첫페이지</a></li></c:if>
			  	<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminUser?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}&sort=${sort}&search=${search}">이전블록</a></li></c:if>
			  	<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
				    <c:if test="${i <= totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/admin/adminUser?pag=${i}&pageSize=${pageSize}&sort=${sort}&search=${search}">${i}</a></li></c:if>
				    <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminUser?pag=${i}&pageSize=${pageSize}&sort=${sort}&search=${search}">${i}</a></li></c:if>
			  	</c:forEach>
			  	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminUser?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}&sort=${sort}&search=${search}">다음블록</a></li></c:if>
			  	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/admin/adminUser?pag=${totPage}&pageSize=${pageSize}&sort=${sort}&search=${search}">마지막페이지</a></li></c:if>
			  </ul>
			</div>
        </section>
        </div>
    </main>
</section>
<script>
const search = document.querySelector('.input-group input');

search.addEventListener('keydown', function(event) {
    if (event.key === 'Enter') {
        searchTable();
    }
});

function searchTable() {
    let searchStr = search.value;
    
    if (searchStr.trim() == '') {
        return false;
    }
    
    location.href = "${ctp}/admin/adminUser?&search="+searchStr;
}






</script>
</body>
</html>