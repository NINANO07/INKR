 
 <style>
 body {

    font: 400 15px Lato, sans-serif;
    line-height: 1.8;
    color: #818181;
    margin:0;
    padding :0;
    overflow-x:hidden;
    white-space: nowrap;
  }
  

  
  h2 {
    font-size: 50px;
    text-transform: uppercase;
    color: #303030;
    font-weight: 600;
    margin-bottom: 30px;
  }
  h4 {
    font-size: 26px;
    line-height: 1.375em;
    color: #303030;
    font-weight: 400;
    margin-bottom: 30px;
  }  
  .jumbotron {
    background-color: #f5c000;
    color: #fff;
    padding: 100px 25px;
    font-family: Montserrat, sans-serif;
    margin:0;
  }
  .container-fluid {
    padding: 20px 50px;
  }
  
  
  .bg-grey {
    background-color: #f6f6f6;
  }
  .logo-small {
    color: #f5c000;
    font-size: 50px;
  }
  .logo {
    color: #f5c000;
    font-size: 200px;
  }
  .thumbnail {
    padding: 0 0 15px 0;
    border: none;
    border-radius: 0;
  }
  .thumbnail img {
    width: 100%;
    height: 100%;
    margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
    background-image: none;
    color: #f5c000;
  }
  .carousel-indicators li {
    border-color: #f5c000;
  }
  .carousel-indicators li.active {
    background-color: #f5c000;
  }
  .item h4 {
    font-size: 19px;
    line-height: 1.375em;
    font-weight: 400;
    font-style: italic;
    margin: 70px 0;
  }
  .item span {
    font-style: normal;
  }
  .panel {
    border: 1px solid #f5c000; 
    border-radius:0 !important;
    transition: box-shadow 0.5s;
  }
  .panel:hover {
    box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
    border: 1px solid #f5c000;
    background-color: #fff !important;
    color: #f5c000;
  }
  .panel-heading {
    color: #fff !important;
    background-color: #f5c000!important;
    padding: 25px;
    border-bottom: 1px solid transparent;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border-bottom-right-radius: 0px;
  }
  .panel-footer {
    background-color: white !important;
  }
  .panel-footer h3 {
    font-size: 32px;
  }
  .panel-footer h4 {
    color: #aaa;
    font-size: 14px;
  }
  .panel-footer .btn {
    margin: 15px 0;
    background-color: #f5c000;
    color: #fff;
  }
  .navbar {
    margin-bottom: 0;
    background-color: #f5c000;
    z-index: 9999;
    border: 0;
    font-weight : 700;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
  .navbar-brand {
	font-weight : 900;
	font-size :27px;
  }
  
  .navbar li a, .navbar .navbar-brand {
    color: #1C1C1C !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #f5c000!important;
    background-color: #1C1C1C !important;
  }
  .navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
  }
  
  .bg-main {
  	background-color: #f5c000;
    color: #fff;
  
  }
  
  footer {
  	background-color:#1c1c1c;
  }
  
  footer .glyphicon {
    font-size: 20px;
    margin-bottom: 20px;
    color: #f5c000;
  }
  .slideanim {visibility:hidden;}
  .slide {
    animation-name: slide;
    -webkit-animation-name: slide;
    animation-duration: 1s;
    -webkit-animation-duration:1s;
    visibility: visible;
  }
  
  .search-g {
  	margin:30px 100px;
  }
  
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
      width: 100%;
      margin-bottom: 35px;
    }    
    
   
    .search-g {
    	margin:30px 10px;
    }
       
    body{
    	white-space : wrap;
    }
    
  }
  @media screen and (max-width: 480px) {
    .logo {
      font-size: 150px;
    }
    
    .main-txt {
    	margin-left:20px;   
    	font-size :40px; 	
    }
    
    .search-g {
    	margin:30px 10px;
    }

  }
  </style>