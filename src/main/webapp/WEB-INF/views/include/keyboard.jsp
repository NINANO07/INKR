<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>

	<script>
		Ko_type = '2-KSX5002';  // 한글 자판
		En_type = 'QWERTY';  // 영문 자판
		ohi_KBD_type = 'QWERTY';  // 기준 자판 (QWERTY, QWERTZ, AZERTY)
		ohi_KE = 'Ko';  // 시작할 때의 한·영 상태 (한글: Ko, 영문: En)
	</script>
	<script src="//ohi.pat.im/keyboard_layouts.js"> </script>
	<script src="${ctp}/resources/js/ohi.js"></script>
	<script>
		var ohi_menu_num = 1;
		function gotoTab(n) {
			ohi_menu_num = n;
			for(var i=1; i<=3; i++) {
				document.getElementById('menu'+i).className = (i==n) ? 'this' : 'menu';
				document.getElementById('tab'+i).style.height = (i==n) ? 'auto' : '1px';
				//document.getElementById('tab'+i).style.position = (i==n) ? '' : 'absolute';
				document.getElementById('tab'+i).style.overflow = (i==n) ? 'visible' : 'hidden';
				document.getElementById('tab'+i).style.visibility = (i==n) ? 'visible' : 'hidden';
			}
			document.getElementById('manual').style.display = (n!=3) ? 'block' : 'none';
			show_keyboard_layout();
		}
	
		function appendChild(parentNode,nodeName,className,idName,innerHTML,width,padding) {
			var childNode = document.createElement(nodeName);
				if(className) childNode.className = className;
				if(idName) childNode.id = idName;
				if(innerHTML) childNode.innerHTML = innerHTML;
				if(width) childNode.style.width = width;
				if(padding) childNode.style.padding = padding;
				parentNode.appendChild(childNode);
				return childNode;
		}
	
	</script>

	<style>
		#keyboardLayoutTable { clear:both; width:472px; margin:0 auto; }
		#keyboardLayoutTable .row { margin:0; line-height: 1; padding :0}

		div.e1, div.e2, div.e3, div.h1, div.h2, div.h3 {
			display:inline-block; font-size:12px; vertical-align:bottom; height:32px; cursor:pointer;
			border-width:2px; border-style:solid; border-color:#fff #aaa #aaa #fff;
		}

		div.e2 { background-color:#C5D2E7; }
		
		div.h1 { background-color:	#f5c000; margin:0; color:#1C1C1C;}
		div.h2 { background-color:#f5c000; margin:0; color:#1C1C1C;}
		div.gin-hol { background-color:#ccbbff; }
		div.h3 { background-color:lightgreen; }
		div.e1:hover, div.e2:hover, div.e3:hover, div.h1:hover, div.h2:hover, div.h3:hover { background-color:#EBF4FA; }
		div.e1:active, div.e2:active, div.e3:active, div.h1:active, div.h2:active, div.h3:active { 
			border-style:solid; border-width:2px; border-color:#aaa #fff #fff #aaa;
		}
		div.pressed { background-color: lightyellow; }


		div.down { margin:0 1px 0px 2px; }
		div.ue, div.de { clear:both; float:left; color:#777; }
		div.ue {margin-top:1px;}
		div.e2 div.ue { color:#000; }
		div.dh, div.uh { float:right; }

		div#row4 div.ue, div#row4 div.de { margin:0px auto; width:100%; text-align:center; }
		div#row4 #ue56 { text-align:left; }

		div#row4 .special div.ue, div#row4 .special div.de  { font-size:12px; /*font-family:consolas,'Courier New','맑은 고딕','Malgun Gothic','함초롬돋움','함초롬돋움 LVT','HCR Dotum LVT','Un Jamo Batang Ex','은 자모 바탕 확장'*/}

		span.menu, kbd.menu { cursor: pointer; background-color:bisque; }

		div.ref { padding:0.5em 0 0.5em 0; clear:both; }
		div.ref p { text-indent:-0.7em; padding:0 0 0 1em; margin:3px 0; }
		div.credit { font-family:Arial,sans-serif; font-size:10pt; color:RosyBrown; text-align:center; line-height:1.4em; }
		div.credit a { color:RosyBrown; text-decoration:none; font-weight:bold; }
		div.credit a:hover { text-decoration:underline; }
	</style>
	
			<div id="keyboardLayout"></div>
			


