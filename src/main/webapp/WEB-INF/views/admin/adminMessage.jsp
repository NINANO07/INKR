<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<jsp:include page="/WEB-INF/views/include/css.jsp" />
	<style>

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid transparent;
    border-radius: 0;
}
.mailbox-widget .custom-tab .nav-item .nav-link {
    border: 0;
    font-weight : 500;
    color: #1c1c1c;
    border-bottom: 3px solid transparent;
}
.mailbox-widget .custom-tab .nav-item .nav-link.active {
    background: 0 0;
    color: #fff;

}
.no-wrap td, .no-wrap th {
    white-space: nowrap;
}
.table td, .table th {
    padding: .9375rem .4rem;
    vertical-align: top;
    border-top: 1px solid rgba(120,130,140,.13);
}
.font-light {
    font-weight: 300;
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


.msgContainer {
  border-radius: 5px;
  background-color:#fcf9e6;
  padding: 20px;
  display : flex;
  flex-direction : column;
  margin : 20px;
  z-index : 999;
}

textarea {
	resize: none;
}
.tab-pane {
       display: none;
       height: 0;
}

.tab-pane.active {
    display: block;
    height: auto;
}
	
	
	</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/sideMenu.jsp" />

<section id="content">
<main>
  <div class="card">
    <div class="card-body bg-primary text-white mailbox-widget pb-0">
        <ul class="nav nav-tabs custom-tab border-bottom-0 mt-4" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link " id="inbox-tab" data-toggle="tab" aria-controls="inbox" href="#inbox" role="tab" aria-selected="true">
                    <span class="d-block d-md-none"><i class="ti-email"></i></span>
                    <span class="d-none d-md-block">받은메세지</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="sent-tab" data-toggle="tab" aria-controls="sent" href="#sent" role="tab" aria-selected="false">
                    <span class="d-block d-md-none"><i class="ti-export"></i></span>
                    <span class="d-none d-md-block">보낸메세지</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="send-tab" data-toggle="tab" aria-controls="send" href="#send" role="tab" aria-selected="false">
                    <span class="d-block d-md-none"><i class="ti-panel"></i></span>
                    <span class="d-none d-md-block">메세지쓰기</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="tab-content" id="myTabContent" style="margin:10px;">
        <!-- 받은메세지 탭 -->
        <div class="tab-pane fade active show" id="inbox" aria-labelledby="inbox-tab" role="tabpanel">
            <div>
                <!-- 메일 목록 -->
                <div class="table-responsive">
                    <table class="table email-table no-wrap table-hover v-middle mb-0 font-14">
                        <thead>
                            <tr>
                                <th>보낸이</th>
                                <th>메세지</th>
                                <th>보낸날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="vo" items="${invos}">
                                <tr>
                                    <td>${vo.fromMid}</td>
                                    <td width="70%" style = "word-break: break-all; white-space:normal">${vo.subject}</td>
                                    <td>${vo.sendDate.substring(0,10)}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- 보낸메세지 탭 -->
        <div class="tab-pane fade" id="sent" aria-labelledby="sent-tab" role="tabpanel">
            <div class="table-responsive">
                <table class="table email-table no-wrap table-hover v-middle mb-0 font-14">
                    <thead>
                        <tr>
                            <th>받는이</th>
                            <th>메세지</th>
                            <th>보낸날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="vo" items="${stvos}">
                            <tr>
                                <td>${vo.toMid}</td>
                                <td width="70%" style = "word-break: break-all; white-space:normal">${vo.subject}</td>
                                <td>${vo.sendDate.substring(0,10)}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- 메세지쓰기 탭 -->
        <div class="tab-pane fade" id="send" aria-labelledby="send-tab" role="tabpanel" style="z-index:9999">
            <div class="row p-3 text-dark">
                <form name="messageForm" method="post" action="${ctp}/admin/adminMessage">
                    <div class="msgContainer">
                        <label for="from">From</label>
                        <input type="text" id="from" name="fromMid" value="admin" readonly>
                        
                        <label for="to">TO</label>
                        <select name="toMid" id="to" style="z-index:9999">
                            <option value="all">전체메세지</option>
                            <c:forEach var="mem" items="${memvos}">
                                <option value="${mem.mid}">${mem.mid}</option>
                            </c:forEach>
                        </select>
                        
                        <label for="subject">Subject</label>
                        <textarea id="subject" name="subject" style="height:200px; z-index:999999" ></textarea>
                        <div class="text-right">
                			<button type="button" class="btn btn-warning" onclick="send()">보내기</button>
               			 </div>
                    </div>
                    
                </form>
                
            </div>
        </div>
    </div>
</div>
 
    </main>
</section>


<script>

$(document).ready(function() {

    $('#myTab a').on('click', function(e) {
        e.preventDefault();
        $(this).tab('show'); 

        $('#myTab .nav-item .nav-link').removeClass('active');
        
        $(this).addClass('active');
    });

    $('#myTab a[href="#inbox"]').tab('show');
});

function send(){
	let subject = $('#subject').val();
	if(subject.trim()==''){
		alert("내용을 입력하세요");
		return false;
	}
	
	messageForm.submit();
}


</script>
</body>
</html>