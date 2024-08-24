<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
let socket;

$(document).ready(function(){
	let ws;
	
	//ws = new SockJS('http://49.142.157.251:9090/javaclassS10/notification');
	ws = new SockJS('http://localhost:9090/javaclassS10/notification');
	socket = ws;
	
	ws.onopen = function() {
		console.log('open');
 
 	};

	ws.onmessage = function(event) {
		
		console.log("onmessage"+event.data);	
		let ntf = JSON.parse(event.data);
		
		let message = ntf.fromMid;
		if(ntf.sort =='like') {
			if(ntf.section == 'bookclub'){
				$("#n_g").css('display','none');
				$("#n_imo").css('display','block');
			}
			else if(ntf.section == 'challenge'){
				$("#c_g").css('display','none');
				$("#c_imo").css('display','block');
			}

			message += "님이 게시글에 하트를 눌렀어요.";
		}
		else if(ntf.sort =='reply') {
			$("#n_g").css('display','none');
			message += "님이 게시글에 답변을 달았어요.";
			$("#n_reply").css('display','block');
		}
		else if(ntf.sort =='featured') {
			$("#n_g").css('display','none');
			message += "님이 베스트답글로 선정했어요.";
			$("#n_f").css('display','block');
		}
		else if(ntf.sort == 'accept') {
			$("#m_g").css('display','none');
			message += "님 Meetup에 참여되셨습니다.";
			$("#m_imo").css('display','block');
		}

		$("#msg").text(message)
		if(ntf.section == 'bookclub') $("#to").attr("href", "${ctp}/"+ntf.section+"/bookclubAnswer/"+ntf.superIdx+"/"+ntf.reIdx);
		else if(ntf.section == 'challenge') $("#to").attr("href", "${ctp}/"+ntf.section+"/challengeLike/"+ntf.reIdx);
		else if(ntf.section == 'meetup') $("#to").attr("href", "${ctp}/"+ntf.section+"/meetupRoom/"+ntf.reIdx);
		
		
		$("#msg").text(message)
		$("#section").text("["+ntf.section+"]");
		$("#ntf").css('display','block');
		
		setTimeout(function(){
			/* $("#ntf").css('display','none');
			$("#n_f").css('display','none');
			$("#n_imo").css('display','none');
			$("#n_reply").css('display','none');
			$("#c_imo").css('display','none'); */
			
			$("#reloadSection").load(window.location.href + " #reloadSection");
	

		}, 3000); 

	};

	ws.onclose = function() {
	    console.log('close');
 	};
	
});

let vorFlag = null;
let vorSection = null;
let vorVos = true;

function toggleKey(flag) {
    let vos = true;
    let section = "";

    if (flag == 'B') {
        section = "bookclub";
        vos = ${empty ntfBVos};
    } else if (flag == 'C') {
        section = "challenge";
        vos = ${empty ntfCVos};
    } else if (flag == 'M') {
        section = "meetup";
        vos = ${empty ntfMVos};
    }
    
    
    $('.m' + flag).toggleClass("visible");

    if (vorFlag != null && vorFlag != flag) {
        $('.m' + vorFlag).removeClass("visible");
        if (!vorVos) {
            removeMsg(vorSection, flag);
        }
    } 
    
    
    if ($('.m' + flag).hasClass("visible")) {
        vorFlag = flag;
        vorSection = section;
        vorVos = vos;
    } else {
        vorFlag = null;
        vorSection = null;
        vorVos = true;

        if (!vos) removeMsg(section, "");
    }

    $("#to" + flag).click(function(event) {
        removeMsg(section, "");
    });

}

