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
#reportModal {z-index :9999;}
	
#reportModal .modal-body {
	overflow-y: auto;
	height : 450px;
	margin:20px;
	
}

#reportModal textarea {
	resize:none;
	box-sizing: border-box;
	border : 2px solid #62BED2;
	
}

#reportModal select option {
	letter-spacing: 1.2px;
	font-weight: 400;
	font-size: 24px;
	
}

#reportModal select {
	padding: 10px 20px;
	font-weight: 600;
	font-size: 20px;
	letter-spacing: 0.5px;
	cursor: pointer;
	outline: none;
	border:  2px solid #62BED2;

}

#reportForm {
	display:flex;
	flex-direction : column;
	gap :40px;
}

.modal-body .modalIcon{
	text-align : right;
	font-size : 25px;
	margin-top : -15px;
}
.modal-body .modalIcon .bi{
	cursor : pointer;
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
            <h1 style="cursor:pointer">신고 리스트</h1>
       
        </section>
        <section class="table__body">
            <table  id="reportTable">
                <thead>
                    <tr>
                        <th>No </th>
                        <th>신고회원</th>
                        <th>위반회원</th>
                        <th>신고이유</th>
                        <th>비고</th>
                        <th>신고날짜<span class="icon-arrow">&UpArrow;</span></th>
                    	<th>삭제유무<span class="icon-arrow">&UpArrow;</span></th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="vo" items="${rvos}" varStatus="st">

                    <tr>
                        <td <c:if test="${!vo.deleted}">style="cursor:pointer" onclick="report('${vo.sort}', ${vo.sortIdx}, '${vo.reason}', '${vo.detail}', ${vo.idx})" data-toggle="modal" data-target="#reportModal"</c:if>>${st.count}</td>
                        <td> ${vo.reporter}</td>
                        <td> ${vo.offender}</td>
                        <td> ${vo.reason}</td>
                        <td> ${vo.detail}</td>
                        <td> ${vo.reportDate.substring(0,10)} </td>
                        <td> ${vo.deleted}</td>
                    </tr>
      
                    </c:forEach>
                 
                </tbody>
            </table>
			
        </section>
        </div>
    </main>
</section>
<div class="modal fade" id="reportModal"  >
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content"  >
     
       <!-- Modal Header -->
       <div class="modal-header" style="height:50px">
         <h5 class="modal-title" style="display:inline-block; font-size:18px;">Report</h5>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body" >
       	<div class="report">
       		<form name="reportForm" id="reportForm" method="post">
       			<label for="reportReason" style="margin-bottom:-30px; font-size:20px">Reason</label>
       			<div>	
				    <select style="width:auto" id="reportReason">
				    	<option value="dislike">I just don't like it</option>
				    	<option value="spam">It's a spam</option>
				    	<option value="nudity">Nudity or sexual activity</option>
				    	<option value="hate">Hate speech or symbols</option>
				    	<option value="false">False information</option>
				    	<option value="other">Something else</option>
				    </select>
				</div>
				<label for="detail" style="margin-bottom:-40px; font-size:20px">Details</label>
			    <textarea rows="3" cols="50" id="detail"></textarea>	
				<label for="post" style="margin-bottom:-40px; font-size:20px">Reported Post</label>
			    <textarea rows="3" cols="50"  id="post"></textarea>	
			    		    
			    <input type="hidden" name="sortIdx" id="sortIdx">
			    <input type="hidden" name="sort" id="sort">
			    <input type="hidden" name="idx" id="idx">
       		</form>
       	
       	</div>
       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:65px; border : none">
         <button type="button" id="reportBtn" value="닫기" class="btn btn-warning" onclick="reportDelete()">삭제</button>
       </div>
     </div>
   </div>
</div>


<script>

function report(sort, sortIdx, reason, detail, idx ){
	$.ajax({
		url : "${ctp}/admin/adminReportedPost",
		type : "post",
		data : {sort :sort, sortIdx:sortIdx, idx:idx},
		success : function(res){
			$("#reportModal #reportReason").val(reason);
			$("#reportModal #detail").val(detail);
			if(res == 'delete'){ $("#reportModal #post").val
				("이미 삭제된 게시글입니다.");
				$('#reportBtn').prop('disabled', true);	
			}
			else $("#reportModal #post").val(res);
			
			$("#reportModal #idx").val(idx);
			$("#reportModal #sort").val(sort);
			$("#reportModal #sortIdx").val(sortIdx);
			
			
			
		},
		error : function(){
			alert("전송오류");
		}
	
	});
	
}

$('#reportModal').on('hidden.bs.modal', function (e) {
	$("#reportTable").load(window.location.href + " #reportTable");
    $(this).find('form')[0].reset();
});



function reportDelete(){
	reportForm.submit();
	
}

const table_headings = document.querySelectorAll('thead th');
const table_rows = document.querySelectorAll('tbody tr');
table_headings.forEach((head, i) => {
    let sort_asc = true;
    head.onclick = () => {
        table_headings.forEach(head => head.classList.remove('active'));
        head.classList.add('active');

        document.querySelectorAll('td').forEach(td => td.classList.remove('active'));
        table_rows.forEach(row => {
            row.querySelectorAll('td')[i].classList.add('active');
        })

        head.classList.toggle('asc', sort_asc);
        sort_asc = head.classList.contains('asc') ? false : true;

        sortTable(i, sort_asc);
    }
})

    
function sortTable(column, sort_asc) {
    [...table_rows].sort((a, b) => {
        let first_row = a.querySelectorAll('td')[column].textContent.toLowerCase(),
            second_row = b.querySelectorAll('td')[column].textContent.toLowerCase();

        return sort_asc ? (first_row < second_row ? 1 : -1) : (first_row < second_row ? -1 : 1);
    })
        .map(sorted_row => document.querySelector('tbody').appendChild(sorted_row));
}
</script>
</body>
</html>