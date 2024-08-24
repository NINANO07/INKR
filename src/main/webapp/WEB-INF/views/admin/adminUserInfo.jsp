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

#myModal {z-index :9999;}

.card {
	padding : 20px;
    position: relative;
    display: flex;
    flex-direction: column;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid transparent;
    border-radius: .25rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 2px 6px 0 rgb(218 218 253 / 65%), 0 2px 6px 0 rgb(206 206 238 / 54%);
    font-family: "Dongle", sans-serif;
    font-size : 2.5rem;
}
.me-2 {
    margin-right: .5rem!important;
}
.mb-3{
	margin-bottom:10px;
}

h6{
	font-size : 2.5rem;
}

h5{
	font-size : 2rem;
}
h4, p{
	margin : 0;
}
.btn, .fs {
	font-size : 2.5rem;
	padding :0 10px;

}
.g_cnt {
	width :auto;
	display : flex;
	margin-right : 20px;
	justify-content : space-between;
	font-size : 1.3rem;
	margin-bottom : 0;
	margin-top: 15px;
}

.g_cnt h5{
	margin : 0;
	font-size : 23px;
	padding : 0;
}
.g_cnt span{
	font-size : 23px;
	margin : 0;
}

.mb-0 {
	margin-bottom:0;
}

.msgContainer input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

.msgContainer input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

.msgContainer input[type=submit]:hover {
  background-color: #45a049;
}

.msgContainer {
  border-radius: 5px;
  background-color:#fcf9e6;
  padding: 20px;
  display : flex;
  flex-direction : column;
}

textarea {
	resize: none;
}




	</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/sideMenu.jsp" />

