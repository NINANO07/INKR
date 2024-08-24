<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LOGIN</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<jsp:include page="/WEB-INF/views/include/css.jsp" />
	<style>
	
		footer{
			background-color: #f5c000;
			color:#1C1C1C;
		}
	
		body {
			background-color : #f5c000;
		}
		.wrapper {
			margin-top:50px;
		    width: 100vw;
		    min-height: calc(100vh - 50px);
		    height : 100%;
		    display: flex;
		}
		.loginLeft {
		    flex: 1;
		    width: 50%;

		}
		
		.video-group {
			position : absolute;
			top: 50%;
		    left: 20%;
		    transform: translate(-60%, -45%);	
		}
		
		.video {
			position: relative;
			border-radius: 15px; 
			box-shadow: 5px 5px 10px #1C1C1C;
		}
		
		.v1 {
			top:130px;
			left :60px;
		    width: 400px;
		    height: 228px;
		    background-color : #1C1C1C;
		}
		.v2 {
			top:145px;
			left :124px;
		    width: 230px;
		    height: 230px;
		    background-color : #1C1C1C;
		}
		.v3 {
			top:-180px;
			left :370px;
		    width: 280px;
		    height: 280px;
		    background-color : #1C1C1C;
		}
		
		.video video {
			width :97%;
			position : relative;	
			top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);		
		    border-radius: 15px; 
		}

		
		.loginRight {
		    flex: 1;
		    width: 50%;
		}
		.login {
		    color: #f5c000;
		    position: relative;
		    top: 46%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    width: 500px;
		    height: 600px;
		    background-color: #1C1C1C;
			background: linear-gradient(135deg, rgba(0,0,0,0.5));
		    backdrop-filter: blur(10px);
		    --webkit-backdrop-filter: blur(10px);
		    border: 1px solid rgba(255,255,255,0.25);
		    border-radius: 15px;
		    box-shadow: 3px 3px 6px 3px rgba(0,0,0,0.2);
		    display: flex;
		    flex-direction: column;
		    align-items: center;
		    justify-content: space-around;
		    padding:20px;
		    
		}
		
		input[type=text], input[type=password] {
		    width: 280px;
		    height: 32px;
		   
		    font-size: 16px;
		    background-color: transparent;
		    border-top: none;
		    border-left: none;
		    border-right: none;
		    border-color:  #f5c000;
		}
		input:focus{
		    outline: none;
		}
		input::placeholder{
		    color: #f5c000;
		}
		
		.loginbtn{
		    width: 280px;
		    height: 37px;
		    margin-top: 10px;
		    border: none;
		    background: #f5c000;
		    color: #1C1C1C;
		    border-radius:4px;
		    font-size: 17px;
		    cursor: pointer;
		}
		.loginbtn:hover{
		    background: #ECD540;
		    
		}
		
		.resetBtn{
		    text-align: right;
		    margin-top: 4px;
		}
		
		.cancelbtn{
		    border: none;
		    background:transparent;
		    cursor: pointer;
		    color: #f5c000;
		    font-size: 16px;
		    cursor : pointer;
		}
		.err-msg, .perr-msg {
		    display: block;
		    color: #ffa7a6;
		    font-size: 13px;
		    font-style: italic;
		    position: relative;
		    margin-bottom: 50px;
		}
		.v-msg, .pv-msg {
		    display: block;
		    font-style: italic;
		    font-size: 13px;
		    color: #b8e0d2;
		}
		
		a{
			color: #fbe790;
		}
		
		a:hover{
			color: #ECD540;
		}
		.continue {
			display:none;
		}
		.code {
			display:none;
		}
		.fpw {
			display:none;
		}
		.emailS{
			display:none;
		}
		.codeV{
			display:none;
		}
		.loading{
			display:none;
		}
			
		.change{
			display:block;
		}
		.hidden{
			display:none;
		}
		
		@media screen and (max-width: 1230px) {
		    .loginLeft {
		      display : none;
		    }
		    
		   
		
		  }
		
		
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />

