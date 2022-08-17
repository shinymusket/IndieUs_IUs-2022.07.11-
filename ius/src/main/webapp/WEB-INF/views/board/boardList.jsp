<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자 결재</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

function getEworksList() {
	
	$.ajax({
		url : "/ius/board/get_eWorks_list",
		type : "POST",
		data : {},
		error: function(){alert("error");},
		success: function(data) {
			
			
			//결재완료문서 리스트 보여주기
			$("#eworkslist").text("");
			values = data.eworksBoardList;
			output = "<tr> <th>문서 번호</th> <th>문서 종류</th> <th>기안자</th> <th>문서 제목</th> <th>기 안 일</th> <th>결 재 일</th><th>결재</th> </tr>";				
			
			$.each(values, function(index, value) {
				output += "<tr>";
				output += "<td>" + value.workNum + "</td>";
				output += "<td>" + value.workCategory + "</td>";
				output += "<td>" + value.staff_name + "</td>";
				output += "<td>" + value.doc_Sub + "</td>";
				output += "<td>" + value.workUpDate + "</td>";
				output += "<td>" + value.workDownDate + "</td>";
				output += "<td>" + value.status+ "</td>";
				output += "</tr>";
				
			});
			$("#eworkslist").html(output);
			 
			
			
			// 구매신청서 불러오기
			$("#buyorderTbl").text("");
			values = data.buyBoardList;
			output = "<tr> <th>문서 번호</th> <th>문서 종류</th> <th>기 안 자</th> <th>문서 제목</th> <th>기 안 일</th> <th>결 재 상 태</th></tr>";
			
			$.each(values, function(index, value){
				output += "<tr>";
				output += "<td>" + value.workNum + "</td>";
				output += "<td>" + "구매신청서" + "</td>";
				output += "<td>" + value.staff_name + "</td>";
				output += "<td> <a href='../board/buy_info?workNum=" + value.workNum + "'>" + value.doc_Sub + "</a> </td>";
				output += "<td>" + value.workUpDate + "</td>";
				output += "<td>" + value.status + "</td>";
				output += "</tr>";
				
			}); 
			$("#buyorderTbl").html(output);
			
			
			
			
			// 지출결의서 불러오기
			
			$("#spendTbl").text("");
			values = data.spendBoardList;
			output = "<tr> <th>문서 번호</th> <th>문서 종류</th> <th>기 안 자</th> <th>문서 제목</th> <th>기 안 일</th> <th>결 재 상 태</th> </tr>";
			
			$.each(values, function(index, value){
				
				output += "<tr>";
				output += "<td>" + value.workNum + "</td>";
				output += "<td>" + "지출결의서" + "</td>";
				output += "<td>" + value.staff_name + "</td>";
				output += "<td> <a href='../board/spend_info?workNum=" + value.workNum + "'>" + value.doc_Sub + "</a> </td>";
				output += "<td>" + value.workUpDate + "</td>";
				output += "<td>" + value.status + "</td>";
				output += "</tr>";
				
			});	
			
			$("#spendTbl").html(output);
			
			// 휴가신청서 불러오기
		
			$("#vacationTbl").text("");
			values = data.vacationBoardList;
			output = "<tr> <th>문서 번호</th> <th>문서 종류</th> <th>기 안 자</th> <th>문서 제목</th> <th>기 안 일</th> <th>결 재 상 태</th> </tr>";
			
			$.each(values, function(index, value){
				output += "<tr>";
				output += "<td>" + value.workNum + "</td>";
				output += "<td>" + "연차신청서" + "</td>";
				output += "<td>" + value.staff_name + "</td>";
				output += "<td> <a href='../board/vacation_info?workNum=" + value.workNum + "'>" + value.doc_Sub + "</a> </td>";
				output += "<td>" + value.workUpDate + "</td>";
				output += "<td>" + value.status + "</td>";
				output += "</tr>";
			});			   
			
			$("#vacationTbl").html(output);
			
		}
		
	});
	
	
}

getEworksList();



</script>

</head>
<style>

	.mainDiv {
		border : 3px solid #cfd8dc;
		width : 1440px;
		height : 100%;
		float : left;
		margin : 10px; 
	}
	
	
	.mainDiv h1.title {
		text-align : center;
		line-height : 1.5;
		width : 100%;
		height : 30px;
		color : white;
		background-color : #486890;
	}
	
	.mainDiv h1.title:hover {
		color : blue;;
	}
	
	.contentDiv {
		margin : 30px 15px;
	}
	.contentDiv table{
 	 border-collapse: collapse;
 	 text-align: left;
 	 line-height: 1.5;


	}
	
	
	.contentDiv table th {
	  padding: 10px;
      font-weight: bold;
      vertical-align: top;
 	  color: #369;
 	  border-bottom: 3px solid #036;
 	
	}
	
	.contentDiv table td {
	width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
	
	}
	
	
	#eworkslist #notice_writeDate {
		text-align : right;
	}
	
	#eworkslist #notice_title_td a:hover {
		text-decoration: underline;
	}
	
		


.button{
margin: 1rem;
}

.button:hover {
  box-shadow: 0 0 0 18px transparent;
  -webkit-animation: pulse 1s;
          animation: pulse 1s;
          
}

 
	
	
</style>

<body>

<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
 
<article>
			<div id="title_bar">
				<p>경영 정보</p>
				<h3>전자 결재</h3>
			</div>
			<div id="title_top">
			</div>
				
			<section>
				<div id="content">
				
						<br>
						<div id="doc_drafting">
						
							
							<input type="button" class="button" value="홈으로" onclick="location.href=''../main/''">
							<input type="button" class="button" value="구매 신청서" onclick="location.href='../board/buy_draft_form'">
							<input type="button" class="button" value="지출 결의서" onclick="location.href='../board/spend_draft_form'">
							<input type="button" class="button" value="연차 신청서" onclick="location.href='../board/vacation_draft_form'">
						<br>
						<div class="mainDiv">
							<div class="contentDiv">
								<h3>결재완료 문서</h3>
								<br>
								<table border="1" id="eworkslist">
								</table>
							</div>
							<div class="contentDiv">
								<h3>구매신청서</h3>
								<br>
								<table border="1" id="buyorderTbl">
								</table>
							</div>
							<div class="contentDiv">
								<h3>지출결의서</h3>
								<br>
								<table border="1" id="spendTbl">
								</table>
							</div>
							<div class="contentDiv">
								<h3>연차신청서</h3>
								<br>
								<table border="1" id="vacationTbl">
								</table>
							</div>
						</div>	
					</div>
						
						
			<!--맨 밑에 닫는 거 잊지 마세용-->
				</div>

			</section>
			
	</article>
</body>
<%@include file="../include/footer.jsp" %>
</html>