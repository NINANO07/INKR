<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	
	button:focus{
	    outline:none !important;
	}
	
	.modal {
		z-index : 9999;
	}
	.modal-body {
		height : 700px;
		overflow-y: auto;
	}
	
	.postHead {
		display:flex;
		justify-content : space-between;
		width : 100%;
		height : 50px;
	}
	
	.searchGroup {
		width : 100%;
		margin-right : 30px;
	}
	
	.search_b {
		display: flex;
		align-items: center;
		max-width : 1400px;
		height : 50px;
	}
	
	select option {
		letter-spacing: 1.2px;
		font-weight: 400;
		font-size: 20px;
	}
	


	.searchInput {

		width: 100%;
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
	}
	
	.post {
		text-align: left;
		height : 50px;
		margin-bottom:40px;
	}
	.post Button {

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

	.imageGrid {
		width : 100%;
		margin : 40px auto;
		columns: 5;
		column-gap : 20px;
	}
	.imageGrid .box{
		width : 100%;
		margin-bottom:10px;	
		break-inside : avoid;
		transition : 0.6s ease-out;
		position : relative;
	}
	
	.imageGrid .box:hover{
		transform : translateY(-2px);
	}
	.imageGrid .box img{
		max-width : 100%;
		border-radius : 15px;
		
	}
	.imageGrid .box video {
		max-width : 100%;
		border-radius : 15px;
		
	}
	.content {
		width : 100%;
		height : 100%;
		top:0;
		left:0;
		position : absolute;
		background : rgba(255,255,255, 0.7);
		display : flex;
		flex-direction : column;
		justify-content : space-between;
		align-items:center;
		opacity: 0;
		transition : 0.6s ease-out;
		padding: 4% 20px;
		overflow: overlay;
		
	}
	
	.content::-webkit-scrollbar { 
	    display: none;  /* Safari and Chrome */
	}
	
	.content:hover{
		opacity : 1;
	}
	
	.content .c_icon {
		display : flex;
		width : 100%;
		justify-content : space-between;
		align-items : center;
	}
	.content .c_icon .bi{
		font-size: 25px;
		cursor : pointer;
		-webkit-text-stroke: 1.2px; 
	}
	
	.c_group {
		width : 100%;
	}
	
	.content .c_tags{
		display:flex;
		gap : 5px;
		flex-wrap: wrap;

		
	}
	
	.content .c_tags p{
		font-size: 14px;
		padding: 1px 15px;
		background-color : #1c1c1c;
		border-radius : 20px;
		color : white;
		font-weight: 600;
		margin : 0;

	}
	.content .c_title{
		font-size: 24px;
		color : #1c1c1c;
		font-weight : 700;
		white-space: wrap;

	}
	
	.c_title p {
		line-height : 1;
	
	}
	
	.pro_img {
		width :50px;
		height : 50px;
		border:  2px solid #1c1c1c;
		border-radius : 50%;
		overflow : hidden;
	}
	
	.pro_imgg {
		width :30px;
		height : 30px;
		border:  2px solid #1c1c1c;
		border-radius : 50%;
		overflow : hidden;
	}
	.pro_img img, .pro_imgg img{
		width : 100%;
		height : 100%;
		display : flex;
		justify-content : center;
		align-items : center;
	}

	.popular, .tags{
		width : calc(100% - 60px);
		height : auto;
		display : flex;
		flex-wrap: wrap-reverse;
		gap:10px;
		justify-content : center;
		margin: 0 30px;
	}
	
	#postForm input[type=radio], #postForm input[type=checkbox], .fff input[type=checkbox], .fff input[type=radio] {
      display: none;
    }

    
    #postForm input[type=radio]:checked+label, .fff input[type=radio]:checked+label {
    	background-color: #18221E;
		color: white;
    }
    
    #postForm input[type=checkbox]:checked+label, .fff input[type=checkbox]:checked+label {
    	background-color: #b6cfc1;
		color: white;
    }
    
    #postForm select{
    	width : calc(100% - 60px);
    	margin : 30px;
    	padding: 7px 10px;
		font-weight: 600;
		font-size: 16px;
		letter-spacing: 0.5px;
    }
	
	.popular label, .tags label{
		
		padding : 1px 13px;
		border : 1px solid gray;
		border-radius : 20px;
		cursor : pointer;
		font-weight: 600;
		font-size: 18px;
	}
	.tags label{
		border-color : #b6cfc1;
		
	}
	
	
	.postWrapper h3{
		margin-top : 10px;
		margin-bottom: 20px;
		margin-left : 20px;
		font-weight : 800;
		color : #1c1c1c;
		
	}
	
	#file, #file1 {
		display:none;
	}
	.photo{
		margin-top : 50px;
		margin-left: 30px;
		display:flex;
		gap :40px;
		
	}
	
	.photo_img {
		border: 1px solid #D3D3D3;
	    overflow:hidden;
	    flex:1; 
	}
	
	.photo_img img, .photo_img video{
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
	
	.modal-footer Button{
		font-size: 18px;
		font-weight : 600;
		color : #1c1c1c;
		margin-right : 40px;
	}
	
	#top1+label{
		background-color : #f5c000;
		color : white;
		border : none;
	

	}
	.f_group{
		display : none;
		width : 290px;
		position : absolute;
		top: 120px;
		left: 255px;
		background-color : white;
		border : 2px solid #3076d7;
		padding : 20px;
	}
	.fff {
		display : flex;
		flex-wrap: wrap;	
	}
	
	.fff h3 {
		margin: 20px 0;
		font-size: 19px;
		font-weight : 700;
		color : #3076d7;
	
	}
	
	.vi {
		display : block;
	}
	
	@media (max-width : 1500px){
		.imageGrid {
			columns: 4;
		}
	
	}
	@media (max-width : 1200px){
		.imageGrid {
			columns: 3;
		}
	
	}
	
	@media (max-width : 900px){
		.imageGrid {
			columns: 2;
		}
	
	}
	@media (max-width : 480px){
		.imageGrid {
			columns: 1;
		}
	
	}
	.content a {
	   all: unset;
	}
	
	.content a:hover {
	   all: unset;
	   cursor: pointer;
	}
	
	 #searchStr {
        transition: all 0.5s ease;
    }
	
	</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="wrapper">
	<c:if test="${sMid == 'admin' }"><jsp:include page="/WEB-INF/views/include/sideMenu.jsp" /></c:if>
	<c:if test="${sMid != 'admin' }"><jsp:include page="/WEB-INF/views/include/left.jsp" /></c:if>
	<div class="memberRight" <c:if test="${sMid == 'admin'}">style ="width :80%; margin-left:200px; margin-top:70px"</c:if>>
		<div class="postHead">
			<div class="searchGroup">
				<div class="search_b">
					<button type="button" class="filterBtn"  style="display : flex; align-items : center; padding-left:13px" >
						<c:if test="${sMid != 'admin' }"><div class="pro_imgg" onclick="location.href='${ctp}/challenge/challengeBy/pic/${sMid}';"><img src="${ctp}/member/${sPhoto}" /></div>&nbsp;&nbsp;&nbsp;
						<i class="bi bi-balloon-heart" onclick="location.href='${ctp}/challenge/challengeBy/heart/${sMid}';"></i>&nbsp;&nbsp;</c:if>
						<i class="bi bi-sliders2" onclick="filteropen()"></i>
					</button>
					<input type="text" class="searchInput" id="searchStr">
					<button type="button" class="searchBtn" onclick="search()">
						<i class="bi bi-search"></i>
					</button>
				</div>
			</div>
			<div class="post">
				<c:if test="${sMid != 'admin' }"><button type="button" data-toggle="modal" data-target="#postModal" >POST</button></c:if>
				<c:if test="${sMid == 'admin' }"><button type="button" data-toggle="modal" data-target="#tagModal" >등록</button></c:if>
			</div>
		</div>
		<div class="imageGrid">
			<c:forEach var="cvo" items="${cvos}">
			<div class="box">
				<c:if test="${cvo.ext != 'video' }"><img src="${ctp}/challenge/${cvo.photo}" /></c:if>
				<c:if test="${cvo.ext == 'video' }"><video src="${ctp}/challenge/${cvo.photo}" autoplay muted loop></video></c:if>
				<div class="content">
					<div class="c_icon">
						<div class="pro_img"><a href="${ctp}/challenge/challengeBy/pic/${cvo.mid}"><img src="${ctp}/member/${cvo.memPhoto}" /></a></div>
						<p>
						<c:if test="${cvo.mid == sMid || sMid == 'admin'}"><i class="bi bi-x" style="color :#1c1c1c;" onclick="deletePost('${cvo.idx}', '${cvo.photo}')"></i></c:if>
						<c:if test="${cvo.mid != sMid && sMid != 'admin'}">
							<c:if test="${!cvo.hitHeart}"><i class="bi bi-heart" style="color : red;" onclick="hitLike(${cvo.idx}, '${cvo.mid}')"></i></c:if>
							<c:if test="${cvo.hitHeart}"><i class="bi bi-heart-fill" style="color : red;" onclick="noLike(${cvo.idx})"></i></c:if>
						</c:if>
						</p>
					</div>
					<div class="c_group">
						<div class="c_title"><p><a href="${ctp}/challenge/challengeBy/title/${cvo.title}">#${cvo.title}</a></p></div>
						<div class="c_tags">
						<c:if test="${cvo.tag != null}">
						<c:set var="tags" value="${fn:split(cvo.tag,',')}" />
					    <c:forEach var="tag" items="${tags}" >
					         <p><a href="${ctp}/challenge/challengeBy/tag/${tag}">${tag}</a></p>
					    </c:forEach> 
					    </c:if>
						</div>
					</div>
					
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>
<c:if test="${sMid != 'admin' }"><jsp:include page="/WEB-INF/views/include/footer.jsp" /></c:if>


