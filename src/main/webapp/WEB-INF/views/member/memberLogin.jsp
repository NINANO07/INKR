<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				pageContext.setAttribute("cMid", cookies[i].getValue());
				break;
			}
		}
	}
%> 

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
             <form name="loginForm" method="post" >
                 <div class="fid" style="margin-top:100px;">
                     <input type="text" id="fid" name="mid" value="${cMid}" placeholder="<spring:message code='id'/>" required/>
                     <div class="v-msg">&nbsp;</div>
                 	<div class="err-msg"></div>
                 	
                     
                 </div>
                 <div class="fpw">
                     <input type="password" id="fpw" name="pwd" placeholder="<spring:message code='pwd'/>" required />
                     <div class="pv-msg">&nbsp;</div>
                     <div class="perr-msg"></div>
                 </div>
                 <button type="button" class="loginbtn" onclick="mainPage()"><b><spring:message code="nav.login"/></b></button>
                 <div class="resetBtn">
                     <button type="button" class="cancelbtn" onclick="msgClear()"><spring:message code="login.reset"/></button>
                 </div>
              <div style="transform: translateY(-100%); display:inline-block"><input type="checkbox" name="idSave" <c:if test="${cMid != null}">checked</c:if>>&nbsp;&nbsp;<spring:message code="login.remember"/></div>
             </form>
             <div>
                 <div class="pwdFind"><a href="${ctp}/member/memberPwdFind"><spring:message code="login.forgot"/></a></div>
                 <div class="signUp"><spring:message code="login.noid"/> <a href="${ctp}/member/memberJoin">&nbsp;<spring:message code="login.create"/></a></div> 
             </div>
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
     
    document.addEventListener('DOMContentLoaded', function(){
    	

        const fid = document.getElementById('fid');
        const fpw = document.getElementById('fpw');

        fid.addEventListener('input', function(){
            let input = fid.value.trim();

            const err_msg = document.querySelector('.err-msg');
            const v_msg = document.querySelector('.v-msg');

            if (input === '') {
                v_msg.innerText ='';
                err_msg.innerText = '<spring:message code="login.id"/>';
                idV = false;

            } else if (input.indexOf(' ') !== -1) {
                v_msg.innerText ='';
                err_msg.innerText = '<spring:message code="login.invalid"/>';
                idV = false;

            } else if (!regMid.test(input)) {
                v_msg.innerText ='';
                err_msg.innerText = '<spring:message code="login.invalid"/>';
                idV = false;

            } else {
                v_msg.innerText = '<spring:message code="login.valid"/>';
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
                perr_msg.innerText = '<spring:message code="login.pwd"/>';
                pwV = false;

            } else if (input.indexOf(' ') !== -1) {
                pv_msg.innerText ='';
                perr_msg.innerText = '<spring:message code="login.invalid"/>';
                pwV = false;
            } else if (!regPwd.test(input)) {
            	pv_msg.innerText ='';
                perr_msg.innerText = '<spring:message code="login.invalid"/>';
                pwV = false;

            } else {
                pv_msg.innerText = '<spring:message code="login.valid"/>';
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
        if(pwV && idV){
        	loginForm.submit();
   
        } else if(!idV){
        	if(mid==""){
        		document.querySelector('.v-msg').innerText ='';
        		document.querySelector('.err-msg').innerText = '<spring:message code="login.id"/>';
                idV = false;
        	}
        	mid.focus;
        } else if(!pwV){
        	if(pwd==""){
        		document.querySelector('.pv-msg').innerText ='';
        		document.querySelector('.perr-msg').innerText = '<spring:message code="login.pwd"/>';
                pwV = false;
        	}
        	pwd.focus;
        }

    }

</script>
</body>
</html>