<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
	.board {
		width : calc(100% - 100px);
		margin : 0 30px;
	}
	
	.book_info {

		width :220px;
		white-space:wrap;
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
	
	.board select option {
		letter-spacing: 1.2px;
		font-weight: 400;
		font-size: 20px;
	}
	
	.board select {
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
	
	.add {
		text-align: left;
		height : 50px;
		margin-bottom:40px;
	}
	.add Button {

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
	
	.info_txt h3 {
		font-size :17px;
		color:#222222;
		font-weight : 600;
		text-shadow : 1px 1px 1px #f5c000;
	}
	
	.info_txt h4 {
		font-size :13px;
		font-weight : 600;
		font-style: italic;
		color:#636363;
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

	
	.modal-footer button{
		color : #1C1C1C; 
		font-weight:600; 
		font-size:18px; 
		letter-spacing:5px; 
		background-color:#FFC755;
		border : none;
		
	}
	
	button:focus{
	    outline:none !important;
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
	
	.list {
		margin-left: 20px;
		margin-top : 22px;
		display: flex;
	    flex-wrap: wrap;
	    gap: 20px;
		
	}
	.vocaList{
	    height: 18em;
	    width: 14em;
	    perspective: 37.5em;
	    margin : 30px;	
	}
	.card_list {
	    height:inherit;
	    width: inherit;
	    transform-style: preserve-3d;
	    transition: 1s;
	    background-color: #A7C7E7;
	    
	}
	.card_list:hover {
	    transform: rotateY(180deg);
	}
	
	.front, .back {
	    background-color: white ;
	    height: inherit;
	    width: inherit;
	    position: absolute;
	    border-radius: 1em;
	    backface-visibility: hidden;
	    white-space : pre-wrap; 
	    padding: 10px 20px;
	    display: flex;
	    flex-direction : column;
	    justify-content : space-evenly;
	    border-top-right-radius : 0;
	}
	
	.front h2, .back h2{
	    font-size: 2.2em;
	    font-weight: 100;
	    color : #212020;
	    text-shadow: 1px 2px #A7C7E7;
	    text-align: center;
	    margin :0;
	    font-family: "Kirang Haerang", system-ui;
	    
	}
	.front h3, .back h3 {
	    font-size: 1em;
	    font-weight: 700;
	    font-family: "Orbit", sans-serif;
	    letter-spacing : 0.1px;
	    text-align: center;
	    margin :0;
	}
	.front h6{
	    color: #a0a0a0;
	    font-weight: 500;
	    letter-spacing: 0.2em;
	    text-align: center;
	}
	.back {
	    transform: rotateY(180deg);
	}
	.iconfb {
		position : absolute;
		top :-10px;
		right : -2px;
		font-size: 23px;
		display:flex;
		flex-direction : column;
		cursor :pointer;
	}


	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<p><br/></p>
<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/left.jsp" />
	<div class="memberRight" style="flex-direction: row;">
		<div class="board">
			<div class="board_head"  >
				<select name="board_list" id="board_list" onchange="boardChange(${vo.idx})">
					<option value="qna">게시판</option>
					<option value="voca" selected>단어장</option>
				</select>
				<form name="wordForm" method="post">
				<div class="search_b">
					
					<select name="langChoose" id="langChoose" onchange="langChange('${vo.idx}')">
						<option value="1" ${langV =="1" ? "selected" : ""}>English</option>
				    	<option value="2" ${langV =="2" ? "selected" : ""}>日本語</option>
				    	<option value="3" ${langV =="3" ? "selected" : ""}>Français</option>
				    	<option value="4" ${langV =="4" ? "selected" : ""}>Español</option>
				    	<option value="5" ${langV =="5" ? "selected" : ""}>عربي</option>
				    	<option value="6" ${langV =="6" ? "selected" : ""}>Монгол</option>
				    	<option value="7" ${langV =="7" ? "selected" : ""}>Tiếng Việt</option>
				    	<option value="8" ${langV =="8" ? "selected" : ""}>แบบไทย</option>
				    	<option value="9" ${langV =="9" ? "selected" : ""}>Indonesia</option>
				    	<option value="10" ${langV =="10" ? "selected" : ""}>Русский</option>
				    	<option value="11" ${langV =="11" ? "selected" : ""}>中国語</option>
					</select>
					<input type="text" class="searchInput" name ="searchInput" id="searchInput">
					<button type="button" class="searchBtn" onclick="searcWord('${vo.idx}')">
						<i class="bi bi-search"></i>
					</button>
					
				</div>
				</form>
			</div>
			<div class="list" id="list">
				<c:if test="${!empty vos}" >
					<c:forEach var="vo" items="${vos}">
						<div class="vocaList">
					        <div class="card_list">
					            <div class="front">
					                <h2>${vo.word}</h2>	
					                <h3>${vo.definition}</h3>
					                <div class="iconfb">
					                	<c:if test="${!vo.marked}">
					                	<i class="bi bi-bookmark-star" style="color: #db5856;"></i>
					                	</c:if>
					                	<c:if test="${vo.marked}">
					                	<i class="bi bi-bookmark-star-fill" style="color: #db5856;"></i>
					                	</c:if>
					                	<c:if test="${vo.mid == sMid}">
					                	<i class="bi bi-file-earmark-person" style="color: #779ecb;"></i>
					                	</c:if>
					                </div>
					            </div>
					            <div class="back">
					            	<h2>${vo.transWord}</h2>
					            	<h3>${vo.transDfn}</h3>
					            	<div class="iconfb">
					                	<c:if test="${!vo.marked}">
					                	<i class="bi bi-bookmark-star" style="color: #db5856;" onclick="bookmark('${vo.idx}','${vo.clubIdx}','${sMid}')"></i>
					                	</c:if>
					                	<c:if test="${vo.marked}">
					                	<i class="bi bi-bookmark-star-fill" style="color: #db5856;" onclick="bookmarkNo('${vo.idx}','${sMid}')"></i>
					                	</c:if>
					                	<c:if test="${vo.mid == sMid}">
					                	<i class="bi bi-trash" style="color: #779ecb;" onclick="deleteVoca('${vo.idx}')"></i>
					                	</c:if>
					                </div>
					            </div>
					        </div>
					    </div>
					 </c:forEach>
				 </c:if>
			</div>
		</div>
		<div class="book_info">
			<div class="add"><button type="button" data-toggle="modal" data-target="#myModal" >ADD</button></div>
			<jsp:include page="/WEB-INF/views/include/bookclubinfo.jsp" />
		</div>
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
				    <select id="srchTarget" style="border:none; " disabled>
				    	<option value="1" ${langV =="1" ? "selected" : ""}>English</option>
				    	<option value="2" ${langV =="2" ? "selected" : ""}>日本語</option>
				    	<option value="3" ${langV =="3" ? "selected" : ""}>Français</option>
				    	<option value="4" ${langV =="4" ? "selected" : ""}>Español</option>
				    	<option value="5" ${langV =="5" ? "selected" : ""}>عربي</option>
				    	<option value="6" ${langV =="6" ? "selected" : ""}>Монгол</option>
				    	<option value="7" ${langV =="7" ? "selected" : ""}>Tiếng Việt</option>
				    	<option value="8" ${langV =="8" ? "selected" : ""}>แบบไทย</option>
				    	<option value="9" ${langV =="9" ? "selected" : ""}>Indonesia</option>
				    	<option value="10" ${langV =="10" ? "selected" : ""}>Русский</option>
				    	<option value="11" ${langV =="11" ? "selected" : ""}>中国語</option>
				    </select>
				</div>
			  	<input type="text" class="form-control" id="inputText" oninput="searchBook()" />
			  	<input type="hidden"  id="clubIdx" value="${vo.idx}"/>
			  	<input type="hidden"  id="ssmid"  value="${sMid}"/>
		        <div class="input-group-addon toggleKey" style="cursor:pointer">
			            <i class="bi bi-keyboard"></i>
			    </div>
			</div>

			<div id="keyboard" >
				<jsp:include page="/WEB-INF/views/include/keyboard.jsp" />
			</div>
			<div id="demo" style="display:none; margin-top :15px;" ></div>
			
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

function boardChange(idx) {
	let board = $("#board_list").val();
	if(board=="qna") location.href = '${ctp}/bookclub/bookclubQnA/'+idx;
}

const key = '7ADC165934F714A934CD2C6FC150380E';


function searchBook() {

	let srchTarget = $("#srchTarget").val();
	
    let searchStr = $("#inputText").val().trim();

    let url = 'https://krdict.korean.go.kr/api/search?key='+key;
    url += '&part=word&translated=y&trans_lang='+srchTarget+'&q='+searchStr+'&start=';
    
    
    if (searchStr === "") {
        $("#demo").hide();
        return false;
    }
	

    
    fetchData(url, 1);
    $("#demo").show();

}

function fetchData(url, pageNum) {
	let target_lang = $('#srchTarget :selected').text();
	let target_lang_val = $('#srchTarget :selected').val();
    $.ajax({
        url: url+pageNum,    
        method: 'get',
        dataType: 'xml',
        success: function (item) {
            let word = "";
            let word_grade = "";
            let pos = "";
            let definition = "";
            let trans_word = "";
            let trans_dfn = "";

            let no = 0;
            let table = "<div class='table-responsive space' ><table class='table'><tr><th>NO</th><th>Korean</th><th>Grade</th><th>Pos</th><th>"+target_lang+"</th><tr>";
            
            let total = Math.min($(item).find("total").text(), 500);
            let pageSize = 10;
            let totalPages = Math.ceil(total / pageSize);
            let blockSize = 3;
            let curBlock = Math.floor((pageNum - 1) / blockSize);
            let lastBlock = Math.floor((totalPages - 1) / blockSize);
            
            $(item).find("item").each(function () {
      
   
                    no++;
                    word = $(this).find("word").text();
                    word_grade = $(this).find("word_grade").text();
                    pos = $(this).find("pos").text();
   
        			$(this).find("sense").each(function(){
        				if($(this).find("sense_order").text() == 1) {
        					trans_word = $(this).find("trans_word").text();
        					definition = $(this).find("definition").text();
        					trans_dfn = $(this).find("trans_dfn").text();
        				}
        			});


        			
        			
                    /* definition += $(this).find("definition").text(); */
              

                    table += "<tr><td>" + no + "</td><td class='word' style='cursor:pointer'>" + word + "</td><td class='word_grade'>" + word_grade + "</td><td class='pos'>" + pos + "</td><td class='trans_word'>"+trans_word+"</td>";
                    table += "<td class='definition' style='display:none'>"+definition+"</td><td class='target_lang_val' style='display:none'>"+target_lang_val+"</td><td class='trans_dfn' style='display:none'>"+trans_dfn+"</td></tr>";
                   
                
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

$(document).on('click', '.word', function(e) {
	let word = $(this).parent().find(".word").text();
	let word_grade =$(this).parent().find(".word_grade").text(); 
	let pos=$(this).parent().find(".pos").text(); 
	let definition=$(this).parent().find(".definition").text(); 
	let trans_word =$(this).parent().find(".trans_word").text(); 
	let trans_dfn=$(this).parent().find(".trans_dfn").text(); 
	let target_lang_val=$(this).parent().find(".target_lang_val").text(); 
	
	if(word.trim() == "" || trans_word.trim() =="" ){
		alert("invalid");
		return false;
	}
	
	let ans = confirm(word+"를 단어장에 추가하시겠습니까?");
	if(!ans){
		return false;
	}

	let clubIdx = $("#clubIdx").val();
	let mid = $("#ssmid").val();
	let query = {
		word : word,
		wordGrade : word_grade,
		pos : pos,
		definition : definition, 
		transWord : trans_word,
		transDfn : trans_dfn,
		language : target_lang_val,
		clubIdx : clubIdx,
		mid : mid
	}
	
	$.ajax({
		url : "${ctp}/bookclub/bookclubVocaCreate",
		type : "post",
		data : query,
		success : function(res){
			if(res == "0"){
				location.reload();
			}
			else {
				alert("이미 존재합니다.")
			}
		},
		error : function() {
			alert("전송오류");
		}
	});
});

function searcWord(idx){
	let searchStr = $("#searchInput").val();
	
	if(searchStr.trim() == ""){
		alert("검색어를 입력해주세요.");
		return false; 
	}
	
	wordForm.submit();
}

function init(){
	$("#keyboard").removeClass("vi");
	$("#inputText").val("");
	$("#demo").html("");
	$("#demo").hide();
}

function bookmark(vocaIdx, clubIdx, mid) {
	$.ajax({
		url : "${ctp}/bookclub/vocaBookMark",
		type : "post",
		data : {
			vocaIdx :vocaIdx, 
			clubIdx :clubIdx,
			mid:mid
			},
		success :function(){
			location.reload();
		},
		error : function(){
			alert("전송오류");
		}
	});
	
}
function bookmarkNo(vocaIdx, mid) {
	$.ajax({
		url : "${ctp}/bookclub/vocaBookMarkNo",
		type : "post",
		data : {vocaIdx :vocaIdx, mid:mid},
		success :function(){
			location.reload();
		},
		error : function(){
			alert("전송오류");
		}
	});
	
}

function deleteVoca(idx){
	let ans = confirm("정말 삭제하시겠습니까?");
	if(!ans) return false;
	
	$.ajax({
		url : "${ctp}/bookclub/vocaDelete",
		type : "post",
		data : {idx:idx},
		success :function(){
			location.reload();
		},
		error : function(){
			alert("전송오류");
		}
	});
	
}

function langChange(idx){
	let langV = $("#langChoose").val();
	location.href = "${ctp}/bookclub/bookclubVocaByLang?idx="+idx+"&langV="+langV;
}

$('#myModal').on('hidden.bs.modal', function (e) {
	init();
});

</script>
</body>
</html>