<div class="f_group" >
	<div class="fff">
		<form name="searchForm" method="post" action="${ctp}/challenge/challengeMain">
		<div style="display:flex; justify-content:space-between;"><h3 style="margin-top:0">Sort by</h3><i onclick="refresh()" style="font-size:22px; margin-top:-10px; cursor:pointer" class="bi bi-arrow-clockwise"></i></div>
		<div class="popular">
			<input type="radio" name="sort" value="popular" id="s_p" ><label for="s_p">popular</label>
			<input type="radio" name="sort" value="new" id="s_n" ><label for="s_n">newest</label>
		</div>
		<h3>Tags</h3>
		<div class="tags">
		   	<input type="checkbox" name="tags" value="food" id="t1"><label for="t1">food</label>
			<input type="checkbox" name="tags" value="nature" id="t2"><label for="t2">nature</label>
			<input type="checkbox" name="tags" value="cafe" id="t3"><label for="t3">cafe</label>
			<input type="checkbox" name="tags" value="k-pop" id="t4"><label for="t4">k-pop</label>
			<input type="checkbox" name="tags" value="culture" id="t5"><label for="t5">culture</label>	
			<input type="checkbox" name="tags" value="trend" id="t6"><label for="t6">trend</label>	
			<input type="checkbox" name="tags" value="visit" id="t7"><label for="t7">visit</label>	
			<input type="checkbox" name="tags" value="vibe" id="t8"><label for="t8">vibe</label>	
			<input type="checkbox" name="tags" value="daily" id="t9"><label for="t9">daily</label>	
			<input type="checkbox" name="tags" value="trip" id="t10"><label for="t10">trip</label>	
		</div>
		<input type="hidden" name="searchStr" id="t_str"/>
		</form>
	</div>
