<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

<style>

.modal {
	z-index : 9999;
}

.modal-footer button{
	color : #1C1C1C; 
	font-weight:600; 
	font-size:18px; 
	letter-spacing:5px; 
	background-color:#FFC755;
	border : none;
	
}

.book_info {
	width :220px;
	white-space:wrap;
}



.info_txt h3 {
	font-size :17px;
	color:#222222;
	font-weight : 600;
	text-shadow : 1px 1px 1px #f5c000;
}

.info_txt h4 {
	font-size :13px;
	font-weight : 600;
	font-style: italic;
	color:#636363;
	margin-bottom : 10px;
}

.m_info h4 {
	font-size :16px;
	font-weight : 600;
	color:#1c1c1c;
	margin : 0;
	font-family : "Orbit", sans-serif;
}

.m_info{
	margin-bottom: 50px;
}
.m_info i{
	font-size :20px;
	cursor :pointer;
}

.memberList {
	display : flex;
	padding : 10px 10px;
	margin-bottom : 20px;
	margin-left: 20px;
	margin-right : 20px;
	width : auto;	
	background-color:#EDF3FF;
	border-radius : 10px;
}



.memberL{
	flex:0.8;
}
.memberR{
	flex:1;
}
.memberPhoto .profile_pic{
	width : 150px;
	height : auto;
	border-radius : 10px;
}

.g_cnt {
	width :auto;
	display : flex;
	margin-right : 20px;
	justify-content : space-between;
}
.memberBTn {
	margin-top:5px;
	display : flex;
	gap:68px;
}

.unBtn {text-align : center;}
.unBtn button {
	border-radius : 5px;
	border : none;
	background-color :#f5c000;
	color: #1C1C1C;
	font-size : 16px;
	font-weight : 600;
	padding : 1px 20px;
	font-family : "Orbit", sans-serif;

	&:hover {
		background-color :#1C1C1C;
		color: #f5c000;
	
	}
}

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

.award {
	top :45px;
	right : 20px;
	z-index : 3;

	position : relative;
}

.best {
	margin-top : -40px;
	margin-left:32px;
	height : 150px;
}
.best_pic {
	width :100px;
	height: 100px;
	overflow : hidden;
	border-radius : 10%;
	z-index : 1;
	border :3px solid #1c1c1c;
}

.best_pic img{
	width : 100%;
	height : 100%;
}

.best_txt {
	width :100px;
	display : flex;
	justify-content : space-between;
}


.best_txt h5{
	font-size:15px; 
	font-weight : 600;
}




</style>


<div class="info_img">
	<img src="${vo.cover}" width=150px;/>
</div>
<div class="info_txt">
	<h3>${vo.title}<br/>(${vo.engTitle})</h3>		
	<h4>By ${vo.author} (${vo.engAuthor})</h4>
	<h4>ISBN:  ${vo.isbn}</h4>
</div>

