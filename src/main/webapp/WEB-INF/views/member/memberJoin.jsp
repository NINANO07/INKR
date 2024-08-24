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

	footer{
		background-color: white;
		color : #333333;
	}
	
	footer .glyphicon {
	    color: #666666;
	}
	
	
	hr {
	    text-align: center;
	    border-top: 2px solid #d6d3d3;
	    width: 800px;
	
	}
	
	.wrapper {
		padding-top :50px;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	    min-height: 100vh;
	    width: 100%;	
	}
	
	
	.signUp {
	    width: 100%;
	    height: 100%;
	    color: #f5c000;
	    text-align: center;
	    
	}
	
	.signUpContainer {
		
	    display: flex;
	    min-height: 1200px;
	    flex-direction: column;
	    align-items: center;
	    justify-content: space-evenly;
	    white-space: nowrap; 
	}
	
	.signUpName {
	    display: flex;
	    width: 460px;
	    justify-content: center;
	    gap: 5.625px;
	}

	h3{
		color :#333333;
		font-size: 24px;
		font-weight : 600;
	}
	
	.logo {
		padding-top :20px;
	    display: flex;
	    justify-content: center;
	    align-items: baseline;
	}
	
	.regionlabel, .plabel {
		text-align: left;
	    width: 465.625px;
	}
	
	input, select {
	    height: 56.1px;
	    width: 465.625px;
	    padding-left: 20px;
	    border: 2px solid #f5c000;
	    color: #333333;
	    font-size: 22px;
	    border-radius :8px;

	}
	
	input::placeholder{
	    color: #666666;
	}
	
	input:focus, select:focus{
	    outline: none;
	}
	
	input[type=checkbox] {
	    height: initial;
	    width: initial;
	}
	
	input[type=button] {
	    background-color: transparent;
	    border: 3px solid #f5c000;
	    font-weight: 700;
	    color: #f5c000;
	    cursor: pointer;
	}
	
	input[type=button]:hover {
	    background-color: #f5c000;
	    color: #1C1C1C;
	}
	
	.photo{
		display:flex;
		width: 465.625px;
		height : auto;
		gap :30px;
		
	}
	
	.photo_img {
		width:150px;
		height:150px;
		border: 3px solid #f5c000;
	    border-radius: 10%;
	    overflow:hidden;
	    
	}
	
	.photo_img img{
		width : 100%;
		height : 100%;
		
	}
	
	#file {
		display:none;
	}
	
	.photolabel {
		cursor :pointer;
		background-color : #f5c000;
		font-size: 18px;
		padding :0 20px;
		color : #1C1C1C;
		height : 100%;
		border-radius : 8px;
		&:hover {
			background-color: #1C1C1C;
			color : #f5c000;
  		}
	}

	.error {
        border: 2px solid #f5c000;
        background-color: transparent;
        color: #f5c000;
        animation: shake 0.5s ease-in-out;

	}
	
	.error-p::-webkit-input-placeholder {
    	color: #f5c000
	}
	
	@keyframes shake {
    0% {
        transform: translateX(0);
    }
    25% {
        transform: translateX(-5px);
    }
    50% {
        transform: translateX(5px);
    }
    75%{
        transform: translateX(-5px);
    }
    100%{
        transform: translateX(0);
    }
	}
		
	</style>
    <script>
    
    
    'use strict';
	
    
    let regMid = /^[a-zA-Z0-9_]{4,10}$/;
    let regName = /^[a-zA-Z가-힣]{1,10}$/;
	let regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{4,10}$/;
	let regBirthday = /\d{4}년\d{2}월\d{2}일/;
    let regEmail = /^[0-9a-zA-Z]([-_]?[0-9a-zA-Z])*@[a-zA-Z0-9]([-_]?[a-zA-Z0-9])*(\.[a-zA-Z]{2,3})+$/i; 
    let regTel = /\d{9,11}/;
    
    
    $(document).ready(function() {
    	let lang = '<c:out value="${lang}" />';
   	    let inputFormat;

   	    if (lang === 'KO') {
   	        inputFormat = "yyyy년mm월dd일";
   	    } else {
   	        inputFormat = "yyyy/mm/dd";
   	     	regBirthday = /\d{4}\/\d{2}\/\d{2}/;
   	    }

   	    $("#birthday").inputmask({
   	        alias: 'datetime',
   	        inputFormat: inputFormat,
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
		
		$('#mid').on('blur', function(){			
			let mid = $("#mid").val();
			
		 	if(!regMid.test(mid)){
		    	$("#mid").addClass('error error-p');
		    	$("#mid").val("");
		    	$("#mid").attr('placeholder', "<spring:message code='valid.id'/>" );
				return;
		    }
		    else{
		    	
		    	
		    	$.ajax({
		    		url : "${ctp}/member/memberIdCheck",
		    		type : "post",
		    		data : {mid : mid},
		    		success : function(res) {
		    			if(res == "0") {
		    				$("#mid").addClass('error error-p');
		    		    	$("#mid").val("");
		    		    	$("#mid").focus();
		    		    	$("#mid").attr('placeholder', "<spring:message code='valid.already'/>");
		    		    	return;
		    			}
		    			else {
		    				$("#mid").removeClass('error error-p');
		    			}
		    		},
		    		error : function() {
		    			alert("전송실패");
		    		}
		    	});	
		    
		    }

		});
		
		$('#lastName').on('blur', function() {
			
		    if(!regName.test($("#lastName").val())){
		    	$("#lastName").addClass('error error-p');
		    	$("#lastName").focus();
		    	$("#lastName").val("");
		    	$("#lastName").attr('placeholder', "<spring:message code='valid.lastname'/>");
				return;
		    }
		    else{
		    	$("#lastName").removeClass('error error-p');
		    }
		});
		
		$('#firstName').on('blur', function() {
		    if(!regName.test($("#firstName").val())){
		    	$("#firstName").addClass('error error-p');
		    	$("#firstName").focus();
		    	$("#firstName").val("");
		    	$("#firstName").attr('placeholder', "<spring:message code='valid.firstname'/>" );
				return;
		    }
		    else{
		    	$("#firstName").removeClass('error error-p');
		    }
		});
		
		$('#birthday').on('blur', function() {
		    if(!regBirthday.test($("#birthday").val())){
		    	$("#birthday").addClass('error error-p');
		    	$("#birthday").val("");
		    	$("#birthday").focus();
		    	$("#birthday").attr('placeholder', "<spring:message code='valid.birthday'/>" );
				return;
		    }
		    else{
		    	$("#birthday").removeClass('error error-p');
		    }
		});
		
		
		
		$("#email").on('blur', function() {
		    if(!regEmail.test($("#email").val())){
		    	$("#email").addClass('error error-p');
		    	$("#email").val("");
		    	$("#email").focus();
		    	$("#email").attr('placeholder', "<spring:message code='valid.email'/>" );
				return;
		    }
		    else{
		    	let email = $("#email").val();	
		    }
		});
		    
		$("#pwd").on('blur', function() {
		    if(!regPwd.test($("#pwd").val())){
		    	$("#pwd").addClass('error error-p');
		    	$("#pwd").val("");
		    	$("#pwd").focus();
		    	$("#pwd").attr('placeholder', "<spring:message code='reg'/>" );
				return;
		    } else if ($("#pwdCheck").val() != "" && $("#pwdCheck").val() != $("#pwd").val()){
		    	$("#pwdCheck").addClass('error error-p');
		    	$("#pwdCheck").val("");
		    	$("#pwdCheck").focus();
		    	$("#pwdCheck").attr('placeholder', "<spring:message code='valid.pwdnotmatch'/>" );
		    	$("#pwd").removeClass('error error-p');
				return;
	    	}	    
		    else{
		    	$("#pwd").removeClass('error error-p');
		    	return;
		    }

		});
		
		$("#pwdCheck").on('blur', function() {
		    if($("#pwdCheck").val() != $("#pwd").val()){
		    	$("#pwdCheck").addClass('error error-p');
		    	$("#pwdCheck").val("");
		    	$("#pwdCheck").attr('placeholder', "<spring:message code='valid.pwdnotmatch'/>" );
				return;
		    }
		    else{
		    	$("#pwdCheck").removeClass('error error-p');
		    }
		});
		
		$("#tel").on('blur', function() {
		    if(!regTel.test($("#tel").val())){
		    	$("#tel").addClass('error error-p');
		    	$("#tel").val("");
		    	$("#tel").focus();
		    	$("#tel").attr('placeholder', "<spring:message code='valid.phone'/>" );
				return;
		    }
		    else{
		    	$("#tel").removeClass('error error-p');
		    }
		});
		
	})
      	
    function joinOk() {	
		
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
		else if($("#pwd").val() == ""){
			$("#pwd").addClass('error error-p');
	    	$("#pwd").focus();
	    	$("#pwd").attr('placeholder', "<spring:message code='valid.pwd'/>");
	    	return;
		}
		else if($("#pwdCheck").val() == ""){
			$("#pwdCheck").addClass('error error-p');
	    	$("#pwdCheck").focus();
	    	$("#pwdCheck").attr('placeholder', "<spring:message code='valid.pwdconfirm'/>");
	    	return;
		}
		else if($("#tel").val() == ""){
			$("#tel").addClass('error error-p');
	    	$("#tel").focus();
	    	$("#tel").attr('placeholder', "<spring:message code='valid.phone'/>");
	    	return;
		}
		else if($("#terms").is(":checked") != true){
			alert("<spring:message code='valid.term'/>");
	    	return;
		}
		else{
			signUpForm.submit();
		}

	}
	
	function imgCheck(e) {	
		let maxSize = 1024 * 1024 * 2;
		
    	if(e.files && e.files[0]) {
    		let fileSize = e.files[0].size;
    		if(fileSize > maxSize){
    			alert("<spring:message code='valid.size'/>");
    			return false;
    		}
    		
    		let reader = new FileReader();
    		reader.onload = function(e) {
    			document.getElementById("photoDemo").src = e.target.result;
    		}
    		reader.readAsDataURL(e.files[0]);
    	}
    }
    	
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
 <div class="wrapper">
        <div class="signUp">
            <div class="logo">
                <h3 style="margin: 20px 0;"><spring:message code="join.title"/></h3>
            </div>
            <form name="signUpForm" method="post" enctype="multipart/form-data">
                <div class="signUpContainer">
                    <input type="text" placeholder="<spring:message code='id'/>" id="mid" name="mid"/>
                    <input type="password" placeholder="<spring:message code='pwd'/>" name="pwd" id="pwd"/>
                    <input type="password" placeholder="<spring:message code='join.confirm'/>" name="pwdCheck" id="pwdCheck"/> 
                    <hr/>   
                    <div class="signUpName">
                    	<c:if test="${lang != 'KO'}">
                        <input type="text" placeholder="<spring:message code='join.firstname'/>" style="width: 240px;" name="firstName" id="firstName"/>
                        <input type="text" placeholder="<spring:message code='join.lastname'/>" style="width: 220px;" name="lastName" id="lastName" />
                        </c:if>
                    	<c:if test="${lang == 'KO'}">
                        <input type="text" placeholder="<spring:message code='join.lastname'/>" style="width: 220px;" name="lastName" id="lastName" />
                        <input type="text" placeholder="<spring:message code='join.firstname'/>" style="width: 240px;" name="firstName" id="firstName"/>
                        </c:if>
                    </div>
                    <div class="regionlabel" style="margin-bottom:-15px; margin-top:10px;" >
                        <label for="region"><spring:message code='join.region'/></label>
                    </div>
                    <select name="region" id="region" >
                    <c:forEach var="code" items="${cVos}">
                    	<option value="${code.isoAlp}"  ${code.isoAlp == "KR" ? "selected" : "" }><c:if test="${lang=='KO'}">${code.korNm}</c:if>
                    	<c:if test="${lang !='KO'}">${code.engNm}</c:if></option>
                    </c:forEach>
                    </select>
                    
                    <input type="text" placeholder="<spring:message code='join.birthday'/>" id="birthday" name="birthday"/>
                    <input type="text" placeholder="<spring:message code='join.email'/>" id="email" name="email"/>
                    <hr/>
                    <select name="areaTel" id="areaTel" >
                    <c:forEach var="code" items="${cVos}">
                    	<option value="${code.dialCode}" ${code.isoAlp == "KR" ? "selected" : "" }>+${code.dialCode} <c:if test="${lang=='KO'}">(${code.korNm})</c:if>
                    	<c:if test="${lang !='KO'}">(${code.engNm})</c:if></option>
                    </c:forEach>
                    </select>
                    <input type="text" placeholder="<spring:message code='join.phonenumber'/>" id="tel" name="tel"/>
                    
                    <label class="plabel" style="margin-bottom:-10px; margin-top:10px;"><spring:message code='join.photo'/></label>
                    <div class="photo" style="display:flex">
				        <div class="photo_img"><img id="photoDemo" src="${ctp}/images/nopimg.jpg" /></div>
				        <label for="file" class="photolabel"><spring:message code='join.upload'/></label>
				        <input type="file" name="file" id="file" onchange="imgCheck(this)"  accept=".gif, .jpg, .png, .jpeg"/>
				    </div>
                    <hr/>
                    <div style="text-align: left; font-size: 16.3px; width: 465.625px; white-space:normal">
                        <input type="checkbox" name="terms" id="terms" /><b style="color:#666666"> <spring:message code='join.term'/></b>
                    </div>
                    <div style="margin-top: 20px;">
                        <input type="button" value="<spring:message code='join.continue'/>" onclick="joinOk()"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>