</div>  		


<div class="modal fade" id="postModal"  >
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content"  >
     
       <!-- Modal Header -->
       <div class="modal-header" style="height:50px">
         <h5 class="modal-title" style="display:inline-block; font-size:18px;">have fun</h5>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body" >
       	<div class="postWrapper">
       		<form name="postForm" id="postForm" method="post" enctype="multipart/form-data" action="${ctp}/challenge/challengeMain">
       			<h3> Choose A Challenge</h3>
       			<div class="popular">
       				<c:forEach var="vo" items="${vos}" varStatus="st" end ="4">
       				<input type="radio" name="listIdx" value="${vo.idx}" id="top${st.count}" onclick="challege(1)"><label for="top${st.count}">${vo.title}</label>
					</c:forEach>
       			</div>
       			<div class="other">
				    <select name="listIdx" onchange="challege(2)">
				    	<option disabled selected>Other</option>
				    	<c:forEach var="vo" items="${vos}" varStatus="st" begin ="5">
				    	<option value="${vo.idx}">${vo.title}</option>
				    	</c:forEach>
				    </select>
				</div>
				<h3 style="margin-bottom : 0;">Tags</h3>
				<div class="tags">
					
       				<input type="checkbox" name="tag" value="food" id="tag1"><label for="tag1">food</label>
					<input type="checkbox" name="tag" value="nature" id="tag2"><label for="tag2">nature</label>
					<input type="checkbox" name="tag" value="cafe" id="tag3"><label for="tag3">cafe</label>
					<input type="checkbox" name="tag" value="k-pop" id="tag4"><label for="tag4">k-pop</label>
					<input type="checkbox" name="tag" value="culture" id="tag5"><label for="tag5">culture</label>	
					<input type="checkbox" name="tag" value="trend" id="tag6"><label for="tag6">trend</label>	
					<input type="checkbox" name="tag" value="visit" id="tag7"><label for="tag7">visit</label>	
					<input type="checkbox" name="tag" value="vibe" id="tag8"><label for="tag8">vibe</label>	
					<input type="checkbox" name="tag" value="daily" id="tag9"><label for="tag9">daily</label>	
					<input type="checkbox" name="tag" value="trip" id="tag10"><label for="tag10">trip</label>	
       			</div>
			    <div class="photo" style="display:flex">
			        <div class="photo_img photoDemo" ><img id="photoDemo" src="${ctp}/images/imgsample.png" /></div>
			        <div class="photo_img videoDemo" style="display:none" ><video id="videoDemo" autoplay muted loop ></video></div>
			        <div class="labelwrapper">
			       		<label for="file" class="photolabel"><i class="bi bi-camera"></i>&nbsp;&nbsp;&nbsp;<spring:message code='join.upload'/></label>
			        </div>
			        <input type="file" name="file" id="file" onchange="imgCheck(this)"  accept=".gif, .jpg, .png, .jpeg, .mp4"/>
			    </div>
			    <input type="hidden" name="mid" value="${sMid}">
       		</form>
       	
       	</div>
       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:65px; border : none">
         <button type="button" value="닫기" class="btn btn-warning" onclick="post()">POST</button>
       </div>
     </div>
   </div>