<section id="content">

	 <main>

			<div class="row">
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="d-flex flex-column align-items-center text-center">
								<img src="${ctp}/member/${vo.photo}" alt="member" class="rounded-circle p-1 bg-primary" width="110" >
								<div class="mt-3">
									<h4>${vo.firstName} ${vo.lastName}</h4>
									<p class=" mb-1">가입날짜 : ${vo.signUpDate.substring(0,10)}</p>
									<p class="text-muted font-size-sm">최근방문 : ${vo.lastDate.substring(0,10)}</p>
									<p class="text-muted font-size-sm">방문횟수 : ${vo.visitCnt}</p>
									<p class="text-muted font-size-sm">신고횟수 : ${vo.reportCnt}</p>
									<button class="btn btn-danger" onclick="userDelete()">삭제</button>
									<button class="btn btn-primary"  data-toggle="modal" data-target="#myModal">메세지</button>
								</div>
							</div>
							<hr class="my-4">
							<ul class="list-group list-group-flush">
								<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap" style="padding:0 10px;">
									<h6 class="mb-0">Book Club</h6>
									<div class="g_cnt">
										<span>Level : ${vo.levelB}</span>
										<i class="bi bi-h-circle"><span>${bk.hostCnt}</span></i>
										<i class="bi bi-command"><span>${bk.joinCnt}</span></i>
										<i class="bi bi-suit-heart"><span>${bk.likedCnt}</span></i>
									</div>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap" style="padding:0 10px;">
									<h6 class="mb-0">Challenge</h6>
									<div class="g_cnt">
										<span>Level : ${vo.levelC}</span>
										<i class="bi bi-card-text"><span>${ch.postedCnt}</span></i>
										<i class="bi bi-suit-heart"><span>${ch.likedCnt}</span></i>
									</div>
								</li>
								<li class="list-group-item d-flex justify-content-between align-items-center flex-wrap" style="padding:0 10px;">
									<h6 class="mb-0">Meet Up</h6>
									<div class="g_cnt">
										<span>Level : ${vo.levelM}</span>
										<i class="bi bi-h-circle"><span>${mu.hostCnt}</span></i>
										<i class="bi bi-command"><span>${mu.joinCnt}</span></i>
									</div>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body">
							<form name="editForm" method="post" action="${ctp}/admin/adminUserInfo">
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">성</h6>
								</div>
								<div class="col-sm-9 ">
									<input type="text" class="form-control fs"  name="lastName" id="lastName" value="${vo.lastName}">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">이름</h6>
								</div>
								<div class="col-sm-9 ">
									<input type="text" class="form-control fs" name="firstName" id="firstName" value="${vo.firstName}">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">지역</h6>
								</div>
								<div class="col-sm-9 ">
									<select name="region" id="region"  class="form-control fs">
				                    <c:forEach var="code" items="${cVos}">
				                    	<option value="${code.isoAlp}"  ${code.isoAlp == vo.region ? "selected" : "" }>${code.korNm}
				                    	</option>
				                    </c:forEach>
				                    </select>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">생년월일</h6>
								</div>
								<div class="col-sm-9 ">
									<input type="text" id="birthday" name="birthday"class="form-control fs" value="${vo.birthday}">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">이메일</h6>
								</div>
								<div class="col-sm-9 ">
									<input type="text" class="form-control fs"  id="email" name="email" value="${vo.email}">
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-sm-3">
									<h6 class="mb-0">전화번호</h6>
								</div>
								<div class="col-sm-9 ">
									
									<select name="areaTel" id="areaTel" class="form-control fs" >
				                    <c:forEach var="code" items="${cVos}">
				                    	<option value="${code.dialCode}" ${code.dialCode == vo.areaTel ? "selected" : "" }>+${code.dialCode} (${code.korNm})
				                    	</option>
				                    </c:forEach>
				                    </select>
									<input type="text" class="form-control fs" id="tel" name="tel" value="${vo.tel}">
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3"></div>
								<div class="col-sm-9 ">
									<input type="button" class="btn btn-warning" value="수 정" onclick="edit()">
								</div>
							</div>
							<input type="hidden" value="${vo.idx}" name="idx">
							<input type="hidden" value="${vo.mid}" name="mid">
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="card">
								<div class="card-body">
									<h6 class="d-flex align-items-center mb-3">Point Status</h6>

									<h5 class="mb-0">Book Club (${bk.clubPoint})</h5>
									<div class="progress mb-3" style="height: 5px">
										<div class="progress-bar bg-primary"  style="width: ${(bk.clubPoint / 700) * 100}%;"  role="progressbar"  aria-valuenow="${bk.clubPoint}" aria-valuemin="0" aria-valuemax="700"></div>
									</div>
									<h5 class="mb-0">Challenge (${ch.point})</h5>
									<div class="progress mb-3" style="height: 5px">
										<div class="progress-bar bg-danger" role="progressbar"   style="width: ${(ch.point / 700) * 100}%;"  aria-valuenow="${ch.point}" aria-valuemin="0" aria-valuemax="700">${ch.point}</div>
									</div>
									<h5 class="mb-0">Meet Up (${mu.point})</h5>
									<div class="progress mb-3" style="height: 5px">
										<div class="progress-bar bg-success" role="progressbar"   style="width: ${(mu.point / 700) * 100}%;" aria-valuenow="${mu.point}" aria-valuemin="0" aria-valuemax="700">${mu.point}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

    </main>
</section>
<!-- modal -->
<div class="modal fade" id="myModal"  >
   <div class="modal-dialog modal-dialog-centered">
     <div class="modal-content"  >
     
       <!-- Modal Header -->
       <div class="modal-header" style="height:50px">
         <h5 class="modal-title" style="display:inline-block; font-size:18px;">Message</h5>
         <button type="button" class="close" data-dismiss="modal">&times;</button>
       </div>
       
       <!-- Modal body -->
       <div class="modal-body" >
       <form name="messageForm" method="post" action="${ctp}/admin/adminMessage">
       	<div class="msgContainer">
		    <label for="from">From</label>
		    <input type="text" id="from" name="fromMid" value="admin/user" readonly>
		
		    <label for="to">TO</label>
		    <input type="text" id="to" name="toMid" value="${vo.mid}" readonly>
		
		    <label for="subject">Subject</label>
		    <textarea id="subject" name="subject" style="height:200px"></textarea>
	
       	</div>
       	 </form>
       </div>
	
       <!-- Modal footer -->
       <div class="modal-footer" style="height:65px; border : none">
         <button type="button" value="닫기" class="btn btn-info" onclick="submit()">Submit</button>
       </div>
     </div>
   </div>