<div class="best">
	<div class="award"><img src="${ctp}/images/best.png" width=60px; alt="best"/></div>
	<div class="best_pic">
		<img src="${ctp}/member/${bvo.photo}"  alt="member_pic"/>
	</div>
	<div class="best_txt">

	<h5>${bvo.mid}</h5>
	<h5 style="color :<c:if test="${bvo.levelB == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
		<c:if test="${bvo.levelB == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
		<c:if test="${bvo.levelB == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
		<c:if test="${bvo.levelB == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
		<i class="bi bi-distribute-horizontal"></i></h5>
	</div>

</div>

<div class="m_info" style="margin-top:90px;">
	<h4>Member : ${vo.participant} &nbsp;&nbsp;&nbsp;<c:if test="${sMid == vo.host}"><i class="bi bi-person-badge" onclick="getMember('${vo.idx}',1,'${vo.host}')" data-toggle="modal" data-target="#memberModal"></i></c:if></h4>
	<h4>Host : ${vo.host} <c:if test="${sMid == vo.host}"></c:if></h4>				
	
</div>
<div class="unBtn">
	<c:if test="${sMid != vo.host}"><button type="button" onclick="un('${vo.idx}')">탈퇴</button></c:if>
	<c:if test="${sMid == vo.host && vo.participant == 1 }"><button type="button" onclick="clubDelete('${vo.idx}')">삭제</button></c:if>
</div>



<div class="modal fade" id="memberModal"  >
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content"  >  
       <!-- Modal Header -->
       <div class="modal-header" style="height:50px">
         <h5 class="modal-title" style="display:inline-block; font-size:18px;">BOOKCLUB MEMBER</h5>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body" style="height:700px" >
       	<div class="modalIcon">
	       	<i class="bi bi-person-badge redIcon" style="color:red" onclick="banMember('${vo.idx}',1,'${vo.host}')"></i>
	       	<i class="bi bi-person-badge blackIcon" style="color:#1c1c1c; display:none" onclick="getMember('${vo.idx}',1,'${vo.host}')"></i>
       	</div>
       	<div id="memberWrapper">
    			
       	</div>
       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:100%; border : none">
         <button type="button" value="닫기" class="btn btn-warning"  data-dismiss="modal" style="margin:20px">Close</button>
       </div>
     </div>
   </div>
</div>

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
       		<form name="reportForm" id="reportForm" >
       			<label for="reportReason" style="margin-bottom:-30px; font-size:20px">Why are you reporting this content?</label>
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
			    <textarea rows="6" cols="50" name="detail" id="detail"></textarea>			    
			    <input type="hidden" name="idx" id="rIdx">
			    <input type="hidden" name="sort" id="sort">
			    <input type="hidden" name="mid" id="rMid" value="${sMid}">
			    <input type="hidden" name="offender" id="offender" >
       		</form>
       	
       	</div>
       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:65px; border : none">
         <button type="button" value="닫기" class="btn btn-warning" onclick="reportSend()">SEND</button>
       </div>
     </div>
   </div>
</div>
<script>
function getMember(idx, pageNum, host){
	$(".redIcon").show();
	$(".blackIcon").hide();
	let line = "";
	$.ajax({
		url : "${ctp}/bookclub/bookclubGetMember",
		type : "post",
		data : {idx : idx},
		success : function(res){
			if(res.length != 0){
				let total = res.length;
			    let pageSize = 3;
			    let totalPages = Math.ceil(total / pageSize);
			    let blockSize = 3;
			    let curBlock = Math.floor((pageNum - 1) / blockSize);
			    let lastBlock = Math.floor((totalPages - 1) / blockSize);
			    
				$.each(res, function (j, item) {
				    /* $('#getMember').append($('<option>', { 
				        value: item.mid,
				        text : item.firstName 
				    })); */

				    if((pageNum-1)*pageSize <= j && j < pageNum*pageSize){
						line += '<div class="memberList">';
						line += '<div class="memberL">';
						line += '<div class="memberPhoto">';
						line += '<div class="profile_pic"><img src="${ctp}/member/'+item.photo+'" /></div>';
						line += '</div>';
						if(item.mid != host ){
							line += '<div class="memberBTn"><input type="button" class="btn btn-success btn-xs" value="HOST"  onclick="promoteHost(\''+item.mid+'\',\''+idx+'\')"/>';
							line += '<input type="button" class="btn btn-danger btn-xs" value="BAN" onclick="ban(\''+item.mid+'\',\''+idx+'\')"/></div>';
						}
						line += '</div>';
						line += '<div class="memberR">';
						line += '<table class="table table-condensed">';
						line += '<tr><th>ID</th><td>'+item.mid+'<td></tr>';
						line += '<tr><th>NAME</th><td>'+item.firstName+'<td></tr>';
						line += '<tr><th>LEVEL</th><td>'+item.levelB+'<td></tr>';
						line += '<tr><th>SINCE</th><td>'+item.joinDate.substring(0,10)+'<td></tr>';
						line += '</table>';
						line += '<div class="g_cnt">';
						line += '<i class="bi bi-award">'+item.featuredCnt+'</i>';
						line += '<i class="bi bi-suit-heart-fill">'+item.likedCnt+'</i>';
						line += '<i class="bi bi-card-text">'+item.postedCnt+'</i>';
						line += '<i class="bi bi-chat-dots">'+item.answeredCnt+'</i>';
						line += '<i class="bi bi-exclamation-diamond">'+item.reportedCnt+'</i>';
						line += '</div></div></div>';
				    };
				});
				
				line += ' <tr><td colspan="5" class="m-0 p-0"></td></tr>';
	            line += '</table></div>';

	            line += '<div class="text-center">';
	            line += '<ul class="pagination pagination-sm justify-content-center" style="margin: 0; padding: 0;">';

	            if (pageNum > 1) {
	            	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\', 1 ,\'' + host + '\'); return false;">❮❮</a></li>';
	            }

	            if (curBlock > 0) {
	                let prevBlockPage = curBlock * blockSize;
	                line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\',' + prevBlockPage + ',\'' + host + '\'); return false;">❮</a></li>';
	            }

	            let startPage = curBlock * blockSize + 1;
	            let endPage = Math.min((curBlock + 1) * blockSize, totalPages);

	            for (let i = startPage; i <= endPage; i++) {
	                if (i === pageNum) {
	                	line += '<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="#">' + i + '</a></li>';
	                } else {
	                	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\',' + i + ',\'' + host + '\'); return false;">' + i + '</a></li>';
	                }
	            }

	            if (curBlock < lastBlock) {
	                let nextBlockPage = (curBlock + 1) * blockSize + 1;
	                line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\',' + nextBlockPage + ',\'' + host + '\'); return false;">❯</a></li>';
	            }

	            if (pageNum < totalPages) {
	            	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\',' + totalPages + ',\'' + host + '\'); return false;">❯❯</a></li>';
	            }

	            line += '</ul></div>';
				
				$("#memberWrapper").html(line);	
			}
			
			
		},
		error : function(){
			alert("전송오류");
		}
	});
	
}
function banMember(idx, pageNum, host){
	$(".redIcon").hide();
	$(".blackIcon").show();
	let line = "";
	$.ajax({
		url : "${ctp}/bookclub/bookclubBanMember",
		type : "post",
		data : {idx : idx},
		success : function(res){
			if(res.length != 0){
				let total = res.length;
			    let pageSize = 3;
			    let totalPages = Math.ceil(total / pageSize);
			    let blockSize = 3;
			    let curBlock = Math.floor((pageNum - 1) / blockSize);
			    let lastBlock = Math.floor((totalPages - 1) / blockSize);
			    
				$.each(res, function (j, item) {
				    /* $('#getMember').append($('<option>', { 
				        value: item.mid,
				        text : item.firstName 
				    })); */

				    if((pageNum-1)*pageSize <= j && j < pageNum*pageSize){
						line += '<div class="memberList">';
						line += '<div class="memberL">';
						line += '<div class="memberPhoto">';
						line += '<div class="profile_pic"><img src="${ctp}/member/'+item.photo+'" /></div>';
						line += '</div>';
						line += '<div class="memberBTn"><input type="button" class="btn btn-danger btn-xs" value="UNBAN" onclick="unban(\''+item.mid+'\',\''+idx+'\')"/></div>';
						line += '</div>';
						line += '<div class="memberR">';
						line += '<table class="table table-condensed">';
						line += '<tr><th>ID</th><td>'+item.mid+'<td></tr>';
						line += '<tr><th>NAME</th><td>'+item.firstName+'<td></tr>';
						line += '<tr><th>LEVEL</th><td>'+item.levelB+'<td></tr>';
						line += '<tr><th>SINCE</th><td>'+item.joinDate.substring(0,10)+'<td></tr>';
						line += '</table>';
						line += '<div class="g_cnt">';
						line += '<i class="bi bi-award">'+item.featuredCnt+'</i>';
						line += '<i class="bi bi-suit-heart-fill">'+item.likedCnt+'</i>';
						line += '<i class="bi bi-card-text">'+item.postedCnt+'</i>';
						line += '<i class="bi bi-chat-dots">'+item.answeredCnt+'</i>';
						line += '<i class="bi bi-exclamation-diamond">'+item.reportedCnt+'</i>';
						line += '</div></div></div>';
				    };
				});
				
				line += ' <tr><td colspan="5" class="m-0 p-0"></td></tr>';
	            line += '</table></div>';

	            line += '<div class="text-center">';
	            line += '<ul class="pagination pagination-sm justify-content-center" style="margin: 0; padding: 0;">';

	            if (pageNum > 1) {
	            	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\', 1 ,\'' + host + '\'); return false;">❮❮</a></li>';
	            }

	            if (curBlock > 0) {
	                let prevBlockPage = curBlock * blockSize;
	                line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\',' + prevBlockPage + ',\'' + host + '\'); return false;">❮</a></li>';
	            }

	            let startPage = curBlock * blockSize + 1;
	            let endPage = Math.min((curBlock + 1) * blockSize, totalPages);

	            for (let i = startPage; i <= endPage; i++) {
	                if (i === pageNum) {
	                	line += '<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="#">' + i + '</a></li>';
	                } else {
	                	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\',' + i + ',\'' + host + '\'); return false;">' + i + '</a></li>';
	                }
	            }

	            if (curBlock < lastBlock) {
	                let nextBlockPage = (curBlock + 1) * blockSize + 1;
	                line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\',' + nextBlockPage + ',\'' + host + '\'); return false;">❯</a></li>';
	            }

	            if (pageNum < totalPages) {
	            	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(\'' + idx + '\',' + totalPages + ',\'' + host + '\'); return false;">❯❯</a></li>';
	            }

	            line += '</ul></div>';
				
				$("#memberWrapper").html(line);	
			}
			
			
		},
		error : function(){
			alert("전송오류");
		}
	});
	
}
function promoteHost(mid, idx){
	$.ajax({
		url : "${ctp}/bookclub/clubHostChange",
		type :"post",
		data : {idx : idx, mid:mid },
		success: function(){
			alert("변경되었습니다.")
			location.reload();
		}, 
		error : function() {
			alert("전송오류");
		}
		
	});
	
}

function ban(mid, idx){
	$.ajax({
		url : "${ctp}/bookclub/clubMemberBan",
		type :"post",
		data : {idx : idx, mid:mid },
		success: function(){
			alert("변경되었습니다.");
			getMember(idx, 1, "${sMid}");
	
			
		}, 
		error : function() {
			alert("전송오류");
		}
		
	});
	
}

function unban(mid, idx){
	$.ajax({
		url : "${ctp}/bookclub/clubMemberUnBan",
		type :"post",
		data : {idx : idx, mid:mid },
		success: function(){
			alert("변경되었습니다.");
			banMember(idx, 1, "${sMid}");
		}, 
		error : function() {
			alert("전송오류");
		}
		
	});
	
}

function un(idx){
	let ans = confirm("정말 탈퇴하시겠습니까?");
	if(ans) location.href = "${ctp}/bookclub/bookclubUn?idx="+idx;
	else return;
	
}

function report(idx, sort, offender) {
	$("#rIdx").val(idx);
	$("#sort").val(sort);
	$("#offender").val(offender);
}

function reportSend(){
	let reason = $("#reportReason").val();
	let detail = $("#detail").val();
	if(reason == 'other' && detail.trim() ==''){
		$("#detail").focus()
		return false;
	}
	
	let idx = $("#rIdx").val();
	let sort = $("#sort").val();
	let mid = $("#rMid").val();
	let offender = $("#offender").val();
	
	query = {
			sort : sort,
			sortIdx : idx,
			offender : offender,
			reporter : mid,
			reason : reason,
			detail : detail
	}
	
	$.ajax({
		url : "${ctp}/bookclub/bookclubReport",
		type : "post",
		data : query,
		success : function(){
			alert("신고가 완료되었습니다.");
			location.reload();
		},
		error : function(){
			alert("전송 실패")
		}
		
	});

}


$('#reportModal').on('hidden.bs.modal', function (e) {
    $(this).find('form')[0].reset();
});

function clubDelete(idx){
	let ans = confirm("are you sure you want to delete this club completely?");

	if(ans){

		location.href = "${ctp}/bookclub/bookclubDelete?idx="+idx;
	}
	else return;	
}

</script>