$(document).click(function(e) {
    let container = $(".nicon");
    let vContainer = $(".msg_toggle.visible");
    let msgLink = $(".msg_toggle");

    if (!container.is(e.target) && container.has(e.target).length === 0
    	&& !msgLink.is(e.target) && msgLink.has(e.target).length === 0		
    ) {
        let section = "";
        if (vContainer.hasClass('mB')) {
            section = "bookclub";
        } else if (vContainer.hasClass('mC')) {
            section = "challenge";
        } else if (vContainer.hasClass('mM')) {
            section = "meetup";
        }

        vContainer.removeClass("visible");
        if (!${empty ntfBVos} || !${empty ntfCVos} || !${empty ntfMVos}) {
        	removeMsg(section, "");
        }
    }
});



function removeMsg(section, flag) {
    $.ajax({
        url: "${ctp}/member/checked",
        type: "post",
        data: { mid: '${sMid}', section: section },
        success: function() {
        	
            $("#reloadSection").load(window.location.href + " #reloadSection", function() {
            	vorFlag = null;
                vorSection = null;
                vorVos = true;
                if (flag != "") {
                    toggleKey(flag);
                }
            });
        },
        error: function() {
            alert("전송오류!");
        }
    });
}
	
</script>
<style>
	*{
	    margin:0;
	    padding: 0;
	    box-sizing: border-box;
	    
	}

	.wrapper{
		position : relative;
		margin:65px 25px 15px 15px;
		min-height : calc(100vh - 65px);
		height : 100%;
		width : 100vw;	

	}


	.memberLeft {
		position: fixed;
/* 		flex-shrink : 0; */
		width : 220px;
		height: calc(100vh - 80px);
		display : flex;
		flex-direction : column;
		justify-content : space-between;
		gap :20px;
	}
	.ind {
		width : 100%;
		flex-shrink : 0;
		height : 330px;
		border-radius : 10px;
		border : 2px solid #f5c000;
		display: flex;
		flex-direction : column;
		align-items : center;
		justify-content : space-evenly;
	}
	.ad {
		position: relative;
		width : 100%;
		height : 280px;
		overflow: hidden;
		cursor:pointer;
		opacity :0.4;

	}
	
	.ad img{
		width :100%;
		height : 100%;
		animation : enlarge 4s infinite alternate;
	}
	
	@keyframes enlarge {
	    from {
	        transform:scale(1);
	    }
	    to {
	        transform:scale(1.2);
	    }
	}
	
	.memberRight {
		margin-left : 240px;
		margin-right :50px;
		width : calc(100vw - 290px);
		min-width : 500px;
		height : 100%;
		min-height : calc(100vh - 65px);
		display:flex;
		flex-direction:column;
		gap:20px;
	}
	
	footer{
		background-color: white;
		color : #333333;
	}
	
	footer .glyphicon {
	    color: #666666;
	}

	.ad p {
		position: absolute;
		margin-left :6px;
		font-weight : 500;
		font-size: 25px; 
		z-index :9;
		color: white;
	}
	.pro_pic {

		width :145px;
		height: 145px;
		overflow : hidden;
		border-radius : 50%;
	}

	.pro_pic img{
		width : 100%;
		height : 100%;
	}
	
	.pro_txt {
		width :170px;
	}
	
	.level {
		display : flex;
		gap:10px;
		justify-content:right;
	}
	.pro_txt h5{
		font-size:20px; 
		font-weight : 600;
	}
	.pro_txt h6{
		font-size:14px; 
		font-weight:600;
	}

	.level span{
		margin : 0;
		padding : 0;
		font-size : 22px;
	}
	
	#bk_imo iconify-icon, #ch_imo iconify-icon, #me_imo iconify-icon{
		margin : 0;
		padding : 0;
		font-size : 16px;
		color : #fc8eac;
		position : absolute;
		top:194px;
		left : 121px;	
	}
	
	#ch_imo iconify-icon {
		left :154px;
	}
	
	#me_imo iconify-icon {
		left :187px;
	}

	#ntf {
		position : absolute;
		top :240px;
		background-color : #1c1c1c;
		color : #fff4c0;
		padding : 10px 10px;
		margin:5px;
		border-radius : 10px;
		white-space: normal;
	}
	
	#ntf a, .msg_toggle a, .ind a{
		all : unset;
	}
	#ntf a:hover, .msg_toggle a:hover, .ind a:hover{ 
		all :unset;
		cursor:pointer;
	}
	
	.msg_toggle {
		width : 210px;
		min-height : 70px;
		max-height : 500px;
		background-color : #1c1c1c;
		position : absolute;
		top : 230px;
		border-radius : 10px;
		padding : 10px 12px;
		color : #fff4c0;
		margin :0 5px;
		white-space: normal;
		z-index: 99;
		overflow : overlay;
		display : none;
	}
	
	.msg_toggle::-webkit-scrollbar { 
	    display: none;  /* Safari and Chrome */
	}
	.msg_toggle span, #ntf span {
		font-size : 15px;
		font-family: "Orbit", sans-serif;
		font-weight : 500;
		
	}
	
	.msg_toggle hr {
		border : 1px dashed #808080;
	}
	
	#ntf #section, .section{
		font-weight : 500;
		font-size : 17px;
		color : #f5c000;
	}
	
	.msg_toggle hr {
		margin: 5px 0;

	}
	.bell{
		padding: 2px 5px;
		background-color : #f5c000;
		color : #1c1c1c;
		border-radius : 5px;
		font-family: "Orbit", sans-serif;
		font-weight : 500;
		margin-bottom : 5px;
	}

	
	.visible {
		display : block;
	}
	
	.level .bi{
		cursor : pointer;
	}