</div>

<div class="modal fade" id="tagModal"  >
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content"  >
     
       <!-- Modal Header -->
       <div class="modal-header" style="height:50px">
         <h5 class="modal-title" style="display:inline-block; font-size:18px;">챌린지 등록</h5>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body" style="height:450px">
      
       		<form name="tagForm" id="tagForm"  >
       			<h4>현재 등록된 챌린지</h4>
       			
       			<div class="other">
				    <select class="form-control">
				    	<c:forEach var="vo" items="${vos}" varStatus="st" >
				    	<option value="${vo.idx}">${vo.title}</option>
				    	</c:forEach>
				    </select>
				</div>
				<br/><br/>
				<hr/>
				<h4>챌린지를 입력하세요</h4>
				<input type="text" id="chTitle" name="title" class="form-control">
				<input type="hidden" name="mid" value="admin">
       		</form>
       	

       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:65px; border : none">
         <button type="button" value="닫기" class="btn btn-warning" onclick="addCh()">등록</button>
       </div>
     </div>
   </div>
</div>
<script>
function imgCheck(e) {	
	let maxSize = 1024 * 1024 * 4;
	
	let fName= e.files[0].name;
	let start = fName.lastIndexOf(".")+1;
	let ext = fName.substring(start);
	if(e.files && e.files[0]) {
		let fileSize = e.files[0].size;
		if(fileSize > maxSize){
			alert("최대용량은 4MByte입니다.");
			return false;
		}
		
		let reader = new FileReader();
		reader.onload = function(e) {
			if(ext == 'mp4'){
					$(".videoDemo").show();
					$(".photoDemo").hide();
					document.getElementById("videoDemo").src = e.target.result;
			}
			else if(ext != 'mp4') {
				$(".videoDemo").hide();
				$(".photoDemo").show();
				document.getElementById("photoDemo").src = e.target.result;
			}
		}
		
		reader.readAsDataURL(e.files[0]);
	}
}

$('#postModal').on('hidden.bs.modal', function (e) {
    $(this).find('form')[0].reset();
    $(this).find('#photoDemo').attr('src', '${ctp}/images/imgsample.png');
    $(".videoDemo").hide();
	$(".photoDemo").show();
});