<p><br/></p>
<div class="wrapper">
	<div class="loginLeft">
		<div class="video-group">
         <div class="video v1">
         	<video src="${ctp}/video/meetup.mp4" autoplay muted loop></video>
         </div>
         <div class="video v2">
         	<video src="${ctp}/video/meetup2.mp4" autoplay muted loop></video>
         </div>
         <div class="video v3">
         	<video src="${ctp}/video/meetup3.mp4" autoplay muted loop></video>
         </div>
         </div>
     </div>
     <div class="loginRight">
         <div class="login">
             <h4 style="color:white"><spring:message code='resetPwd'/></h4>
                <form name="resetPwdForm" method="post" >
                    <div class="fid">
                        <input type="text" id="fid" name="mid" placeholder="<spring:message code='login.id'/>" required/><br/>
                        <div class="v-msg">&nbsp;</div>
                    	<div class="err-msg"></div>
                    </div>
                    <div class="dummy">     
                        <div class="v-msg">&nbsp;</div>
                    	<div class="err-msg"></div>
                    </div>
                    <div class="loading">     
                        <div class="v-msg">&nbsp;</div>
                    	<div class="err-msg"></div>
                    	<h6 style="width : 280px; white-space:normal"><spring:message code='code'/></h6>
                    </div>
                    
          
                    <div class="code">
                    	<h6><spring:message code='entercode'/></h6>
                        <input type="text" id="codeInput"   required/><br/>
                        <div class="v-msg">&nbsp;</div>
                    	<div class="err-msg"></div>
                    </div>
                    <div class="fpw">
                        <input type="password" id="fpw" name="pwd" placeholder="<spring:message code='newPwd'/>" required />
                        <div class="pv-msg">&nbsp;</div>
                        <div class="perr-msg"></div>
                        <input type="password" id="fpwC" placeholder="<spring:message code='valid.pwdconfirm'/>" required />
                        <div>&nbsp;</div>
                        <div>&nbsp;</div>
                    <button type="button" class="loginbtn" onclick="mainPage()"><b><spring:message code='resetPwd'/></b></button>
                    </div>
                    <button type="button" class="loginbtn continue change" id="continue" onclick="midC()"><b><spring:message code='join.continue'/></b></button>
                    <button type="button" class="loginbtn emailS" onclick="midS()"><b><spring:message code='get'/></b></button>
                    <button type="button" class="loginbtn codeV" onclick="codeV()" ><b><spring:message code='confirm'/></b></button>
                    <div class="resetBtn">
                        <button type="button" class="cancelbtn" onclick="msgClear()"><spring:message code='login.reset'/></button>
                    </div>
	                
                </form>
            
         </div>
     </div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script>
	'use strict';

    let idV = false;
    let pwV = false;
    if(document.getElementById('fid').value != "") idV = true;

    let regMid = /^[a-zA-Z0-9_]{4,10}$/;
    let regPwd = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{4,10}$/;
    
    const err_msg = document.querySelector('.err-msg');
    const v_msg = document.querySelector('.v-msg');
    document.addEventListener('DOMContentLoaded', function(){
    	

    const fid = document.getElementById('fid');
    const fidC = document.getElementById('fidC');
    const fpw = document.getElementById('fpw');
    
    const perr_msg = document.querySelector('.perr-msg');
    const pv_msg = document.querySelector('.pv-msg');

     
    fid.addEventListener('input', function(){
        let input = fid.value.trim();



        if (input === '') {
            v_msg.innerText ='';
            err_msg.innerText = "<spring:message code='login.id'/>";
            idV = false;

        } else if (input.indexOf(' ') !== -1) {
            v_msg.innerText ='';
            err_msg.innerText = "<spring:message code='login.invalid'/>";
            idV = false;

        } else if (!regMid.test(input)) {
            v_msg.innerText ='';
            err_msg.innerText = "<spring:message code='login.invalid'/>";
            idV = false;

        } else {
            v_msg.innerText = "<spring:message code='login.valid'/>";
            err_msg.innerText ='';
            idV = true;
        }
    });
    
    

    fpw.addEventListener('input', function(){
        let input = fpw.value.trim();
        const perr_msg = document.querySelector('.perr-msg');
        const pv_msg = document.querySelector('.pv-msg');
        
        if (input === '') {
            pv_msg.innerText ='';
            perr_msg.innerText = "<spring:message code='newPwd'/>";
            pwV = false;

        } else if (input.indexOf(' ') !== -1) {
            pv_msg.innerText ='';
            perr_msg.innerText = "<spring:message code='login.invalid'/>";
            pwV = false;

        } else {
            perr_msg.innerText ='';
            pwV = true;
        }
    });
});

    function msgClear() {
        document.querySelector('.perr-msg').innerHTML="&nbsp";
        document.querySelector('.pv-msg').innerText="";
        document.querySelector('.err-msg').innerText=""
        document.querySelector('.v-msg').innerHTML="&nbsp";
        document.getElementById('fid').value ="";
        document.getElementById('fpw').value ="";
        pwV = false;
        idV = false;
    }

    function mainPage(){
    	let mid = document.getElementById('fid').value.trim();
    	let pwd = document.getElementById('fpw').value.trim();
    	let pwdC = document.getElementById('fpwC').value.trim();
        if(!pwV || pwd=="" ){
        	document.querySelector('.perr-msg').innerText = "<spring:message code='newPwd'/>";
            pwV = false;
        	pwd.focus;
        	return false;
        }
        else if(!regPwd.test(pwd)){
        	document.querySelector('.perr-msg').innerText = "<spring:message code='reg'/>";
        	pwV = false;
        	pwd.focus;
			return false;
        }
		else if (pwdC != pwd){
        	document.querySelector('.perr-msg').innerText = "<spring:message code='valid.pwdnotmatch'/>";
        	pwdC.focus;
        	return false;
	}	    
        document.querySelector('.perr-msg').innerText = ''

        resetPwdForm.submit();

    }
    
    function midC(){
        if(!idV){
        	$("#fid").val("");
        	$("#fid").focus();
        	$("#fid").attr('placeholder', "<spring:message code='login.invalid'/>" );
    		return;
        }
        
        	
        let mid = $("#fid").val();
        	
        	$.ajax({
        		url : "${ctp}/member/memberIdCheck",
        		type : "post",
        		data : {mid : mid},
        		success : function(res) {
    			  if(res == "0") {
    				  $(".loading").addClass('change');
    				  $(".emailS").addClass('change');
    			      $(".continue").removeClass('change'); 
    			      $(".dummy").addClass('hidden'); 
    			      $('#fid').prop('readonly', true);
    			      v_msg.innerText = '';
    			    }
    			    else { 
    			    	alert("<spring:message code='noidexist'/>");
     			        $("#fid").val("");
     			        $("#fid").focus();
     			       	v_msg.innerText = '';
     	                idV = false;
     			        return false;
    			    }
        		},
        		error : function() {
        			alert("전송실패");
        		}
        	});	
        }

    
    
    let code = "";
    
    function midS(){ 
    	let mid = $("#fid").val();
    	
    	$.ajax({
    		url : '${ctp}/member/memberNewPassword',
    		/* async : false, */
    		type : "post",
    		data : {mid : mid},
    		success : function(res){
    			code = res;
    			alert(code);
    			$(".emailS").removeClass('change');
    			$(".loading").removeClass('change');
    		    $(".codeV").addClass('change');
    		    $(".code").addClass('change');

    		},
    		error : function(){
    			alert("전송오류");
    			
    		}
    		
    	});
        
    }
    	
    function codeV(){ 	
    	
    	let codeInput = $("#codeInput").val();
    	if(code != codeInput){
    		alert("<spring:message code='incorrectcode'/>");
    		return false;
    	}
    	
    	$(".code").removeClass('change');
        $(".fpw").addClass('change');
        $(".codeV").removeClass('change');
        
    }

</script>
</body>
</html>