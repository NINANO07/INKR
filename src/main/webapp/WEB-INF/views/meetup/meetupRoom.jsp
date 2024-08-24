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
.modal {z-index:9999;}
	
.eventInfo {
	display : flex;
	flex-direction : column;
	justify-content : center;
	align-items : center
	
}
.card-box {
    padding: 20px;
    border-radius: 3px;
    margin-bottom: 30px;
    background-color: #fff;
    width : 200px;
    height : 265px;
    border-radius : 10px;
    position : relative;
}




.social-links li a:hover {
    color: #797979;
    border: 2px solid #797979
}
.thumb-lg {
    height: 88px;
    width: 88px;
}

.text-pink {
    color: #ff679b!important;
}
.btn-rounded {
    border-radius: 2em;
}
.text-muted {
    color: #98a6ad!important;

}
h4 {
    line-height: 22px;
    font-size: 18px;
}	


		
.eventInfo h2{
font-family: "Kirang Haerang", system-ui;
text-shadow: 2px -3px #f5c000;
font-size: 38px;
margin-bottom : 10px;

}

.eventInfo h3{
font-family: "Kirang Haerang", system-ui;
color : #1c1c1c;
text-shadow: 2px -3px #62BED2;
font-weight : 600;
font-size: 27px;
margin-top:5px;
}


.middle {
	display : flex;
	margin : 20px;
	gap : 20px;
	min-width : 800px;
}	





.info_txt{
	background-color : #f0f6f8;
	flex:1;
	white-space : normal;
	border-radius : 10px;
	max-height : calc(100vh - 100px);
	overflow : overlay;
}

.atendees {
	flex: 0.8;
	border-radius : 10px;
	background-color : #f0f6f8;
	padding : 10px 10px;
	max-height : calc(100vh - 100px);
	overflow : overlay;

}
.atendees h3{
	margin-left:20px;
	color : #1c1c1c;
	font-weight : 600;
}
.card_wrapper {
	display : flex;
	flex-wrap : wrap;
	justify-content : center;
	gap:10px;
}

.member-card h4{
	margin : 10px;
}

.row {
	margin : 20px;
}
.image_info {
	flex: 1;
	display : flex;
	flex-direction : column;

}

.info_txt::-webkit-scrollbar, .atendees::-webkit-scrollbar  { 
	    display: none;  
	}



#map{
	width : 100%;
	height : 16vw;
	margin-top : 30px;
}	

.firstimage {
	width : 100%;

}
.firstimage img {
	width : 100%;

}
#host {
	color : blue;
	position : absolute;
	top :10px;
	left : 50px;
	font-size:30px;
	transform: rotate(-10deg);
}

.lineM {
	background-color : white;
	border-radius : 10px;
	display : flex;
	justify-content : space-between;
	margin : 10px 20px;
	padding : 5px 10px;
	gap :10px;
	font-family: "Kanit", sans-serif;
}

.lineM h5{
	font-size : 18px;
	color : #636363;
}

.notice {
	background-color : 	#fae6e6;
	border-radius : 10px;
	display : flex;
	flex-direction : column;
	justify-content : space-between;
	margin : 10px 20px;
	padding : 5px 10px;
	gap :10px;
	font-family: "Kanit", sans-serif;
	position : relative;
}

.notice h5{
	font-size : 20px;
	color : #1c1c1c;
}

#messageBox {
	width : calc(100% - 40px);
	min-height : 60px;
	background-color : white;
	border : 2px solid #048ebd;
	margin : 20px;
	border-radius : 10px;
	font-family: "Kanit", sans-serif;
	font-size : 18px;
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
	flex:1;
	display : flex;
	flex-direction : column;
}
.memberR{
	flex:3;
}

.memberPhoto .profile_pic{
	width : 70px;
	height :70px;
	border-radius : 30%;
	border : 1px solide blaack;
	overflow : hidden;
	
}
.profile_pic img{
	width : 100%;
}