function challege(i) {
	if(i == 1){
		$('select[name="listIdx"]').find('option')[0].selected=true;		
	}
	else if(i==2){
		$('input:radio[name="listIdx"]:checked').prop("checked" , false);
	}
	
}

function post() {
	let c1 = $('select[name="listIdx"]').val();		
	let c2 = $('input:radio[name="listIdx"]:checked').val();
	
	if(c1 == null && c2 ==  null){
		alert("choose A Challenge");
		return false;
	}
	

	let ext = "";
	let fileSize = 0;
	let maxSize = 1024 * 1024 * 4;
	
	let fileLength = document.getElementById("file").files.length;
	
	if(fileLength < 1) {
		alert("업로드할 파일을 선택하세요");
		return false;
	}
	

	let fName = document.getElementById("file").files[0].name;	
	ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
   	fileSize = document.getElementById("file").files[0].size;
   	if(ext != 'jpg' && ext != 'gif' && ext != 'png' && ext != 'jpeg' && ext != 'mp4') {
   		alert("파일을 확인하세요.");
   		return false;
   	}
	
	if(fileSize > maxSize) {
		alert("업로드 파일의 최대용량은 4MByte입니다.");
		return false;
	}
	
	
	postForm.submit();
}

function filteropen(){
	$(".f_group").toggleClass("vi");
	
}
function refresh(){
	$(".f_group").find('form')[0].reset();
}

function search(){
	let sort = $('.fff input:radio[name="sort"]').val();
	let tag = $('.fff input:checkbox[name="tags"]').val();
	let searchStr = $("#searchStr").val().trim();
	if(searchStr!="") $("#t_str").val(searchStr);
		
	if(sort =="" && tag =="" && searchStr=="") return false;

	searchForm.submit();
}

function hitLike(idx, toMid){
	$.ajax({
		url : "${ctp}/challenge/challegeHitLike", 
		type : "post",
		data : {
			chIdx: idx,
			mid : '${sMid}',
			toMid : toMid	
		},
		success : function(){
			if(socket){
				let msg ="challenge/like/0/"+idx+"/"+toMid+"/"+'${sMid}';
				socket.send(msg);
			}
			location.reload();
		},
		error : function(){
			alert("전송오류");
		}
	});

}
function noLike(idx){
	$.ajax({
		url : "${ctp}/challenge/challegeNoLike", 
		type : "post",
		data : {
			chIdx: idx,
			mid : '${sMid}'
		},
		success : function(){
			location.reload();
		},
		error : function(){
			alert("전송오류");
		}
	});

}

function deletePost(idx, photo){
	let ans = confirm("정말 삭제하시겠습니까?");
	if(!ans) return;
	
	$.ajax({
		url :"${ctp}/challenge/postDelete",
		type :"post",
		data : {
			idx: idx,
			photo : photo,
			mid : '${sMid}'
		},
		success : function(){
			location.reload();
		},
		error : function(){
			alert("전송오류");
		}
	});
}

$(function(){
	$.ajax({
		url : "${ctp}/challenge/ranking",
		type : "post",
		success : function(vos){
			let currentIndex = 0; 
			let intervalID;
            function updateSearchStr() {
                if (vos.length > 0) {
                    $("#searchStr").val(vos[currentIndex].title);
                   
                    currentIndex = (currentIndex + 1) % vos.length; 
                }
            }
            
            intervalID = setInterval(updateSearchStr, 2000);
            updateSearchStr();

            $("#searchStr").on('focus', function(){
                $("#searchStr").val("");
                clearInterval(intervalID); 
            });
            $(".bi-sliders2").on('click', function(){
                $("#searchStr").val("");
                clearInterval(intervalID); 
            });

        },
        error: function() {
            alert("전송오류");
        }
		
	});
});

function addCh() {
	let title = $("#chTitle").val();
	if(title.trim() =='') {
		alert("입력하세요");
		return false;
	}
	
	$.ajax({
		url :"${ctp}/challenge/challengeAdd",
		type :"post",
		data : {title :title},
		success : function(){
			location.reload();
			alert("등록되었습니다.");
			
		},
		error : function() {
			alert("전송오류")
			
		}
		
	});
	
}


</script>
</body>
</html>