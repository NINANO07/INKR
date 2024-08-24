<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page session="false" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
  <title>INKR</title>
  <%@ include file = "/WEB-INF/views/include/bs4.jsp" %>
  <%@ include file = "/WEB-INF/views/include/css.jsp" %>
  <style>
 
  
  .main-txt {
  	position : absolute;
  	white-space: nowrap;
  	font-size: 100px;
  	color : #1C1C1C;
  	/* font-family: "Caveat", sans-serif; */
  	font-weight : 900;
  	margin : 60px;
  	margin-left : 100px;
  	bottom : 20px;
 	transform : rotate(4deg);
 	transition: transform 0.3s ease;
 	line-height: 1.4;
  }
  
  
  #myPage svg {
  	position : absolute;
  	width : 100vw;
  	top :40%;
  	left : 50%;
  	transform : translate(-50%, -50%);
  	
  }
  
  #myPage svg .draw {
  	stroke-dasharray: 1617;
  	animation : draw 5s infinite linear alternate;
  }
  
  #about {
  	position:relative;
  	height : 100vh;
  	color: #f5c000;
  	background-color:#1C1C1C;
  	
  }
  
  .about-inkr {
  	position:absolute;
  	top:50%;
  	left:50%;
  	width:100%;
  	transform:translate(-50%, -50%);
  	display : flex;
  	align-items: center;
  	justify-content : space-evenly;
  
  }
  
  .korea-img {
  	width : 750px;
  	position: relative;	

  	margin : 50px;
  }

  .korea-img img {
  	width : 750px;
  	border-radius :20px;

  }
  
  .korea-txt {

  }
  .korea-txt h2, h4{
  	color: #f5c000;
  }
  
  .heart {
  	position : absolute;
	top :50%;
	left : 50%;
	transform : translate(-50%, -50%);
  }
  
  .heart svg{
  	stroke-dasharray: 281;
  	stroke-dashoffset : 281;
  }
  
  .drawh{
  	animation : draw1 3s linear forwards;
  }
  #k-now{
  	height : 100%;
  	min-height : 100vh;
  	background-color: #f5c000;
  
  }
  
  .chart img{
  	width : 80vw;
  	margin-top:10px;
  }
  
  #demo{
  	display: flex;
  	justify-content : center;


    
  }

  
  .iwrapper {
  width: 1400px;

  position: relative;
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
  height: 500px;
  
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
  height: 480px;
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
  text-align : left;
}
.carousel .cardChart .chartImg {
  
  width: 280px;
  height : 280px;
  
 
  flex :2;

}

.carousel .cardChart .chartText {
  border-radius: 8px;
  margin : 0 30px;
  flex:1;

}
.cardChart .chartImg img {
  max-width: 99%;
  max-height: 99%;
  width : auto;
  height : auto;
  object-fit: cover;
  border-radius: 8px;

}
.carousel .cardChart h3, h5 {
 	
    white-space: normal;
    font-weight : 900;
  }
  
.carousel .cardChart .chartText h3 {
	font-size: 18px;
	color : #141414;
  }
  
.carousel .cardChart .chartText h5 {
	font-size: 13px;
	color : #3b3b3b;
  }


 
  
  .bling-animation {
            animation: bling 2s linear;
            transition: transform 0.3s ease;
        }
        
  @keyframes bling {
      from {
          transform:rotate(3deg);
      }
      to {
          transform:rotate(0deg);
      }
  }
  
  
  @keyframes draw {
   0% {
 		stroke-dashoffset : 1617;
   
   }
   90%{
   
   	stroke-dashoffset : 0;
   }
  
  }
  
  @keyframes draw1 {
   to {
 		stroke-dashoffset : 0;
   }
  }
  
  
  @media screen and (max-width: 768px) {
  	.about-inkr {
  		flex-direction : column;
  	
  	}
  
  	.korea-img {
  	width : 90vw;

  }

  .korea-img img {
  	width : 90vw;


  }
  
  .korea-txt {
  	margin :10px;
  }
  
  .korea-txt h4{
  	font-size :22px;
  }
    
  .main-txt {
   	margin-left: 40px;
   	font-size :60px;
   }
   
   .iwrapper {
	  width: 400px;
	}
  
   
   .iwrapper .carousel{
	  grid-auto-columns: calc((100%) - 12px);
	  
	}
   
  
}

  
  </style>
  
  <script>
  	'use strict';
  	function getChart(){
  		let chart = $("#chart").val();
  		if(chart == ""){
  			$("#trendImg").show();
  			$("#demo").hide();
  			return;
  		}
  		
  		
  		$.ajax({
  			url : '${ctp}/',
  			type : 'post',
  			data : {chart : chart},
  			success : function(res){
  				$("#trendImg").hide();
  				
  				let card = '<div class="iwrapper"><ul class="carousel">';
  				let cnt =0;
  				for(let i = 0; i <res.length; i++){
  					cnt++;
  					card += '<li class="cardChart">';
  					card += '<h3 style="font-size:19px; color: #FF3B00">#'+cnt+'</h3>';
  		            card += '<div class="chartImg">';
  		            card += '<img src="'+res[i].img+'" draggable="false" /></div>';
  		            card += '<div class="chartText">';
  		          	if(res[i].tag){
		            	card += '<h5>'+res[i].tag+'</h5>';	
		            }
  		            card += '<h3>'+res[i].title+'</h3>';
  		            if(res[i].artist){
  		            	card += '<h5 style="text-align:center">'+res[i].artist+'</h5>';	
  		            }
  		            if(res[i].country){
  		            	card += '<h5 style="text-align:center">'+res[i].country+'</h5>';	
  		            }
  		            if(res[i].period){
  		            	card += '<h5>'+res[i].period+'</h5>';	
  		            }
  		            if(res[i].space){
  		            	card += '<h5>'+res[i].space+'</h5>';	
  		            }
  		            card += '</div></li>';
  	
  				}
  				card += '</ul></div>'
  				$("#demo").html(card);
  				
  				initializeCarousel();
  			},
  			error : function(){
  				alert("전송오류");
  			}
  			
  		});
  		
  	}
  
  </script>
  
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