.acceptA {
	padding :0 17px;
	display: flex;
	justify-content : space-between;
	align-items : center;
}
		
</style>
<script>

	$(function(){
		let today = new Date().toISOString().split('T')[0];
		let min = today <= $("#sd").val() ? $("#sd").val() : today; 
	    $('#date').prop('min', min);
	});


	function notice(idx){
		
		let message = $("#messageBox").text().trim();
		
		if(message == ""){
			alert("공지사항을 입력하세요.");
			return false;
		}
		
		$.ajax({
			url : "${ctp}/meetup/setNotice",
			type : "post",
			data : {idx : idx, content : message },
			success : function(){
				$("#info_txt").load(window.location.href + " #info_txt");
			},
			error : function(){
				alert("전송오류");
			}
		});
		
	}
	
	function deleteN(idx){
		$.ajax({
			url : "${ctp}/meetup/deleteNotice",
			type : "post",
			data : {idx : idx},
			success : function(){
				$("#info_txt").load(window.location.href + " #info_txt");
			},
			error : function(){
				alert("전송오류");
			}
		});
		
	}
	
	function cancel() {
		cancelForm.submit();
	}
	
	function getMember(pageNum){
		let idx = ${vo.idx};
		
		let line = "";
		$.ajax({
			url : "${ctp}/meetup/meetupWaited",
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
				    
				    
				    
				    line +=  '<div class="acceptA"><h5 style="margin-bottom:20px;">WAIT LIST  ('+res.length+') </h5></div>';
					$.each(res, function (j, item) {
					    if((pageNum-1)*pageSize <= j && j < pageNum*pageSize){
							line += '<div class="memberList">';
							line += '<div class="memberL">';
							line += '<div class="memberPhoto">';
							line += '<div class="profile_pic"><img src="${ctp}/member/'+item.photo+'" /></div>';
							line += '</div>';
							
							line += '</div>';
							line += '<div class="memberR">';
							line += '<table class="table table-condensed">';
							line += '<tr><th>ID</th><td>'+item.mid+'<td></tr>';
							line += '<tr><th>LEVEL</th><td>'+item.levelM+'<td></tr>';
							line += '<tr><th>DATE</th><td>'+item.putDate.substring(0,10)+'<td></tr>';
							line += '</table>';
							
							line += '</div></div>';
					    };
					});
					
					line += ' <tr><td colspan="5" class="m-0 p-0"></td></tr>';
		            line += '</table></div>';

		            line += '<div class="text-center">';
		            line += '<ul class="pagination pagination-sm justify-content-center" style="margin: 0; padding: 0;">';

		            if (pageNum > 1) {
		            	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(1); return false;">❮❮</a></li>';
		            }

		            if (curBlock > 0) {
		                let prevBlockPage = curBlock * blockSize;
		                line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(' + prevBlockPage + '); return false;">❮</a></li>';
		            }

		            let startPage = curBlock * blockSize + 1;
		            let endPage = Math.min((curBlock + 1) * blockSize, totalPages);

		            for (let i = startPage; i <= endPage; i++) {
		                if (i === pageNum) {
		                	line += '<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="#">' + i + '</a></li>';
		                } else {
		                	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(' + i + '); return false;">' + i + '</a></li>';
		                }
		            }

		            if (curBlock < lastBlock) {
		                let nextBlockPage = (curBlock + 1) * blockSize + 1;
		                line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(' + nextBlockPage + '); return false;">❯</a></li>';
		            }

		            if (pageNum < totalPages) {
		            	line += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="getMember(' + totalPages + '); return false;">❯❯</a></li>';
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
	
	function edit(){

		let date = $("#date").val();
		let time = $("#time").val();
		let memNumber = $("#memNumber").val();

		if(date == '${vo.meetingDate}' && time == '${vo.meetingTime}' && memNumber == ${vo.memNumber}){
			alert("수정사항이 없습니다.");
			return false;
		}
		
		if(memNumber < ${vo.memNumber}){
			alert("멤버수 감소 불가")
			return false;
		}
		
		$.ajax({
			url :"${ctp}/meetup/meetupEdit",
			type : "post",
			data : {
				idx: ${vo.idx},
				meetingDate : date,
				meetingTime : time,
				memNumber : memNumber
			},
			success : function(res) {
				
				if(res.length > 0){
					res.forEach(function(toMid) {
						if(socket){
							let msg = "meetup/accept/0/"+${vo.idx}+"/"+toMid+"/"+'${vo.host}';
							socket.send(msg);
						}
			        });
				}
				
				$("#askWrapper").load(window.location.href + " #askWrapper");
				$("#atendees").load(window.location.href + " #atendees");
				$("#message_wrapper").load(window.location.href + " #message_wrapper");
				getMember(1);
				alert("수정되었습니다.");
				
				
				
			},
			errop : function(){
				alert("전송오류");
				
			}
		});
		
		
		
	}
	
	function deleteMeetup() {
		let ans = confirm("Are you sure you want to delete this meetup?");
		if(ans){
			location.href="${ctp}/meetup/meetupDelete?idx="+${vo.idx};
		}
		else return false;
	}
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="wrapper">
	<c:if test="${sMid == 'admin' }"><jsp:include page="/WEB-INF/views/include/sideMenu.jsp" /></c:if>
	<c:if test="${sMid != 'admin' }"><jsp:include page="/WEB-INF/views/include/left.jsp" /></c:if>
	
	<div class="memberRight" <c:if test="${sMid == 'admin'}">style="width :80%; margin-left:220px; margin-top:60px"</c:if>>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=158c673636c9a17a27b67c95f2c6be5c"></script>
	<div class="eventInfo">
		<h2>${vo.title}</h2>
		<%-- <h3>HOSTED BY ${vo.host} </h3> --%>
	</div>
	<div class="middle">
		<div class="atendees" id="atendees">
			<h3>Atendees (${vo.curNumber}/${vo.memNumber})</h3>
			<div class="card_wrapper">
	        	<c:forEach var="mvo" items="${vos}">
	                <div class="text-center card-box">
	                    <div class="member-card">
	                        <div class="thumb-lg" style="margin-left:40px;"><img src="${ctp}/member/${mvo.photo}" class="rounded-circle img-thumbnail" alt="profile-image">
	                        <c:if test="${vo.host == mvo.mid}"><iconify-icon id="host" icon="mdi:alphabet-h-box-outline" ></iconify-icon></c:if></div>
	                        <div class="">
	                            <h4>${mvo.firstName}<span style="color :<c:if test="${mvo.levelM == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
								<c:if test="${mvo.levelM == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
								<c:if test="${mvo.levelM == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
								<c:if test="${mvo.levelM == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
								<i class="bi bi-command nicon"  onclick="toggleKey('M')"></i></span></h4>
	                            <p class="text-muted">@Phone <span>|<br/> </span><span><a href="#" class="text-pink">${mvo.tel}</a></span></p>
	                        </div>		
	                        <c:if test="${sMid == mvo.mid and sMid != vo.host}"><button type="button" class="btn btn-warning mt-3 btn-rounded waves-effect w-md waves-light" onclick="cancel()">Cancel</button></c:if>
	                        <c:if test="${sMid == mvo.mid and sMid==vo.host}"><button type="button" class="btn btn-primary mt-3 btn-rounded waves-effect w-md waves-light"  data-toggle="modal" data-target="#myModal" onclick="getMember(1)">Setting</button></c:if>
	                    </div>
	                </div>
	           </c:forEach>
	           <form name="cancelForm" method="post" action="${ctp}/meetup/cancelMeetup">
					<input type="hidden" name="mid" value="${sMid}"/>
					<input type="hidden" name="meetupIdx" value="${vo.idx}"/>
				</form>
	          </div>
	</div>
	<div class="info_txt" id="info_txt">
		<c:if test="${sMid == vo.host}">
		<div contenteditable="true" spellcheck="false" class="editable" id="messageBox"></div>
		<div style="text-align : right; margin-top:-15px; margin-right:20px; margin-bottom:20px;"><button type="button" class="btn btn-info" onclick="notice(${vo.idx})">POST</button></div>
		
		</c:if>
		<div class="message_wrapper" id="message_wrapper">

			<c:forEach var="msg" items="${svos}" varStatus="st">
				<c:if test="${msg.notice && st.index == 0}">
					<div class="notice">
						<h5>${msg.content}</h5>
						<h5 style="font-size : 12px; text-align : right;">${msg.setDate.substring(0, 10)}</h5>
						<c:if test="${sMid == vo.host}"><i class="bi bi-x-circle-fill" style="position:absolute; right:10px; color : #fa5252; cursor:pointer" onclick="deleteN(${msg.idx})"></i></c:if>
					</div>
				</c:if>
				
				<c:if test="${!msg.notice}">
					<div class="lineM">
					<h5>${msg.content}</h5>
					<h5 style="font-size : 12px;">${msg.setDate.substring(0, 10)}</h5>
					</div>
				</c:if>
				
			</c:forEach>
		</div>
		
	</div>
	
	<div class="image_info">	
		<div class="firstimage"><img src="${vo.firstimage}"></div>
		<h3><i class="bi bi-calendar3"></i> &nbsp;${vo.meetingDate} &nbsp;&nbsp;&nbsp;<i class="bi bi-clock"></i>&nbsp;${vo.meetingTime}</h3>
		<div id="map"></div>
		<h5>${vo.addr}</h5>
	</div>
</div>

	<script>
	var mapContainer = document.getElementById('map'),	  
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.mapy},${vo.mapx}), 
        level: 3
    };
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var marker = new kakao.maps.Marker({ 
		    position: map.getCenter() 
		}); 

		marker.setMap(map);
		
	</script>
	</div>
</div>
<!-- modal -->
<div class="modal fade" id="myModal"  >
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content"  >
     
       <!-- Modal Header -->
       <div class="modal-header" style="height:50px">
         <h5 class="modal-title" style="display:inline-block; font-size:18px;">Setting</h5>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body" >
       	<div id="askWrapper">
       		<div class="input-group" style="display:flex; gap:30px; margin-bottom:20px;">
				<input type="hidden" id="sd" value="${vo.eventstartdate}">
				<input <c:if test="${vo.curNumber != 1}">style="pointer-events: none; "</c:if> type="date" lang="en-US" name="meetingDate" id="date" value="${vo.meetingDate}"  max="${vo.eventenddate}" class="form-control input-lg" >
				<input <c:if test="${vo.curNumber != 1}">style="pointer-events: none; "</c:if>  type="time" id="time"  value="${vo.meetingTime}" name="meetingTime" class="form-control input-lg" >
				<div style="display:flex; gap:10px;"><i class="bi bi-person"></i><input type="number" placeholder="${vo.memNumber}" value="${vo.memNumber}" name="memNumber" id="memNumber" class="form-control input-lg" min="${vo.memNumber}" style="width:70px;"/></div>
				<button type="button" class="btn btn-default"  onclick="edit()">EDIT</button>
			</div>
       		
   			<div id="memberWrapper">

   			</div>
       	</div>
       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:65px; border : none">
         <c:if test="${vo.curNumber == 1}"><button type="button" value="닫기" class="btn btn-danger"  data-dismiss="modal" onclick="deleteMeetup()" >DELETE</button></c:if>
       </div>
     </div>
   </div>
</div>
<c:if test="${sMid != 'admin'}"><jsp:include page="/WEB-INF/views/include/footer.jsp" /></c:if>
</body>
</html>