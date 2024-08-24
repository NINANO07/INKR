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
	
	.board {
		width : calc(100% - 100px);
		margin : 0 30px;
	}
	

	
	.board_head {
		display:flex;
		justify-content : space-between;
	}
	
	.search_b {
		display: flex;
		align-items: center;
		max-width: 1000px;
		height : 50px;
	}
	
	select option {
		letter-spacing: 1.2px;
		font-weight: 400;
		font-size: 20px;
	}
	
	select {
		padding: 10px 20px;
		font-weight: 600;
		font-size: 20px;
		letter-spacing: 0.5px;
		cursor: pointer;
		outline: none;
		border: none;
	}

	.searchInput {
		flex: 13;
		width: 100%;
		min-width : 300px;
		height: 100%;
		outline: none;
		border: none;
		font-size: 25px;
		background-color: #EDF3FF;
	}
	
	.searchBtn {
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
	
	.ask {
		text-align: left;
		height : 50px;
		margin-bottom:40px;
	}
	.ask Button {

		width:130px;
		font-size: 25px;
		font-weight : 600;
		outline: none;
		border: none;
		color: #f5c000;
		cursor: pointer;
		height: 100%;
		padding: 0 25px;
		border-radius:11px;
		box-shadow : 2px 2px 2px #f5c000;
		background-color: #1C1C1C;
		
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
		min-height :70px;
		background-color : #F2F2F2;
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
	
	
	.qna_txt h4 {
		font-size :22px;
		font-family: "Montserrat", sans-serif;
		margin-bottom:0;
	
	}

	
	.modal-body {
		overflow-y: auto;
		height : 600px;
	}
	
	textarea {
		resize:none;
		box-sizing: border-box;
		border : 2px solid #62BED2;
	}
	
	#askForm, #askEditForm {
		display:flex;
		flex-direction : column;
		gap :40px;
	}

	
	.photo{
		display:flex;
		gap :40px;
		
	}
	
	.photo_img {
		border: 1px solid #D3D3D3;
	    overflow:hidden;
	    flex:1;
	    
	}
	
	.photo_img img{
		width : 100%;
		height:auto;
		
	}
	
	#file, #file1 {
		display:none;
	}
	.labelwrapper{
		flex:1;
	}
	
	.photolabel {
		
		cursor :pointer;
		border:2px solid #f5c000;
		font-size: 18px;
		padding :0 20px;
		color : #1C1C1C;
		height : 35px;
		width : 140px;
		border-radius : 8px;
		&:hover {
			background-color: #f5c000;
  		}
	}
	
	input[type="checkbox"] {
		margin-right :5px;
		width : 18px;
		height : 18px;
		accent-color :#FFCCCB;
	}
	
	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}

	.pointlabel {
		font-size: 18px;
		transform: translateY(-10%);
	}
	
	.pageLine {
		display : flex;
		gap: 30px;
		
	}
	
	.pageLine input[type="number"]{
		border : 0.25rem solid #c5e7ba;
		font-size :18px;
		width : 150px;
		height : 40px;
	}
	

	
	.plabel {
		border : none;
		background-color:#c5e7ba;
		font-weight : 600;
		font-size :18px;
		
	}

	
	button:focus{
	    outline:none !important;
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
	
	.ans_cnt {
		width: 30px; 
		display: flex; 
        justify-content: space-evenly; 
	}
	.ans_cnt h3{
		width: 30px; 
        line-height: 30px; 
        border-radius: 50%; 
        text-align: center; 
        background-color: #FF746C; 
        color: white; 
        font-size:20px;
        font-family: "Gaegu", sans-serif;
        font-weight : 600;
        cursor : pointer;
	}
	
	.bi-image {
		color:#a2bffe; 
		font-size:19px; 
		margin-right:9px; 
		transform: translateY(11px);
		cursor : zoom-in;
	}
	
	.popup-container {
        position: relative;
        z-index:9999;
        
    }

    .popup-content {
        display: none;
        position: absolute;
        top: -200%;
        left: 150%;
        width:200px;        
        padding: 3px;
        background-color: #f1f1f1;
        border: 1px solid #ccc;
        border-radius: 5px;     
        z-index:9999;
    }
    .popup-content img{
    	width:100%;
    }
	
	.ad {
		display: none;
	}
	.search_b select {
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		font-size: 18px;
		color : #1c1c1c;
		background-color : #EDF3FF;
		font-family: "Poor Story", system-ui;
		outline: none;
		border: none;
		height: 100%;
	}
	
	.editIcon {
		position: relative;
		font-size: 20px;
		color : #3a9bdc;
		cursor : pointer;
		
	}
	
	.editMenu {
		display: none;
		position: absolute;
		top:30px;
		min-height : 80px;
		right:0;
		background-color: #e9c46a;
		width: 79.43px;
		z-index: 9;
		padding : 2px 10px;
		border-radius : 6px;
		box-shadow : 2px 2px #1c1c1c;
		color : #1c1c1c;
		font-weight : 600;
	}
	
	.editMenu.vi{
		display:block;
	}
	
	

	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="wrapper">
	<c:if test="${sMid == 'admin'}"><jsp:include page="/WEB-INF/views/include/sideMenu.jsp" /></c:if>
	<c:if test="${sMid != 'admin'}"><jsp:include page="/WEB-INF/views/include/left.jsp" /></c:if>
	<div class="memberRight" style="flex-direction: row; <c:if test="${sMid == 'admin'}">width :80%; margin-left:200px; margin-top:50px</c:if>" >
		<div class="board">
			<div class="board_head"  >
				<select name="board_list" id="board_list" onchange="boardChange(${vo.idx})" <c:if test="${sMid == 'admin'}">style="display:none;"</c:if>    >
					<option value="qna" selected>게시판</option>
					<option value="voca">단어장</option>
				</select>
				<form name="searchForm" method="post">
					<div class="search_b">
						<select name="langV" onchange="searchQ(1)">
							<option value="en" ${langV == "en" ? "selected" : "" }>English</option>
							<option value="ko" ${langV == "ko" ? "selected" : "" }>Korean</option>
							<option value="de" ${langV == "de" ? "selected" : "" }>German</option>
						</select>
						<input type="text" class="searchInput" name ="searchStr" id="searchStr">
						<button type="button" class="searchBtn" onclick="searchQ(2)">
							<i class="bi bi-search"></i>
						</button>
					</div>
				</form>
			</div>
			<c:forEach var="mvo" items="${vos}" varStatus="st">
			<div class="qna" >
				<c:if test="${st.index % 2 == 0}">
				<div class="qna_body">
					<div class="qna_info">
						<div class="q_lang">
							<c:if test="${mvo.language =='de'}">German</c:if>  
							<c:if test="${mvo.language =='en'}">English</c:if> 	
							<c:if test="${mvo.language =='ko'}">Korean</c:if>
						</div>
						<div class="q_date"><c:if test="${mvo.date_diff == 0 && mvo.hour_diff == 0}">Just now</c:if> 
						<c:if test="${mvo.date_diff == 0 && mvo.hour_diff == 1}">about ${mvo.hour_diff}hour ago</c:if> 
						<c:if test="${mvo.date_diff == 0 && mvo.hour_diff > 1}">about ${mvo.hour_diff}hours ago</c:if> 
						<c:if test="${mvo.date_diff != 0}">${mvo.qdate.substring(0,10)}</c:if></div>
					</div>
					<div class="qna_txt"><h4 class="content_txt">${fn:replace(mvo.content,newLine,'<br/>')}</h4></div>
					<div class="pageLine" style="display:flex; flex-direction: row-reverse; margin-top:10px;">    	
				    	<div class="input-group line" style= "height:15px;">
						  <span class="input-group-addon plabel" style= "font-size:13px; ">L</span>
						  <input type="text" name="line" style= "width:40px; text-align:center; margin:0; padding:0; font-size:13px; border : 0.25rem solid #c5e7ba;" readonly value="${mvo.line}"/>
						</div>
						<div class="input-group page" style= "height:15px; ">
						  <span class="input-group-addon plabel" style= "font-size:13px;"  >P</span>
						  <input type="text" name="page" style= "width:40px; text-align:center;  font-size:13px; border : 0.25rem solid #c5e7ba;" readonly value="${mvo.page}" />
						</div>
				    </div>
					<div class="reply_group">
						<div class="ans_cnt" onclick="location.href='${ctp}/bookclub/bookclubAnswer/${mvo.clubIdx}/${mvo.idx}';"><h3>${mvo.replyCnt}</h3></div>
						
						<div class="reply" >
							<c:if test="${!empty mvo.imgFile}"><i class="bi bi-image popup-container"><span class="popup-content" ><img src="${ctp}/qna/${mvo.imgFile}"/></span></i></c:if>
							<i class="bi bi-reply" onclick="location.href='${ctp}/bookclub/bookclubAnswer/${mvo.clubIdx}/${mvo.idx}';"></i>
							
						</div>					
					</div>
				</div>
				<div class="profile">
					<div class="profile_pic"><img src="${ctp}/member/${mvo.photo}" /></div>
					<div class="profile_info">
						<h5>${mvo.mid}</h5>
						<h5 style="color :<c:if test="${mvo.levelB == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
							<c:if test="${mvo.levelB == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
							<c:if test="${mvo.levelB == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
							<c:if test="${mvo.levelB == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
							<i class="bi bi-distribute-horizontal"></i></h5>
					</div>
					<div class="editIcon"><i class="bi bi-three-dots"></i>
						<div class="editMenu">
							<c:if test="${mvo.mid != sMid && mvo.mid != 'admin' && sMid !='admin' }">
							<div onclick="report('${mvo.idx}', 'bookclubQ','${mvo.mid}')" data-toggle="modal" data-target="#reportModal">Report</div>
							<div onclick="block('${mvo.mid}','${sMid}')">Block</div>
							</c:if>	
							<c:if test="${mvo.mid == sMid }">
							<div data-toggle="modal" data-target="#myModalEdit" onclick="edit(${mvo.idx}, '${mvo.page}', '${mvo.line}', '${mvo.imgFile}', '${mvo.language}', this)">Edit</div>
							</c:if>
							<c:if test="${mvo.mid == sMid || vo.host == sMid && mvo.mid != 'admin' ||sMid == 'admin'}">
							<div onclick="deleteQ(${mvo.idx})">Delete</div>
							</c:if>
						</div>
					</div>
				</div>
				</c:if>
				<c:if test="${st.index % 2 != 0}">
				
				<div class="profile">
					<div class="profile_pic"><img src="${ctp}/member/${mvo.photo}" /></div>
					<div class="profile_info">
						<h5>${mvo.mid}</h5>
						<h5 style="color :<c:if test="${mvo.levelB == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
							<c:if test="${mvo.levelB == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
							<c:if test="${mvo.levelB == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
							<c:if test="${mvo.levelB == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
							<i class="bi bi-distribute-horizontal"></i></h5>
					</div>
					<div class="editIcon"><i class="bi bi-three-dots"></i>
						<div class="editMenu">
							<c:if test="${mvo.mid != sMid && mvo.mid != 'admin' && sMid !='admin' }">
							<div onclick="report('${mvo.idx}', 'bookclubQ','${mvo.mid}')" data-toggle="modal" data-target="#reportModal">Report</div>
							<div onclick="block('${mvo.mid}','${sMid}')">Block</div>
							</c:if>	
							<c:if test="${mvo.mid == sMid }">
							<div data-toggle="modal" data-target="#myModalEdit" onclick="edit(${mvo.idx}, '${mvo.page}', '${mvo.line}', '${mvo.imgFile}', '${mvo.language}', this)">Edit</div>
							</c:if>
							<c:if test="${mvo.mid == sMid || vo.host == sMid && mvo.mid != 'admin' ||sMid == 'admin'}">
							<div onclick="deleteQ(${mvo.idx})">Delete</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="qna_body">
					<div class="qna_info">
						<div class="q_lang">
							<c:if test="${mvo.language =='en'}">English</c:if> 	
							<c:if test="${mvo.language =='de'}">German</c:if>  
							<c:if test="${mvo.language =='ko'}">Korean</c:if>
						</div>
						<div class="q_date"><c:if test="${mvo.date_diff == 0 && mvo.hour_diff == 0}">Just</c:if> 
						<c:if test="${mvo.date_diff == 0 && mvo.hour_diff == 1}">about ${mvo.hour_diff}hour ago</c:if> 
						<c:if test="${mvo.date_diff == 0 && mvo.hour_diff > 1}">about ${mvo.hour_diff}hours ago</c:if> 
						<c:if test="${mvo.date_diff != 0}">${mvo.qdate.substring(0,10)}</c:if></div>
					</div>
					<div class="qna_txt"><h4>${mvo.content}</h4></div>
					<div class="pageLine" style="display:flex; flex-direction: row-reverse; margin-top:10px;">    	
				    	<div class="input-group line" style= "height:15px;">
						  <span class="input-group-addon plabel" style= "font-size:13px; ">L</span>
						  <input type="text" name="line" style= "width:40px; text-align:center; margin:0; padding:0; font-size:13px; border : 0.25rem solid #c5e7ba;" readonly value="${mvo.line}"/>
						</div>
						<div class="input-group page" style= "height:15px; ">
						  <span class="input-group-addon plabel" style= "font-size:13px;"  >P</span>
						  <input type="text" name="page" style= "width:40px; text-align:center;  font-size:13px; border : 0.25rem solid #c5e7ba;" readonly value="${mvo.page}" />
						</div>
				    </div>
					<div class="reply_group">
						<div class="ans_cnt" onclick="location.href='${ctp}/bookclub/bookclubAnswer/${mvo.clubIdx}/${mvo.idx}';"><h3>${mvo.replyCnt}</h3></div>
						<div class="reply" >
							<c:if test="${!empty mvo.imgFile}"><i class="bi bi-image popup-container" ><span class="popup-content" ><img src="${ctp}/qna/${mvo.imgFile}"/></span></i></c:if>
							<i class="bi bi-reply" onclick="location.href='${ctp}/bookclub/bookclubAnswer/${mvo.clubIdx}/${mvo.idx}';"></i>
							
						</div>					
					</div>
				</div>
				</c:if>
				
			</div>
			</c:forEach>
		
		</div>
		
		<div class="book_info">
			<c:if test="${sMid != 'admin' }"><div class="ask"><button type="button" onclick="amount('${sMid}')" >ASK</button></div></c:if>
			<c:if test="${sMid != 'admin' }"><jsp:include page="/WEB-INF/views/include/bookclubinfo.jsp" /></c:if>
		</div>
		
	</div>
</div>
<!-- modal -->
<div class="modal fade" id="myModal"  >
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content"  >
     
       <!-- Modal Header -->
       <div class="modal-header" style="height:50px">
         <h5 class="modal-title" style="display:inline-block; font-size:18px;">Ask about the content related to Korean in the book.</h5>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body" >
       	<div class="askWrapper">
       		<form name="askForm" id="askForm" method="post" enctype="multipart/form-data" action="${ctp}/bookclub/bookclubQnA">
       			<div>
				    <select style="width:auto" name="language">
				    	<option value="en">English</option>
				    	<option value="de">German</option>
				    	<option value="ko">Korean</option>
				    </select>
				</div>
			    <textarea rows="6" cols="50" name="content" id="content"></textarea>
			    <div class="pageLine">
			    	<div class="input-group page">
					  <span class="input-group-addon plabel">PAGE</span>
					  <input type="number" name="page" min=1 />
					</div>
			    	<div class="input-group line">
					  <span class="input-group-addon plabel">LINE</span>
					  <input type="number" name="line" min=1/>
					</div>
			    </div>
			    <div class="photo" style="display:flex">
			        <div class="photo_img"><img id="photoDemo" src="${ctp}/images/imgsample.png" /></div>
			        <div class="labelwrapper">
			       		<label for="file" class="photolabel"><i class="bi bi-camera"></i>&nbsp;&nbsp;&nbsp;<spring:message code='join.upload'/></label>
			        </div>
			        <input type="file" name="file" id="file" onchange="imgCheck(this)"  accept=".gif, .jpg, .png, .jpeg"/>
			    </div>
			    <div class="pointwrapper">
			    	<input type="checkbox" name="top" id="point" onclick="toTop()"/>
			    	<label for="point" class="pointlabel">Display your question at the top of the page. <span style="font-size:14px; color:#6F9FD8">&nbsp;(100 Points)</span></label>
			    </div>
			    <input type="hidden" name="clubIdx" value="${vo.idx}">
			    <input type="hidden" name="mid" value="${sMid}">
       		</form>
       	
       	</div>
       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:65px; border : none">
         <button type="button" value="닫기" class="btn btn-warning" onclick="ask()">ASK</button>
       </div>
     </div>
   </div>
</div>

<div class="modal fade" id="myModalEdit"  >
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content"  >
     
       <!-- Modal Header -->
       <div class="modal-header" style="height:50px">
         <h5 class="modal-title" style="display:inline-block; font-size:18px;">Edit</h5>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body" >
       	<div class="askWrapper">
       		<form name="askEditForm" id="askEditForm" enctype="multipart/form-data" >
       			<div>
				    <select style="width:auto" id="language1" disabled>
				    	<option value="en">English</option>
				    	<option value="de">German</option>
				    	<option value="ko">Korean</option>
				    </select>
				</div>
			    <textarea rows="6" cols="50" name="content" id="content1"></textarea>
			    <div class="pageLine">
			    	<div class="input-group page">
					  <span class="input-group-addon plabel">PAGE</span>
					  <input type="number" name="page" id="page1" min=1 />
					</div>
			    	<div class="input-group line">
					  <span class="input-group-addon plabel">LINE</span>
					  <input type="number" name="line" id="line1" min=1/>
					</div>
			    </div>
			    <div class="photo" style="display:flex">
			        <div class="photo_img"><img id="photoDemo1" src="${ctp}/images/imgsample.png" /></div>
			        <div class="labelwrapper">
			       		<label for="file1" class="photolabel"><i class="bi bi-camera"></i>&nbsp;&nbsp;&nbsp;<spring:message code='join.upload'/></label>
			        </div>
			        <input type="file" name="file" id="file1" onchange="imgCheckEdit(this)"  accept=".gif, .jpg, .png, .jpeg"/>
			    </div>

			    <input type="hidden" name="imgFile" id="imgFile1">
			    <input type="hidden" name="idx" id="idx1">
			    <input type="hidden" name="mid" value="${sMid}">
       		</form>
       	
       	</div>
       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:65px; border : none">
         <button type="button" value="닫기" class="btn btn-warning" onclick="askEdit()">EDIT</button>
       </div>
     </div>
   </div>
</div>

<c:if test="${sMid != 'admin' }"><jsp:include page="/WEB-INF/views/include/footer.jsp" /></c:if>


<script>

function boardChange(idx) {
	let board = $("#board_list").val();
	if(board=="voca") location.href = '${ctp}/bookclub/bookclubVocaByLang?idx='+idx+'&langV=1';
}


function imgCheck(e) {	
	let maxSize = 1024 * 1024 * 2;
	
	if(e.files && e.files[0]) {
		let fileSize = e.files[0].size;
		if(fileSize > maxSize){
			alert("최대용량은 2MByte입니다.");
			return false;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("photoDemo").src = e.target.result;
		}
		reader.readAsDataURL(e.files[0]);
	}
}

function imgCheckEdit(e) {	
	let maxSize = 1024 * 1024 * 2;
	
	if(e.files && e.files[0]) {
		let fileSize = e.files[0].size;
		if(fileSize > maxSize){
			alert("최대용량은 2MByte입니다.");
			return false;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById("photoDemo1").src = e.target.result;
		}
		reader.readAsDataURL(e.files[0]);
	}
}

$('#myModal').on('hidden.bs.modal', function (e) {
    $(this).find('form')[0].reset();
    $(this).find('#photoDemo').attr('src', '${ctp}/images/imgsample.png');
});

function ask() {
	let content = $("#content").val();
	if(content.trim()==""){
		alert("질문을 작성하세요");
		$("#content").focus();
		return false;
	}
	
	askForm.submit();
	//$('#myModal').modal('hide');	
}

$('.popup-container').mouseover(function(e){
	$(this).find('.popup-content').css('display', 'block');
})
$('.popup-container').mouseout(function(e){
	$(this).find('.popup-content').css('display', 'none');
})
/* 
$(".editIcon").on('click', function(e) {
	$(this).find('.editMenu').toggleClass("vi");	
}); */

$(document).ready(function() {
    let openEditMenu = null;

    $(".editIcon").on('click', function(e) {

        let editMenu = $(this).find('.editMenu');

        if (openEditMenu && openEditMenu[0] !== editMenu[0]) {
            openEditMenu.removeClass("vi");
        }

        editMenu.toggleClass("vi");

        openEditMenu = editMenu.hasClass("vi") ? editMenu : null;

    });

    $(document).on('click', function(e) {
        if (openEditMenu) {
            if (!$(e.target).closest('.editIcon').length && !$(e.target).closest('.editMenu').length) {
                openEditMenu.removeClass("vi");
                openEditMenu = null;
            }
        }
    });
});

function edit(idx,page,line,imgFile,language, el) {
	let qnaBody = $(el).closest('.qna').find('.qna_body');

	let content = qnaBody.find('.content_txt').html().replace(/<br>/g, '\n');
	
	
	$("#myModalEdit select").val(language);
	$("#myModalEdit #page1").val(page);
	$("#myModalEdit #line1").val(line);
	$("#myModalEdit #content1").val(content);
	
	if(imgFile != '') $("#myModalEdit #photoDemo1").attr('src', '${ctp}/qna/'+imgFile);
	else $("#myModalEdit #photoDemo1").attr('src', '${ctp}/images/imgsample.png');
	
	$("#myModalEdit #idx1").val(idx);

} 

function askEdit() {
	let content = $("#content1").val();
	if(content.trim()==""){
		alert("내용을 작성해주세요.")
		return false;
	}
	
	
	let formData = new FormData(document.getElementById('askEditForm'));
	formData.append("file", document.getElementById("file1").files[0]);
	
	$.ajax({
		url : "${ctp}/bookclub/bookclubQnAEdit",
		type: "post",
		data : formData,
		processData : false,
		contentType : false,
		success : function(){
			location.reload();
		},
		error : function(){
			alert("전송오류")
		}
	});
}

function deleteQ(idx) {
	let ans = confirm("게시글을 정말 삭제하시겠습니까?");
	if(ans) {
		$.ajax({
			url : "${ctp}/bookclub/bookclubQnADelete",
			type: "post",
			data : {idx:idx},
			success : function(){
				location.reload();
			},
			error : function(){
				alert("전송오류")
			}
		});
	}
	else return false;
}

function block(toMid, mid) {
	let ans = confirm("Are you sure this user will be blocked?");
	if(ans){
		$.ajax({
			url:"${ctp}/member/memberBlock",
			type:"post",
			data : {toMid: toMid, mid: mid},
			success : function(){
				location.reload();
			},
			error : function(){
				alert("전송오류");
			}
		});
		
	}
	else return;
}

function searchQ(flag){
	if(flag == 2){
		let searchStr = $("#searchStr").val();
		if(searchStr.trim()==""){
			alert("검색어를 입력하세요.");
			return false;
		}
	}
	
	searchForm.submit();
	
}

function amount(mid){
	$.ajax({
		url : "${ctp}/member/pointAmount",
		type :"post",
		data : {mid: mid},
		success : function(res){
			let amount = parseInt(res);
			if(amount < 50 ){
				alert("포인트가 부족합니다.");
				
			}
			else $('#myModal').modal('show');
		},
		error: function(){
			alert("전송오류");
		}
	});
	
}

function toTop(){
	if($("#point").is(':checked')) {
		let mid = $("#myModal input[name='mid']").val();

		$.ajax({
			url : "${ctp}/member/pointAmount",
			type :"post",
			data : {mid: mid},
			success : function(res){
				let amount = parseInt(res);
				if(amount < 150 ){
					alert("포인트가 부족합니다.");
					$("#point").prop('checked',false);
					
				}
				else return;
			},
			error: function(){
				alert("전송오류");
			}
			
		});
	}else return;
		
}

</script>
</body>
</html>