</div>


<script>
let regMid = /^[a-zA-Z0-9_]{4,10}$/;
let regName = /^[a-zA-Z가-힣]{1,10}$/;
let regBirthday = /\d{4}년\d{2}월\d{2}일/;
let regEmail = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*@[a-zA-Z0-9]([-_]?[a-zA-Z0-9])*(\.[a-zA-Z]{2,3})+$/i; 
let regTel = /\d{9,11}/;


$(document).ready(function() {


    $("#birthday").inputmask({
        alias: 'datetime',
        inputFormat: "yyyy년mm월dd일",
        outputFormat: "yyyy/dd/mm",
        separator: '/',
        leapday: "29/02/",
        min: '1907년01월01일',
        max: '2024년07월13일'
    });

    $('#tel').inputmask({
        mask: ["99-999-9999", "99-9999-9999", "999-999-9999", "999-9999-9999"],
        placeholder: "X",
        onBeforePaste: function(pastedValue, opts) {
            return pastedValue.replace(/[^0-9]/g, '');
        },
        greedy: false,
        autoUnmask: true
    });    
})

  function edit() {		
		if($("#mid").val() == ""){
			$("#mid").addClass('error error-p');
	    	$("#mid").focus();
	    	$("#mid").attr('placeholder', "<spring:message code='valid.id'/>");
	    	return;
		}
		else if($("#lastName").val() == ""){
			$("#lastName").addClass('error error-p');
	    	$("#lastName").focus();
	    	$("#lastName").attr('placeholder', "<spring:message code='valid.lastname'/>");
	    	return;
		}
		else if($("#firstName").val() == ""){
			$("#firstName").addClass('error error-p');
	    	$("#firstName").focus();
	    	$("#firstName").val("");
	    	$("#firstName").attr('placeholder', "<spring:message code='valid.firstname'/>");
	    	return;
		}
		else if($("#birthday").val() == ""){
			$("#birthday").addClass('error error-p');
	    	$("#birthday").focus();
	    	$("#birthday").val("");
	    	$("#birthday").attr('placeholder', "<spring:message code='valid.birthday'/>");
	    	return;
		}
		else if($("#email").val() == ""){
			$("#email").addClass('error error-p');
	    	$("#email").focus();
	    	$("#email").attr('placeholder', "<spring:message code='valid.email'/>");
	    	return;
		}
		else if($("#tel").val() == ""){
			$("#tel").addClass('error error-p');
	    	$("#tel").focus();
	    	$("#tel").attr('placeholder', "<spring:message code='valid.phone'/>");
	    	return;
		}
		else{
			editForm.submit();
		}

	}
	
	function userDelete(){
		let ans = confirm("정말 ${vo.mid}님을 삭제하시겠습니까?")
		/* if(ans) {
			location.href="${ctp}/admin/adminUserDelete?idx=${vo.idx}";
			
		} */

		
	} 
	
	function submit() {
		let subject = $("#subject").val();
		if(subject.trim() == ''){
			alert("내용을 입력하세요.");
			return false;
		}
		
		messageForm.submit();
		
	}
	
	$('#myModal').on('hidden.bs.modal', function (e) {
	    $(this).find('form')[0].reset();
	    $(this).find('#photoDemo').attr('src', '${ctp}/images/imgsample.png');
	});

</script>
</body>
</html>