<%@ include file = "/WEB-INF/views/include/nav.jsp" %>


<!-- Container (About Section) -->
<div  class="container-fluid bg-main" style="height:100vh; padding:0 ">


<svg id="eZ3zMVa5Dpu1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 883 282" shape-rendering="geometricPrecision" text-rendering="geometricPrecision">
<path class="draw" d="M-2.73657,90.55589C10.5846,73.90443,29.74325,64.55603,48.34607,56.80486c98.43116-41.01298,140.52783,37.32606,226.22314,52.90702c44.79897,8.14527,91.36041,6.49397,135.91632,14.59504c45.45121,8.26386,71.4226,36.25485,87.57025,76.62397c2.22318,5.55796,4.56095,12.320012,4.56095,19.15599c0,19.155992-8.81979,37.06346-20.98037,46.52169-45.05558,35.04322-106.98586-19.72203-71.15083-67.50207c61.89304-82.52404,198.01825-2.89471,276.3936-63.85331c10.2903-8.00356,10.62465-16.37988,15.50723-27.3657c24.57716-55.29863-32.315968-110.718572-77.53616-71.150817-7.29752,6.385344-7.297514,14.595041-7.297514,26.453513c0,6.02996,3.855544,16.729584,7.297514,21.892544c15.05785,22.58677,46.87383,43.19623,71.15083,52.90702c70.7216,28.28864,135.68188-.96439,191.55992-42.87293" 
fill="none" stroke="#1C1C1C" stroke-width="2.6"/>
</svg>
	<div class="main-txt">
		<div>Let's</div>
		<div>&nbsp;&nbsp;&nbsp;Get Connected</div>
	</div>
</div>

<div id="about" >
  <div class="about-inkr">
    <div class="slideanim korea-img">
      <span><img src="${ctp}/images/seouln.jpg"></span>
      <div class="heart">
  		<svg id="eJBiV4ZKr1u1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 120 120" shape-rendering="geometricPrecision" text-rendering="geometricPrecision" width="500" height="500">
	  		<path d="M322.62773,40.987c0-19.41432-29.70376-21.29138-40.21365-9.28007-17.05403,19.49032,8.17982,39.46191,17.78681,51.81375c2.14467,2.75744,9.64111,17.01347,13.14677,17.01347c10.70115,0,54.32602-50.85249,50.26707-71.14724-4.96529-24.82644-37.02557-6.03686-42.53367,7.7334" 
	  		transform="translate(-260.253418 1.099144)" fill="none" stroke="#f5c000" stroke-width="2.3"/>
  		</svg>
  	  </div>
    </div>
    <div class="korea-txt">
      <h2 class="korea-txt" id="inkrText" >IN KOREA</h2><br>
      <h4 class="korea-txt"><strong><spring:message code="home.first"/> 
    	<br/><spring:message code="home.second" />
      <br/><spring:message code="home.third" /></strong></h4>
    </div>
  </div>
 
</div>
<div id="k-now">
	
	<div class="jumbotron text-center">
	  <h1 style="color:#1c1c1c">K-NOW</h1> 
	  <p style="color:#1c1c1c">Trending Now : Stay updated with Korea's latest buzz.</p> 
	  <form name="myform" method="post">
	    <div class="input-group slideanim search-g" >
	      <select style="height:60px; font-size:20px" name="chart" id="chart" class="form-control" >	      
	      	<option value="">TRENDING NOW IN KOREA</option>
	      	<option value="news">[NEWS] MOST VIEWED</option>
	      	<option value="music">[MUSIC] DAILY TOP10</option>
	      	<option value="movie">[MOVIE] BOX OFFICE</option>
	      	<option value="event">[EVENT] DAILY BEST</option>
	      	<option value="tvshow">[TV-SHOW] MOST POPULAR</option>
	      </select>
	      <div class="input-group-btn">
	        <button type="button" style="height:60px; font-size:20px" class="btn btn-success" onclick="getChart()">SEARCH</button>
	      </div>
	    </div>
	  </form>
	  <div class="slideanim chart" id="trendImg">
			<img src="${ctp}/main/trend.png">
	  </div>
	  <div id="demo"></div>
	  
	</div>