</style>


<div class="memberLeft">
	<div class="ind">
		<div class="pro_pic">
			<img src="${ctp}/member/${member.photo}"  alt="member_pic"/>
		</div>
		<div class="pro_txt">
			<div class="level">
				<span style="color :<c:if test="${member.levelB == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
				<c:if test="${member.levelB == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
				<c:if test="${member.levelB == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
				<c:if test="${member.levelB == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
				<i class="bi bi-distribute-horizontal nicon" onclick="toggleKey('B')"></i></span>
				<span style="color :<c:if test="${member.levelC == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
				<c:if test="${member.levelC == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
				<c:if test="${member.levelC == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
				<c:if test="${member.levelC == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
				<i class="bi bi-grid-3x3-gap nicon" onclick="toggleKey('C')"></i></span>
				<span style="color :<c:if test="${member.levelM == 0}">#2ecf03; text-shadow:1px 1px #a9ddd9</c:if> 
				<c:if test="${member.levelM == 1}">#15b2d3; text-shadow:1px 1px #a9ddd9</c:if> 
				<c:if test="${member.levelM == 2}">#fd673a; text-shadow:1px 1px #fd9475</c:if> 
				<c:if test="${member.levelM == 3}">#ffba01; text-shadow:1px 1px #ffc733</c:if>">
				<i class="bi bi-command nicon"  onclick="toggleKey('M')"></i></span>
				
			</div>
			<h5 style="color:#1c1c1c"><a href ="${ctp}/member/memberPage/${sMid}"><spring:message code='left.hi'/>&nbsp; ${member.firstName}.</a></h5>

			<h6 style="color:#6F9FD8"><iconify-icon icon="mdi:alphabet-p-box-outline" width="20" height="20"></iconify-icon> ${member.point}</h6>
			
		</div>
	</div>
	<div id=reloadSection>
	<div id="ntf" style="display:none;"  ><a id="to"><span id="section"></span>&nbsp;&nbsp;<span id="msg"></span></a></div>
	<div id="bk_imo">
		<div id="n_imo" style="display:none;"><iconify-icon icon="line-md:heart-filled"></iconify-icon></div>
		<div id="n_reply" style="display:none;"><iconify-icon icon="line-md:chat-twotone"></iconify-icon></div>
		<div id="n_f" style="display:none;"><iconify-icon icon="line-md:star-pulsating-filled-loop"></iconify-icon></div>
		<c:if test="${!empty ntfBVos}"><div id="n_g"><iconify-icon icon="codicon:circle-filled"></iconify-icon></div>
		</c:if>
	</div>
	<div id="ch_imo">
		<div id="c_imo" style="display:none;"><iconify-icon icon="line-md:heart-filled"></iconify-icon></div>
		<c:if test="${!empty ntfCVos}"><div id="c_g"><iconify-icon icon="codicon:circle-filled"></iconify-icon></div>
		</c:if>
	</div>
	<div id="me_imo">
		<div id="m_imo" style="display:none;"><iconify-icon icon="line-md:mastodon-twotone"></iconify-icon></div>
		<c:if test="${!empty ntfMVos}"><div id="m_g"><iconify-icon icon="codicon:circle-filled"></iconify-icon></div>
		</c:if>
	</div>
	<div class="msg_toggle mB">
		<div class="bell"><iconify-icon icon="line-md:bell-twotone-loop"></iconify-icon>&nbsp;&nbsp;&nbsp;&nbsp;BOOKCLUB
		</div>
		
		<c:if test="${empty ntfBVos}"><span>새로운 알림이 없습니다.</span></c:if>
		<c:if test="${!empty ntfBVos}">
			<c:forEach var="fo" items="${ntfBVos}" varStatus="st">
				<a id="toB" href ="${ctp}/${fo.section}/bookclubAnswer/${fo.superIdx}/${fo.reIdx}"><span class="section">${fo.fromMid}</span>
				<span>님이
					<c:if test="${fo.sort == 'like'}">게시글에 하트를 눌렀어요.</c:if>
				 	<c:if test="${fo.sort == 'reply'}">게시글에 답변을 달았어요.</c:if>
					<c:if test="${fo.sort == 'featured'}"> 베스트답글로 선정했어요.</c:if>
				</span></a><c:if test="${!st.last}"><hr/></c:if>
			</c:forEach>
		
		</c:if>
	</div>
	<div class="msg_toggle mC">
		<div class="bell"><iconify-icon icon="line-md:bell-twotone-loop"></iconify-icon>&nbsp;&nbsp;&nbsp;CHALLENGE
		</div>
		
		<c:if test="${empty ntfCVos}"><span>새로운 알림이 없습니다.</span></c:if>
		<c:if test="${!empty ntfCVos}">
			<c:forEach var="fo" items="${ntfCVos}" varStatus="st">
				<a id="toC" href ="${ctp}/${fo.section}/challengeLike/${fo.reIdx}"><span class="section">${fo.fromMid}</span>
				<span>님이
					<c:if test="${fo.sort == 'like'}">게시글에 하트를 눌렀어요.</c:if>
				</span></a><c:if test="${!st.last}"><hr/></c:if>
			</c:forEach>
		
		</c:if>
	</div>
	<div class="msg_toggle mM">
		<div class="bell"><iconify-icon icon="line-md:bell-twotone-loop"></iconify-icon>&nbsp;&nbsp;&nbsp;&nbsp;MEET UP
		</div>
		
		<c:if test="${empty ntfMVos}"><span>새로운 알림이 없습니다.</span></c:if>
		<c:if test="${!empty ntfMVos}">
			<c:forEach var="fo" items="${ntfMVos}" varStatus="st">
				<a id="toM" href ="${ctp}/${fo.section}/meetupRoom/${fo.reIdx}"><span class="section">${fo.fromMid}</span>
				<span>님 
					<c:if test="${fo.sort == 'accept'}"> Meetup에 참여되었어요.</c:if>
				</span></a><c:if test="${!st.last}"><hr/></c:if>
			</c:forEach>
		
		</c:if>
	</div>
	</div>
	<div class="ad">
		<p>AD</p>
		<a href="https://sibf.or.kr/en/" target='_blank'><img src="${ctp}/images/ad.jpg" /></a>
	</div>
</div>