<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<script src="${ctp}/resources/js/carousel.js"></script>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp" />
	<jsp:include page="/WEB-INF/views/include/css.jsp" />
	
	<style>
	
	.space{
		white-space :wrap;
	}
	
	select:focus {
		  outline: none; 
	}
	.modal {
		z-index : 9999;
		width : 100%;
	}
	.modal-body {
		overflow-y: scroll;
		height : 550px;
	}
	
	#keyboard {
		display: none;
	}
	#keyboard.vi {
		display: block;
	}
	
	.book{
		width : 100%;
	
		display:flex;
		margin : 10px 50px 100px 20px;
	}


	.book .booktxt {
		width : 55%;
		white-space:wrap;
		display: flex;
		flex-direction : column;
		align-items:stretch;
		padding: 0 50px;
		overflow: hidden;
		flex :1;

	}
	
	.book .bookImg {
		display: flex;
		flex-direction : column;
		justify-content:center;
		flex :1;
	}
	.book .bookimg {
		position : absolute;
		width : 290px;
		height: auto;
		min-width : 140px;
		object-fit: cover;
		right : 18%;
		top :40px;
		opacity : 0.8;
		z-index : -10;

		
	}
	.book .bookimg img{
		width : 100%;
	}
	
	
	.book .createBtn {
		width : 45%;
		margin-left:-60px;
		margin-bottom:-230px;
	}
	.createBtn button {
		border-radius : 5px;
		border : none;
		background-color :#1C1C1C;
		color: #f5c000;
		font-size : 20px;
		padding : 3px 30px;
		font-family : "Orbit", sans-serif;
		margin-bottom:35px;
		margin-left:-20px;
		transform : rotate(-9deg);
		&:hover {
			background-color :#f5c000;
			color: #1C1C1C;
		
		}
		
	}

	
	h2{
		font-family: "Kirang Haerang", system-ui;
		text-shadow: 2px -3px #f5c000;
		font-size: 50px;
		transform : rotate(1deg);
	}
	h4{
		font-family: "Orbit", sans-serif;
		font-size: 22px;
		font-weight : 500;
		letter-spacing: -3px;
		transform : rotate(1deg);
	}
	.book h2:hover{
		transform : scale(1.08);

	}

	
	a:hover {
		text-decoration : none;
		
	}
	
	#createform { 
		width: 100%;
		white-space:wrap;
		display : none;
		display : flex;
		flex-direction : column;
		justify-content : center;
		align-items : space-around;
		gap :30px;
	}
	
	#myform {
		display:flex;
		justify-content : space-around;
		align-items : center;
		gap :15px;
	}

	.btxt {
		height:245px;
		display:flex;
		flex-direction : column;
		justify-content : baseline;
		gap:20px;
	}
		
	.myList{
		margin-top : 30px;
		margin-left : 20px;
		mig-height : 70vh;
	}
	.iwrapper {
		width: 1400px;
		position: relative;
		margin-left : 30px;
	}

	.iwrapper .carousel{
		display: grid;
		grid-auto-flow: column;
		grid-auto-columns: calc((100% / 4) - 12px);
		overflow-x: auto;
		scroll-snap-type: x mandatory;
		gap: 16px;
		border-radius: 8px;
		scroll-behavior: smooth;
		scrollbar-width: none;
		height: 480px; 
		}
		
	.carousel::-webkit-scrollbar {
		display: none;
	}
	.carousel.no-transition {
		scroll-behavior: auto;
	}
	.carousel.dragging {
		scroll-snap-type: none;
		scroll-behavior: auto;
	}
	.carousel.dragging .cardChart {
		cursor: grab;
		user-select: none;
	}
	.carousel :where(.cardChart, .chartImg) {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.carousel .cardChart {
		scroll-snap-align: start;
		height: 460px;
		padding : 25px 0;
		list-style: none;
		background: linear-gradient(135deg, rgba(255,255,255,0.2), rgba(255,255,255,0));
		backdrop-filter: blur(10px);
		--webkit-backdrop-filter: blur(10px);
		border: 1px solid rgba(255,255,255,0.25);
		border-bottom: 0;
		border-radius: 15px;
		box-shadow: 3px 3px 6px 3px rgba(0,0,0,0.2);
		cursor: pointer;
		padding-bottom: 15px;
		flex-direction: column;
		justify-content: flex-start;
		
		
	}
	.carousel .cardChart .chartImg {	
		height : 220px;
		flex:1.8;		
	}
	
	.carousel .cardChart .chartText {
		width : 100%;
		height: auto;
		white-space: wrap;
		padding : 20px 35px;
		flex:1.2;
	}
	.cardChart .chartImg img {
		max-width: 99%;
		max-height: 99%;
		width : auto;
		height : auto;
		object-fit: cover;
		border-radius: 8px;
	}
	  
	.list {
		display: flex;
	    flex-wrap: wrap;
	    gap: 20px;
	}
	.bookList{
	    height: 25em;
	    width: 18.75em;
	    perspective: 37.5em;
	    margin : 30px;
	    
	}
	
	.card_list {
	    height:inherit;
	    width: inherit;
	    transform-style: preserve-3d;
	    transition: 1s;
	    background-color: #6F9FD8;
	}
	.card_list:hover {
	    transform: rotateY(180deg);
	}
	
	.front, .back {
	    background-color: white ;
	    height: 99.5%;
	    width: 99.5%;
	    position: absolute;
	    border-radius: 1em;
	    backface-visibility: hidden;
	    border-top-left-radius : 0;
	    white-space:wrap;
	}
	
	.front img {
	    display: block;
	    margin: auto;
	    width: 8em;
	    height :10em;
	    border-radius: 1em;
	    margin:2em auto 1em auto;
	}
	
	.front h2, .front h3, .front h6 {
	    text-align: center;
	}
	.front h2, .chartText h2{
	    font-size: 1.6em;
	    font-weight: 300;
	    color : #5b5b5b;
	    text-shadow: 2px 2px #f6c7b3;
	}
	.chartText h2{text-shadow: 2px 2px #e1d3f8;}
	
	.chartText h2:hover{
		transform : rotate(-1deg);	
	}
	
	.front h3, .chartText h3 {
	    font-size: 1em;
	    font-weight: 700;
	    font-family: "Orbit", sans-serif;
	    letter-spacing : 0.1px;
	}
	.front h6{
	    color: #a0a0a0;
	    font-weight: 500;
	    letter-spacing: 0.2em;
	}
	.back {
	    transform: rotateY(180deg);
	}
	.back button {
	    position: absolute;
	    transform: translate(-50%, -50%);
	    left : 50%;
	    top : 50%;
	    width: 12.5em;
	    font-size:1.2em;
	    font-weight: 600;
	    background-color: #6F9FD8;
	    color: aliceblue;
	    border-radius: 0.5em;
	    padding: 1em;
	    cursor: pointer;
	    border: none;
	    outline: none;
	}
	span {
		font-size: 14px;
	    font-weight: 700;
	    font-family: "Orbit", sans-serif;
	    text-shadow: none;
	}
	
	.peng {
		font-size:23px;
		text-align :right;
		position : absolute;
		right : 10px;
		top :-2px;
		display:flex;
		flex-direction : column;
	}

	
	.listGroup {
		margin-top : 50px;
		margin-left :20px;
	}
	.listSearch {
		margin-left:30px;
		width : 90%;
		display: flex;
		justify-content : space-between;
		gap:20px;
		
	}
	
	.listGroup p, .myList p {
		margin: 10px 30px;
		font-family: "Gowun Batang", serif;
		font-weight : 800;
		font-size: 38px;
		color : #1c1c1c;
		text-shadow: 2px 2px #ffdc80;
	}

	.headTxt {
		align-items : center;
		display : flex;
		gap : 30px;

	}
	.headIcon {
		font-size: 26px;
		
	}
	.headIcon i {
		cursor : pointer;
	}
	</style>

	
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/left.jsp" />
	<div class="memberRight">
		<div class="book">
			<div class="booktxt">
				<h2 onclick="location.href='${ctp}/bookclub/bookclubList';">WE READ TOGETHER! </h2>
				<h4>Dive into the world of Korean books with us. Let's make learning Korean fun and share the joy of reading!  </h4>		
			</div>
			<div class=bookImg>
				<div class="bookimg">
					<img src="${ctp}/images/book.png"/>
				</div>
				<div class="createBtn">
					<button type="button" class="loginbtn emailS" data-toggle="modal" data-target="#myModal" onclick="init()" ><b>Create your book club</b></button>
				</div>	
			</div>
			
		</div>
		<div class="myList" id="myList" >
			<div class="headTxt">
				<p>My BookClub</p>
				<div class="headIcon">
					<i class="bi bi-bookmark-heart-fill" style="color:#779ecb; " onclick="location.href='${ctp}/bookclub/bookclubList?sort=marked';"></i>
					<i class="bi bi-file-earmark-person" style="color: #FAA0A0;" onclick="location.href='${ctp}/bookclub/bookclubList?sort=my';"></i>
					<i class="bi bi-arrow-clockwise" onclick="location.href='${ctp}/bookclub/bookclubList';"></i>
				</div>
			</div>
			<div class="iwrapper">
				<ul class="carousel" id="carousel">
					<c:if test="${!empty myVos}" >
					<c:forEach var="vo" items="${myVos}">
 					<li class="cardChart">
 						<div class="peng">
  							<c:if test="${!vo.marked}" ><i class="bi bi-bookmark-heart" style="color:#779ecb;" onclick="marked('${sMid}','${vo.idx}')"></i></c:if>
  							<c:if test="${vo.marked}" ><i class="bi bi-bookmark-heart-fill" style="color:#779ecb;" onclick="markedNo('${sMid}','${vo.idx}')"></i></c:if>
  							<c:if test="${vo.host == sMid}"><i class="bi bi-file-earmark-person" style="color: #FAA0A0;" onclick="location.href='${ctp}/bookclub/bookclubList?myclub=true';"></i></c:if>
  						</div>
  		            	<div class="chartImg">
  		            		<img src="${vo.cover}" draggable="false" />
  		            	</div>
  		            	<div class="chartText">
		            		<h2 onclick="location.href='${ctp}/bookclub/bookclubQnA/${vo.idx}';">${vo.title}<br/><c:if test="${vo.engTitle != null && vo.engTitle.trim() != ''}"><span>(${vo.engTitle})</span></c:if></h2>	
			                <h3>${vo.author}<br/>${vo.engAuthor}</h3>

 		            	</div>
  		            </li>
  		            </c:forEach>
  					</c:if>
  				</ul>
  			</div>
		</div>
		<c:if test="${!empty vos}" >
		<div class="listGroup">
			<p>새로운 북클럽을 둘러보세요.</p>
			<div class="listSearch">
				<div class="input-group input-group-lg" style="width: 94%;">
					<div class="input-group-addon " style="background-color:white">
					    <select style="border:none;" id="s_select">
					    	<option value="title">Title</option>
					    	<option value="author">Author</option>
					    	<option value="isbn">ISBN</option>
					    </select>
					</div>
				  	<input type="text" class="form-control" id="s_txt" style="height: 46.8px;"/>
			        <div class="input-group-addon" style="cursor:pointer; background-color:#EDF3FF;">
				            <i class="bi bi-search" onclick="searchClub('${sMid}')"></i>
				    </div>
				</div>
				<div class="headIcon">
					<i class="bi bi-sort-alpha-down" id="sce" onclick="sort('${sMid}','sce')"></i>
					<i class="bi bi-sort-alpha-down-alt" id="dsce"  style="display:none" onclick="sort('${sMid}','dsce')"></i>
					<i class="bi bi-arrow-clockwise" onclick="sort('${sMid}','all')"></i>
				</div>
			</div>
			<div class="list" id="list">
				<c:if test="${!empty vos}" >
					<c:forEach var="vo" items="${vos}">
						<div class="bookList">
					        <div class="card_list">
					            <div class="front">
					                <img src="${vo.cover}"/>
					                <h2>${vo.title}<br/><c:if test="${vo.engTitle != null && vo.engTitle.trim() != '' }"><span>(${vo.engTitle})</span></c:if></h2>	
					                <h3>${vo.author}<br/>${vo.engAuthor}</h3>
					            </div>
					            <div class="back">
					                <button onclick="location.href='${ctp}/bookclub/bookclubJoin/${vo.idx}';">JOIN</button>
					            </div>
					        </div>
					    </div>
					 </c:forEach>
				 </c:if>
			</div>
		</div>
		</c:if>
	</div>
	
	
</div>

<!-- modal -->
 <div class="modal fade" id="myModal"  >
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content"  >
      
        <!-- Modal Header -->
        <div class="modal-header" style="height:50px">
          <h5 class="modal-title" style="display:inline-block;">Search</h5>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body" >
        	<div class="input-group ">
				<div class="input-group-addon " style="background-color:white">
				    <select id="srchTarget" style="border:none; ">
				    	<option value="title">Title</option>
				    	<option value="author">Author</option>
				    	<option value="isbn">ISBN</option>
				    </select>
				</div>
			  	<input type="text" class="form-control" id="inputText" oninput="searchBook()" />
		        <div class="input-group-addon toggleKey" style="cursor:pointer">
			            <i class="bi bi-keyboard"></i>
			    </div>
			</div>

			<div id="keyboard" >
				<jsp:include page="/WEB-INF/views/include/keyboard.jsp" />
			</div>
			<div id="demo" style="display:none; margin-top :15px;" ></div>
			<div id="createform">
				<h3 id="createok" style="text-align : center; margin-top:40px;"></h3>
				<div  id="myform">
					<div>
						<img id="bcover" width ="180px" height="235px"/>
					</div>
					<div class="btxt">
						<h5 id="btitle"></h5>
						<h5 id="bauthor"></h5>
						<h5 id="bisbn"></h5>
					</div>
				</div>
			</div>
        </div>
		
        <!-- Modal footer -->
        <div class="modal-footer" style="height:65px; border : none">
          <button type="button" value="닫기" class="btn btn-warning" style="color : #1C1C1C; font-weight:600" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
<script>
'use strict';

const key = 'f389d9b143982cf6d19236e7a41e0de89d9a6696f7931d56d708fcb747d32092';

function searchBook() {
	
    $("#createform").hide();
    let srchTarget = $("#srchTarget").val();
    let searchStr = $("#inputText").val().trim();

    let url = '';
    if (srchTarget === 'isbn') {
        url = 'https://www.nl.go.kr/NL/search/openApi/search.do?key=' + key + '&category=도서&systemType=오프라인자료&detailSearch=true&isbnOp=isbn&isbnCode=' + searchStr+'&pageNum=';
    } else {
        url = 'https://www.nl.go.kr/NL/search/openApi/search.do?key=' + key + '&category=도서&systemType=오프라인자료&srchTarget=' + srchTarget + '&kwd=' + searchStr+'&pageNum=';
        
    }
    if (searchStr === "") {
        $("#demo").hide();
        return false;
    }

    fetchData(url, 1);
    $("#demo").show();
}

function fetchData(url, pageNum) {
    $.ajax({
        url: url+pageNum,    
        method: 'get',
        dataType: 'xml',
        success: function (item) {
            let title = "";
            let author = "";
            let isbn = "";
            let cover = "";
            let no = 0;
            let table = "<div class='table-responsive space' ><table class='table'><tr><th>NO</th><th>COVER</th><th>TITLE</th><th>AUTHOR</th><th>ISBN</th><tr>";
            
            let total = Math.min($(item).find("total").text(), 500);
            let pageSize = 10;
            let totalPages = Math.ceil(total / pageSize);
            let blockSize = 3;
            let curBlock = Math.floor((pageNum - 1) / blockSize);
            let lastBlock = Math.floor((totalPages - 1) / blockSize);
            
            $(item).find("item").each(function () {
                isbn = $(this).find("isbn").text();
                if ((isbn.substring(0, 5) == "97889" && isbn.length == 13) || (isbn.substring(0, 5) == "97911" && isbn.length == 13)) {
                    no++;
                    title = $(this).find("title_info").text();
                    cover = $(this).find("image_url").text();
                    if (!cover.includes(".jpg")) {
                        cover = '${ctp}/images/noimage.gif';
                    }
                    author = $(this).find("author_info").text().replace("지은이:", "");
                    table += "<tr><td>" + no + "</td><td><img src='" + cover + "' width='100px' height='142' /></td><td style='cursor:pointer' onclick='setBookInfo(\"" + title + "\", \"" + cover + "\", \"" + author + "\", \"" + isbn + "\")'>" + title + "</td><td>" + author + "</td><td>" + isbn + "</td></tr>";
                } else {
                    no++;
                    title = $(this).find("title_info").text();
                    cover = $(this).find("image_url").text();
                    if (!cover.includes(".jpg")) {
                        cover = '${ctp}/images/noimage.gif';
                    }
                    author = $(this).find("author_info").text().replace("지은이:", "");
                    table += "<tr><td>" + no + "</td><td><img src='" + cover + "' width='100px' height='142' /></td><td style='cursor:pointer' onclick='javascript:alert(\"관리자에게 문의하세요.\")'>" + title + "</td><td>" + author + "</td><td>" + isbn + "</td></tr>";
                }
            });

            table += ' <tr><td colspan="5" class="m-0 p-0"></td></tr>';
            table += '</table></div>';

            table += '<div class="text-center">';
            table += '<ul class="pagination pagination-sm justify-content-center" style="margin: 0; padding: 0;">';

            if (pageNum > 1) {
                table += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="fetchData(\'' + url + '\', 1); return false;">❮❮</a></li>';
            }

            if (curBlock > 0) {
                let prevBlockPage = curBlock * blockSize;
                table += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="fetchData(\'' + url + '\',' + prevBlockPage + '); return false;">❮</a></li>';
            }

            let startPage = curBlock * blockSize + 1;
            let endPage = Math.min((curBlock + 1) * blockSize, totalPages);

            for (let i = startPage; i <= endPage; i++) {
                if (i === pageNum) {
                    table += '<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="#">' + i + '</a></li>';
                } else {
                    table += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="fetchData(\'' + url + '\',' + i + '); return false;">' + i + '</a></li>';
                }
            }

            if (curBlock < lastBlock) {
                let nextBlockPage = (curBlock + 1) * blockSize + 1;
                table += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="fetchData(\'' + url + '\',' + nextBlockPage + '); return false;">❯</a></li>';
            }

            if (pageNum < totalPages) {
                table += '<li class="page-item"><a class="page-link text-secondary" href="#" onclick="fetchData(\'' + url + '\',' + totalPages + '); return false;">❯❯</a></li>';
            }

            table += '</ul></div>';

            $("#demo").html(table);
            
            const modalContent = document.querySelector('.modal-body'); 
            if (modalContent) {
                modalContent.scrollTop = 0;
            }
            
        },
        error: function () {
            alert("전송오류");
        }
    });
}


$(".toggleKey").on('click', function() {

	searchBook();
	$("#keyboard").toggleClass("vi");
	if ($("#keyboard").hasClass("vi")) {
		show_keyboard_layout(1);
		inputText_focus();
		
	}
	


});

function setBookInfo(title, cover, author,  isbn){
	let ans = confirm(title+"로 북클럽을 생성하시겠습니까?");
	if(!ans){
		return false;
	}

	let query = {
		title : title,
		cover : cover, 
		author : author,
		isbn : isbn
	}
	
	$.ajax({
		url : "${ctp}/bookclub/bookclubCreate",
		type : "post",
		data : query,
		success : function(res){
			if(res.isbn != "exist" ){
				$("#demo").hide();						
				$("#createok").text(" == 북클럽이 생성되었습니다. ==");
				$("#btitle").html("[Title] &nbsp; "+title+"<br/>"+res.engTitle);
				$("#bauthor").html("[Author]&nbsp;"+author+"<br/>"+res.engAuthor);
				$("#bisbn").html("[ISBN]&nbsp; "+isbn);
				$("#createform").show();
				$("#bcover").attr("src", res.cover);
				$('#myList').load(location.href+' #myList');
				$('#list').load(location.href+' #list');
			}
			else {
				$("#demo").hide();						
				$("#createok").text("이미 존재합니다.");
				$("#createform").show();
				$("#myform").hide();
			}
		},
		error : function() {
			alert("전송오류");
		}
	});
	
	
}


function init(){
	$("#keyboard").removeClass("vi");
	$("#inputText").val("");
	$("#demo").html("");
	$("#demo").hide();
	$("#createform").hide();
	$("#btitle").val("");
	
}


let myList = document.getElementById("myList");
let cardCnt = document.querySelectorAll(".cardChart").length;

let observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting && cardCnt >3) {

        	initializeCarousel();        	        
        } else {
			return;
        }
        
    });
}, {threshold :0.3});