</div>

<!-- Container (Contact Section) -->
<div id="contact" style="position:relative; height:calc(100vh - 117px)">
	<div style="position:absolute; width :80%; top:50%; left:50%; transform:translate(-50%, -50%)">
	  <h2 class="text-center" style="margin:50px">CONTACT</h2>
	  <div class="row">
	    <div class="col-sm-5">
	      <p>Contact us and we'll get back to you.</p>
	      <p><span class="glyphicon glyphicon-map-marker"></span> ChungJu, KOREA</p>
	      <p><span class="glyphicon glyphicon-phone"></span> +82 01048972384</p>
	      <p><span class="glyphicon glyphicon-envelope"></span> javask1121@gmail.com</p>
	    </div>
	    <div class="col-sm-7 slideanim">
	    	<form method="post" name="messageForm" action="${ctp}/member/memberGuest">
	      <div class="row">
	        <div class="col-sm-6 form-group">
	          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
	        </div>
	        <div class="col-sm-6 form-group">
	          <input class="form-control" id="phone" name="phone" placeholder="Phone" required>
	        </div>
	      </div>
	      <textarea class="form-control" id="subject" name="subject" placeholder="Comment" rows="5" required></textarea><br>
	      
	      <div class="row">
	        <div class="col-sm-12 form-group">
	          <button class="btn btn-success pull-right" type="submit" >SEND</button>
	        </div>
	      </div>
	      <input type="hidden" name="fromMid" value="guest">
	      <input type="hidden" name="toMid" value="admin">
	      </form>
	    </div>
	  </div>
  </div>
</div>


<%@ include file = "/WEB-INF/views/include/footer.jsp" %>

<script>


let mainTxt = document.querySelector(".main-txt");
window.addEventListener('scroll', function() {
    let scrollValue = window.scrollY;
    if(scrollValue>50 ){
        mainTxt.style.transform = 'rotate(0deg)';
    }
    else{
    	mainTxt.style.transform = 'rotate(4deg)';
    }

});

let about = document.querySelector("#about");
let ktxt2 = document.querySelector(".korea-txt h2");
let ktxt4 = document.querySelector(".korea-txt h4");
let heart = document.querySelector("#eJBiV4ZKr1u1");

let observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            about.style.backgroundColor ='#1c1c1c';
            ktxt2.style.color ='#f5c000';
            ktxt4.style.color ='#f5c000';
            heart.classList.add("drawh");
            typeAnimation(element, originalText, charsToRemove);
        
        } else {
        	about.style.backgroundColor ='#f5c000';
            ktxt2.style.color ='#1c1c1c';
            ktxt4.style.color ='#1c1c1c';
            heart.classList.remove("drawh");
            element.classList.remove("bling-animation");
            
        }
    });
}, {rootMargin: '0px 0px -80% 0px'});

observer.observe(about);

let know = document.querySelector("#k-now");
let kj = document.querySelector("#k-now .jumbotron");
let kh1 = document.querySelector("#k-now h1");
let kp = document.querySelector("#k-now p");


let observer2 = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
        	know.style.backgroundColor ='#f5c000';
        	kj.style.backgroundColor ='#f5c000';
        	kh1.style.color ='#1c1c1c';
        	kp.style.color ='#1c1c1c';
        
        } else {
            know.style.backgroundColor ='#1c1c1c';
            kj.style.backgroundColor ='#1c1c1c';
            kh1.style.color ='#f5c000';
            kp.style.color ='#f5c000';
        	
        }
    });
}, {rootMargin: '0px 0px -80% 0px'});

observer2.observe(know);


let contact = document.querySelector("#contact");
let ch1 = document.querySelector("#contact h2");


let observer3 = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            contact.style.backgroundColor = '#1c1c1c';
            ch1.style.color = '#f5c000';


        } else {
            contact.style.backgroundColor = '#f5c000';
            ch1.style.color = '#1c1c1c';
           
        }
    });
}, {rootMargin: '0px 0px -80% 0px'});

observer3.observe(contact);

const originalText = "IN KOREA ";
const charsToRemove = ["A", "E", "O", " "];
const element = document.querySelector("#inkrText");

function typeAnimation(element, text, charsToRemove, interval = 200) {
    let currentText = text.split("");
    let index = currentText.length-1;

    function updateText() {
        if (index >= 0) {
            if (charsToRemove.includes(currentText[index])) {
                currentText.splice(index, 1);
                element.textContent = currentText.join("");
                setTimeout(updateText, interval);
            } else {
                index--;
                setTimeout(updateText, interval);
            }
        }
        else{
        	
        	element.classList.add("bling-animation");
        }
    }

    updateText()
}

</script>

<script src="${ctp}/resources/js/carousel.js"></script>

</body>
</html>