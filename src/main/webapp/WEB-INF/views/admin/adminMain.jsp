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
	#chart {
		width:100%; 
		margin: 0 auto; 
	}
	
	.truncate {
      white-space: nowrap;      
      overflow: hidden;      
      text-overflow: ellipsis; 
      max-width: 200px;    
    }
	
	</style>
	 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
    google.charts.load('current', {'packages':['line']});
    google.charts.setOnLoadCallback(drawChart);

  function drawChart() {

    var data = new google.visualization.DataTable();
    data.addColumn('date', 'Date');
    data.addColumn('number', 'Book Club');
    data.addColumn('number', 'Challenge');
    data.addColumn('number', 'Meet up');


    var bookClubData = ${bvos};
    var challengeData = ${cvos};
    var meetUpData = ${mvos};
    
    function aggregateCounts(data) {
        const aggregated = {};
        data.forEach(item => {
          const dateStr = item.createDate.substring(0, 10); // Extract the date part (YYYY-MM-DD)
          const dateObj = new Date(dateStr); // Convert to Date object
          if (!aggregated[dateStr]) {
            aggregated[dateStr] = 0;
          }
          aggregated[dateStr] += 1; // Increment count
        });
        return aggregated;
      }

      // Aggregate counts for each dataset
      const bookClubCounts = aggregateCounts(bookClubData);
      const challengeCounts = aggregateCounts(challengeData);
      const meetUpCounts = aggregateCounts(meetUpData);

      // Merge datasets into a single array
      const allDates = new Set([...Object.keys(bookClubCounts), ...Object.keys(challengeCounts), ...Object.keys(meetUpCounts)]);
      const mergedData = [];
      
      allDates.forEach(dateStr => {
        const dateObj = new Date(dateStr); // Convert to Date object
        mergedData.push([
          dateObj,
          bookClubCounts[dateStr] || 0,
          challengeCounts[dateStr] || 0,
          meetUpCounts[dateStr] || 0
        ]);
      });

      // Sort by date
      mergedData.sort((a, b) => a[0] - b[0]);

      data.addRows(mergedData);

      var options = {
        chart: {
          title: 'Activity Counts by Date',
          subtitle: 'Counts for Book Club, Challenge, and Meet up'
        },
        colors: ['#4285F4', '#F4B400', '#fd7238'],
        width: '100%',
        height: 400
      };

    var chart = new google.charts.Line(document.getElementById('linechart_material'));

    chart.draw(data, google.charts.Line.convertOptions(options));
  }
	
	</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/sideMenu.jsp" />

<section id="content">
	<main>
		<div class="head-title">
			<div class="left">
				<h1>Dashboard</h1>
				
			</div>

		</div>

		<ul class="box-info">
			<li>
				<i class='bx bx-book-reader'></i>
				<span class="text">
					<h3>${fn:length(bvos)}</h3>
					<p>Book Club</p>
				</span>
			</li>
			<li>
				<i class='bx bx-mobile-vibration' ></i>
				<span class="text">
					<h3>${fn:length(cvos)}</h3>
					<p>Challenge</p>
				</span>
			</li>
			<li>
				<i class='bx bxs-vector'></i>
				<span class="text">
					<h3>${fn:length(mvos)}</h3>
					<p>Meet Up</p>
				</span>
			</li>
		</ul>


		<div class="table-data">
			<div class="order">
				<div class="head">
					<h3>Activity</h3>
				</div>
				<div class="chart">
					<div id="linechart_material" >
					</div>
				</div>
			</div>
			<div class="todo">
				<div class="head">
					<h3>New Activity</h3>
				</div>
				<ul class="todo-list">
					<c:forEach var="vo" items="${bvos}" end="1">
					<li class="completed">
						<img src="${vo.cover}" width="50px"  height="50px"/>
						<div class="truncate">${vo.title}</div>
						<div>${vo.createDate.substring(0,10)}</div>
						
					</li>
					</c:forEach>
					<c:forEach var="vo" items="${mvos}" end="1">
					<li class="not-completed">
						<img src="${vo.firstimage}" width="50px"  height="50px"/>
						<div class="truncate">${vo.title}</div>
						<div>${vo.createDate.substring(0,10)}</div>
					</li>
					</c:forEach>
			
				</ul>
			</div>
		</div>
	</main>
</section>
</body>
</html>