observer.observe(myList);


history.scrollRestoration = "manual";

function marked(mid, idx){
	$.ajax({
		url : "${ctp}/bookclub/bookclubMarked",
		type : "post",
		data : {mid:mid, idx:idx},
		success : function(){
			location.reload();
		},
		error : function(){
			alert("전송오류");
		}
		
	});
	
}

function markedNo(mid, idx){
	$.ajax({
		url : "${ctp}/bookclub/bookclubMarkedNo",
		type : "post",
		data : {mid:mid, idx:idx},
		success : function(){
			location.reload();
		},
		error : function(){
			alert("전송오류");
		}
		
	});
	
}

function searchClub(mid) {
	let select = $("#s_select").val();
	let searchStr = $("#s_txt").val();
	if(searchStr.trim()==""){
		alert("검색어를 입력하세요");
		return;
	}
	
	let list ='';
	$.ajax({
		url :"${ctp}/bookclub/bookclubSearch",
		type :"post",
		data : {select:select , searchStr:searchStr, mid:mid},
		success : function(vo){
			if(vo.length != 0){
				for(let i= 0; i<vo.length; i++){	
					list += '<div class="bookList">';
					list += '<div class="card_list">';
					list += '<div class="front">';
					list += '<img src="'+vo[i].cover+'"/>';
					list += '<h2>'+vo[i].title+'<br/>';
					if(vo[i].engTitle != null && vo[i].engTitle.trim() != '') list += '<span>('+vo[i].engTitle+')</span></h2>';
					list += '<h3>'+vo[i].author+'<br/>'+vo[i].engAuthor+'</h3>';
					list += '</div>';
					list += '<div class="back">';
					list += '<button onclick="location.href=\'${ctp}/bookclub/bookclubJoin/${vo[i].idx}\';">JOIN</button>';
					list += '</div></div></div>';
					
				}
				$("#list").html(list);
			}
			else alert("검색결과가 없습니다.");
			
		},
		error : function(){
			alert("전송오류");
		}
	});
}

