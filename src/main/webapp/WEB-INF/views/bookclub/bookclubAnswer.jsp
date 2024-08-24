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
	.memberRight {
		margin-bottom:200px;
	}
	
	.board {
		width : calc(100% - 100px);
		margin : 0 30px;
	}
	
	.book_info {
		margin-top:28px;
		width :220px;
		white-space:wrap;
		
	}
		
	.qna {
		display : flex;
		gap:20px;
		margin :30px 20px;
		white-space:wrap;
		
	}
	
	.qna_info {
		display : flex;
		margin:5px 0;
		justify-content: space-between;
	
	}
	
	.profile {
		width :90px;
		display: flex;
		flex-direction : column;
		align-items : center;
		
	}
	
	.profile_pic {
		width :70px;
		height : 70px;
		border:  2px solid #e0bbe4;
		border-radius : 50%;
		overflow : hidden;
	}
	
	.profile_pic img{
		width : 100%;
		height : 100%;
	}
	
	.qna_body {
		width : calc(100% - 100px);
		min-height :150px;
		background-color :#f4f4f4;
		border-radius : 10px;
		position : relative;
		padding : 5px 25px;
	}
	.profile_info {
		display : flex;
		justify-content: center;
		gap :10px;
	}
	
	.profile_info h5, .info_txt h5{
		font-size :14px;
		font-weight : 600;
	}
	
	
	.qna_txt {		
		margin-bottom:15px;
	}
	
	.qna_txt h4 {
		font-size :22px;
		font-family: "Montserrat", sans-serif;
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
	}
	
	.reply_group {
		display : flex;
		justify-content : space-between;
	}
	.reply {
		font-size: 28px;
		color: #FF746C;
		display: flex; 
        transform : translateY(11px);
        cursor: pointer;
	}
		
	.imgFile {
		margin-bottom :15px;
		text-align : center;
	}
	.imgFile img {
		max-width : 300px;
	}
	
	.answer_group {
		position : fixed;
		width : calc(100% - 329px);
		margin-left : 270px;
		bottom:-40px;
		border-radius:10px;
		text-align : center;
		display: flex;
	}
	
	
	.btnGroup {
		display: flex;
		justify-content: space-between;
		position : relative;
		top :-54px;
		padding : 0 20px;
		
	}
	.bg {
		font-size :30px;
		z-index:99;
		cursor : pointer;
	}
	.sendBtn {
		color: #688FE5;
	}
	.cameraBtn {
		color: #FF746C;
	}
	
	#file, #file2 {
		display:none;
	}

	#photo_img, #photo_img2 {
	    display : none;
	    padding: 0 5px;
	    
	}
	
	.photo_img img{
		width:100px;
		height : 100px;
	}
	
	.bi-x-circle-fill {
		position : relative ;
		font-size : 20px;
		right : 16px;
		top : -42px;
		-webkit-text-stroke: 1.6px #fff4f3; 
		color : #FF746C;
		cursor : pointer;
	}
	
	.ad {
		display:none;
	}
	.reply_group {
		display: flex;
		flex-direction : column;
		position :absolute;
		right : 16px;
		top:2px;
		font-size : 20px;
		color : #1c1c1c;
		cursor : pointer;
	}
	
	.reply_group .bi-suit-heart, .bi-suit-heart-fill  {
		color :#ff4e50;
	}
	
	.reply_group .bi-award{
		color :#15b2d3;
	}
	
	.qna_img {
		max-width : 300px;
		margin-bottom : 20px;
	}
	
	.qna_img img{
		width : 100%;
	}
	
	#editShow {
		display : none;
	}

	.editable {
        border: 1px solid #ccc;
        padding: 10px;
        height: 140px;
        min-width: 400px;
        width : calc(100vw - 560px);
        white-space: pre-wrap;
        background-color : white;
        text-align: left;
        border : 1px solid #f5c000; 
        border-radius: 5px; 
        font-size: 22px;
        overflow-y :auto;
        padding-bottom:30px;
        
    }
    
    .highlight {
        color: #007efc;
        font-weight: 800;
        text-align: left;
        text-shadow : 1px 1px 1px #fcb5b1;
    }
    
    div[contenteditable] {
	  	outline: none;
	}
    div[contenteditable]:focus {
	  	outline: 1px solid #f5c000; 
	}
	.qna_body .featured {
		position : absolute;
		top:-10px;
		left:-10px;
		width : 100px;
		height : 100px;
	/* 	background : red; */
		display : flex;
		justify-content : center;
		align-items : center;
		overflow : hidden;
	}
 
	.qna_body .featured::before {
		content: "Featured";
		/* font-family: "bootstrap-icons"; */
		color : white;
		font-weight : 600;
		position: absolute;
		width : 150%;
		height : 25px;
		background-image: linear-gradient( 135deg, #F29F9F 40%, #EE7272 100%);
		transform : rotate(-45deg) translateY(-20px);
		display : flex;
		justify-content : center;
		align-items : center;	
		font-size : 17px;
		box-shadow : 0 3px 3px rgba(0,0,0,0.1);
	}
	
	.qna_body .featured::after {
		content :"";
		position : absolute;
		bottom: 10.5px;
		left : 0;
		width : 10px;
		height : 10px;
		background : #EE7272;
		z-index : -1;
		box-shadow: 79.5px -79.5px #EE7272;
		
	}
	
	.plabel {
		border : none;
		background-color:#c5e7ba;
		font-weight : 600;
		font-size :18px;
		
	}
	
	
 
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="wrapper">
	<c:if test="${sMid == 'admin' }"><jsp:include page="/WEB-INF/views/include/sideMenu.jsp" /></c:if>
	<c:if test="${sMid != 'admin' }"><jsp:include page="/WEB-INF/views/include/left.jsp" /></c:if>
	<div class="memberRight" style="flex-direction: row; <c:if test="${sMid == 'admin'}">width :80%; margin-left:220px; margin-top:60px</c:if>">
		<div class="board">
			<div class="qna" >
				<div class="qna_body" style="background-color :#f0f6f8">
					<div class="qna_info">
						<div class="q_lang">
							<c:if test="${qvo.language =='de'}">German</c:if>  
							<c:if test="${qvo.language =='en'}">English</c:if> 	
							<c:if test="${qvo.language =='ko'}">Korean</c:if>
						</div>
						<div class="q_date"><c:if test="${qvo.date_diff == 0 && qvo.hour_diff == 0}">Just</c:if> 
						<c:if test="${qvo.date_diff == 0 && qvo.hour_diff == 1}">about ${qvo.hour_diff}hour ago</c:if> 
						<c:if test="${qvo.date_diff == 0 && qvo.hour_diff > 1}">about ${qvo.hour_diff}hours ago</c:if> 
						<c:if test="${qvo.date_diff != 0}">${qvo.qdate.substring(0,10)}</c:if></div>
					</div>
					<div class="qna_txt"><h4>${fn:replace(qvo.content,newLine,'<br/>')}</h4></div>
					<c:if test="${!empty qvo.imgFile}"><div class="imgFile"><img src="${ctp}/qna/${qvo.imgFile}"/></div></c:if>
					<div class="pageLine" style="display:flex; gap:10px; flex-direction: row-reverse; margin-bottom:10px;">    	
				    	<div class="input-group line" style= "height:15px;">
						  <span class="input-group-addon plabel" style= "font-size:13px; ">L</span>
						  <input type="text" name="line" style= "width:40px; text-align:center; margin:0; padding:0; font-size:13px; border : 0.25rem solid #c5e7ba;" readonly value="${qvo.line}"/>
						</div>
						<div class="input-group page" style= "height:15px; ">
						  <span class="input-group-addon plabel" style= "font-size:13px;"  >P</span>
						  <input type="text" name="page" style= "width:40px; text-align:center;  font-size:13px; border : 0.25rem solid #c5e7ba;" readonly value="${qvo.page}" />
						</div>
				    </div>
				</div>
				<div class="profile">
					<div class="profile_pic"><img src="${ctp}/member/${qvo.photo}" /></div>
					<div class="profile_info">
						<h5>${qvo.mid}</h5>
						<h5 style="color :<c:if test="${qvo.levelB == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
							<c:if test="${qvo.levelB == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
							<c:if test="${qvo.levelB == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
							<c:if test="${qvo.levelB == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
							<i class="bi bi-distribute-horizontal"></i></h5>
					</div>
				</div>
			</div>
			<c:forEach var="vo" items="${ansvos}" varStatus="st">
			<div class="qna" >
				
				
				<div class="profile">
					<div class="profile_pic"><img src="${ctp}/member/${vo.photo}" /></div>
					<div class="profile_info">
						<h5>${vo.mid}</h5>
						<h5 style="color :<c:if test="${vo.levelB == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
							<c:if test="${vo.levelB == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
							<c:if test="${vo.levelB == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
							<c:if test="${vo.levelB == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
							<i class="bi bi-distribute-horizontal"></i></h5>
					</div>
				</div>
				<div class="qna_body" style="display:flex; ">
					<c:if test="${vo.featured}" ><span class="featured"></span></c:if>
					<div class="qna_left">
						<div class="qna_info">
	
							<div class="q_date"><c:if test="${vo.date_diff == 0 && vo.hour_diff == 0}">Just now</c:if> 
							<c:if test="${vo.date_diff == 0 && vo.hour_diff == 1}">about  ${vo.hour_diff}hour  ago</c:if> 
							<c:if test="${vo.date_diff == 0 && vo.hour_diff > 1}">about ${vo.hour_diff}hours ago</c:if> 
							<c:if test="${vo.date_diff != 0}">${vo.adate.substring(0,10)}</c:if></div>
						</div>
						<div class="qna_txt"><h4>${fn:replace(vo.content,newLine,'<br/>')}</h4></div>
						<c:if test="${vo.imgFile != null}"><div class="qna_img"><img src="${ctp}/qna/${vo.imgFile}"/></div></c:if>
					</div>
					<div class="reply_group">
						<c:if test="${sMid != vo.mid && sMid !='admin'}" >
						<i class="bi bi-chat-dots" onclick="addMemberId('${vo.mid}')"></i>
						<c:if test="${!vo.hit}"><i class="bi bi-suit-heart" onclick="hitLike('${vo.idx}','${vo.clubIdx}','${sMid}', '${vo.mid}')"></i></c:if>
						<c:if test="${vo.hit}"><i class="bi bi-suit-heart-fill" onclick="noLike('${vo.idx}', '${sMid}')"></i></c:if>
						<i class="bi bi-exclamation-diamond" onclick="report('${vo.idx}','bookclubA', '${vo.mid}')" data-toggle="modal" data-target="#reportModal"></i>
						<c:if test="${sMid == qvo.mid && !vo.featured}">
							<i class="bi bi-award" onclick="feature('${vo.qidx}','${vo.idx}','${vo.mid}' )"></i>
						</c:if>
						</c:if>
						<c:if test="${sMid == vo.mid || sMid == 'admin'}">
							<i class="bi bi-trash" onclick="deleteReply('${vo.idx}')"></i>
						</c:if>
					</div>
				</div>
			</div>
			</c:forEach>
			
		</div>
		<div class="book_info">
			<c:if test="${sMid != 'admin' }"><jsp:include page="/WEB-INF/views/include/bookclubinfo.jsp" /></c:if>
		</div>
	</div>
</div>
<div class="answer_group" id="sendShow" <c:if test="${sMid == 'admin' }">style="display:none"</c:if>>
	<form name="answerForm" method="post" id="answerForm" enctype="multipart/form-data">
		<div contenteditable="true" spellcheck="false" class="editable" id="messageBox">
		</div>
		<div class="btnGroup">
			<div class="sendBtn bg" onclick="send('${qvo.mid}')"><i class="bi bi-send"></i></div>
			<label for="file" class="cameraBtn bg"><i class="bi bi-camera"></i></label>	
			<input type="file" name="file" id="file" onchange="imgCheck(this,1)"  accept=".gif, .jpg, .png, .jpeg"/>	
		</div>
		<input type="hidden" name="clubIdx" value="${vo.idx}">
		<input type="hidden" name="qidx" value="${qvo.idx}">
		<input type="hidden" name="mid" value="${sMid}">
		<input type="hidden" name="toMid" id="toMid">
		<input type="hidden" name="content" id="content" >
	</form>	
	<div class="photo_img" id="photo_img">
		<img id="photoDemo" />
		<i class="bi bi-x-circle-fill" onclick="deleteRenderImg(1)"></i>	
	</div>
</div>



<script>
function imgCheck(e, no) {	
	let maxSize = 1024 * 1024 * 2;
	
	if(e.files && e.files[0]) {
		let fileSize = e.files[0].size;
		if(fileSize > maxSize){
			alert("최대용량은 2MByte입니다.");
			return false;
		}
		
		let reader = new FileReader();

		reader.onload = function(e) {
			if(no == 1) document.getElementById("photoDemo").src = e.target.result;
			else document.getElementById("photoDemo2").src = e.target.result;			
		}
		reader.readAsDataURL(e.files[0]);
		
		if(no == 1) $("#photo_img").show();
		else $("#photo_img2").show();
	}
}

function deleteRenderImg(no) {
	if(no ==1){
		$('#photoDemo').attr('src', '');
		$('#photo_img').hide();
		$('#file').val("");
	}
	else{
		$('#photoDemo2').attr('src', '');
		$('#photo_img2').hide();
		$('#file2').val("");
	}
}

function send(toMid) {
	let messageBox = $("#messageBox").html(); 
	$("#content").val(messageBox);
	let file = $("#file").val();
	let content =  $("#content").val();
	let toWhom = toMid;
	let existingSpan = $("#messageBox span.highlight").text();

	if(existingSpan) {
		$("#toMid").val(existingSpan);
		toWhom = existingSpan.replace("@","");
		let modifiedContent = $("#messageBox").text().replace(existingSpan, '').trim();
		if(modifiedContent.trim()=="" && file.trim() ==""){
			alert("답변을 작성해주세요.")
			return false;
		}
	}
	else {
		$("#toMid").val(toMid);
		if(content.trim()=="" && file.trim() ==""){
			alert("답변을 작성해주세요.")
			return false;
		}
	}
	
	
	
	let formData = new FormData(document.getElementById('answerForm'));
	formData.append("file", document.getElementById("file").files[0]);
	
	$.ajax({
		url : "${ctp}/bookclub/bookclubAnswer",
		type: "post",
		data : formData,
		processData : false,
		contentType : false,
		success : function(){
			
			if(socket){
				let msg ="bookclub/reply/"+${vo.idx}+"/"+${qvo.idx}+"/"+toWhom+"/"+'${sMid}';
				socket.send(msg);
			}
			
			location.reload();
			$(document).scrollTop($(document).height());
		},
		error : function(){
			alert("전송오류");
		}
	});
}


function hitLike(aidx, clubIdx, mid, toMid) {
	$.ajax({
		url : "${ctp}/bookclub/bookclubAHitLike",
		type : "post",
		data : {
			aidx : aidx,
			clubIdx : clubIdx,
			mid : mid,
			toMid : toMid
		},
		success : function() {
			if(socket){
				let msg ="bookclub/like/"+clubIdx+"/"+${qvo.idx}+"/"+toMid+"/"+mid;
				socket.send(msg);
			}
			location.reload();
		},
		error : function(){
			alert("전송오류");	
		}
		
		
	});
}

function noLike(aidx, mid) {
	$.ajax({
		url : "${ctp}/bookclub/bookclubANoLike",
		type : "post",
		data : {
			aidx : aidx,
			mid : mid
		},
		success : function() {
			location.reload();
		},
		error : function(){
			alert("전송오류");	
		}
		
		
	});
}

let spanMid;

function addMemberId(memberId) {
    const messageBox = document.getElementById('messageBox');
    
    const existingSpan = messageBox.querySelector('span.highlight');
    if (existingSpan) {
        existingSpan.remove();
    }
    
    const span = document.createElement('span');
    span.className = 'highlight';
    span.textContent = '@'+memberId;
    spanMid = span.textContent;

    const textNode = document.createTextNode(" ");
    
    const range = document.createRange();
    const sel = window.getSelection();

    messageBox.insertBefore(span, messageBox.firstChild);
    messageBox.insertBefore(textNode, messageBox.firstChild.nextSibling);

    range.setStartAfter(textNode);
    range.collapse(true); 
    sel.removeAllRanges();
    sel.addRange(range);
    messageBox.focus();
}

$('#messageBox').on('input', function() {
	let existingSpan = $("#messageBox span.highlight").text();
	if(existingSpan != spanMid){
		$(this).find("span.highlight").remove();
	}
});

function deleteReply(idx) {
	let ans = confirm("답변을 삭제하시겠습니까?");
	if(ans) {
		$.ajax({
			url : "${ctp}/bookclub/bookclubADelete",
			type :"post",
			data : {idx: idx},
			success :function(){
				location.reload();
			},
			error :function(){
				alert("전송오류");
			}
			
		});
	}
	else return;
	
}

function feature(qidx, idx, mid) {
	let ans = confirm("want this answer to be featured?")
	if(ans) {
		$.ajax({
			url : "${ctp}/bookclub/bookclubAFeatured",
			type: "post",
			data : {qidx:qidx, idx:idx},
			success :function(){
				if(socket){
					let msg ="bookclub/featured/"+${vo.idx}+"/"+${qvo.idx}+"/"+mid+"/"+'${sMid}';
					socket.send(msg);
				}
				location.reload();
			},
			error :function(){
				alert("전송오류");
			}
		});
	}
	else return;
	
}
   


</script>

</body>
</html>