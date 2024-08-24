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
	
	.space{
		white-space :wrap;
	}
	
	select:focus {
		  outline: none; /* Remove default arrow */
   
	
	
	}
	
		
	</style>
	<script>
		'use strict';
		function searchBook() {
			let key = 'f389d9b143982cf6d19236e7a41e0de89d9a6696f7931d56d708fcb747d32092';
			let url = 'https://www.nl.go.kr/NL/search/openApi/search.do?key='+key+'&category=도서&systemType=온라인자료&Search=true&kwd='
			let searchStr =$("#inputText").val().trim();
			url += searchStr+'&f1=title&v1='+searchStr;
			
			if(searchStr ==""){
				$("#demo").hide();
				return false;
			}
			$("#demo").show();
			$.ajax({
				url :url,
				method :'get',
				dataType :'xml',
				success: function(item){
					let title ="";
					let author ="";
					let isbn ="";
					let cover ="";
					let no = 0;
					alert($(item).find("total"));
					let table = "<div class='table-responsive space'><table class='table'><tr><th>NO</th><th>COVER</th><th>TITLE</th><th>AUTHOR</th><th>ISBN</th><tr>";
					$(item).find("item").each(function(){
					no++;
					title = $(this).find("title_info").text();
					cover = $(this).find("image_url").text();
					if(!cover.includes(".jpg")){
						cover = '${ctp}/images/noimage.gif';
					}
					author = $(this).find("author_info").text();
					isbn = $(this).find("isbn").text();
					table += "<tr><td>"+no+"</td><td><img src='"+cover+"' width='100px' height='142' /></td><td style='cursor:pointer' onclick='setBookInfo(\"" + title + "\", \"" + cover + "\", \"" + author + "\", \"" + isbn + "\")'>"+title+"</td><td>"+author+"</td><td>"+isbn+"</td></tr>";
					
					
				})
				table+= "</table></div>"
				$("#demo").html(table);

				},error :function(){
					alert("전송오류")
				}
				
				
				
			});
		}
		
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<div class="wrapper">
	<jsp:include page="/WEB-INF/views/include/left.jsp" />
	<div class="memberRight">
		<div class="input-group mt-3 mb-3">
			<div class="input-group-addon" style="background-color:white">
			    <select class="input-group" style="border:none; font-size:22px;">
			    	<option>Title</option>
			    	<option>Author</option>
			    	<option>ISBN</option>
			    </select>
			</div>
		  	<input type="text" class="form-control input-lg" id="inputText" onInput="searchBook()" >
		</div>

		<div id="demo" style="display:none"></div>
	</div>
	
	
	
</div>
<jsp:include page="/WEB-INF/views/include/keyboard.jsp" />
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>