function sort(mid, sort) {
	$("#s_txt").val("");
	$("#s_select").val("title");
	if(sort == 'sce') {
		$("#sce").hide();	
		$("#dsce").show();	
	}
	
	if(sort == 'dsce') {
		$("#sce").show();	
		$("#dsce").hide();	
	}

	let list ='';
	$.ajax({
		url :"${ctp}/bookclub/bookclubSort",
		type :"post",
		data : {mid:mid, sort:sort},
		success : function(vo){
			if(vo.length != 0){
				for(let i= 0; i<vo.length; i++){	
					list += '<div class="bookList">';
					list += '<div class="card_list">';
					list += '<div class="front">';
					list += '<img src="'+vo[i].cover+'"/>';
					list += '<h2>'+vo[i].title+'<br/>';
					if(vo[i].engTitle != null && vo[i].engTitle.trim() != '') list += '<span>('+vo[i].engTitle+')</span></h2>';
					list += '<h3>'+vo[i].author+'<br/>'+vo[i].engAuthor+'</h3>';
					list += '</div>';
					list += '<div class="back">';
					list += '<button onclick="location.href=\'${ctp}/bookclub/bookclubJoin/${vo[i].idx}\';">JOIN</button>';
					list += '</div></div></div>';
					
				}
				$("#list").html(list);
			}
			else alert("검색결과가 없습니다.");
		},
		error : function(){
			alert("전송오류");
		}
	});
}
</script>
</body>
</html>