<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function getList() {
	$.ajax({
		url : "/ius/kinder/get_kinder_list",
		type : "POST",
		data : {
			
		},
		success: function(data) {
			$("#kinderList").text("");
			values = data.kinderList;
			output = "<tr><th>원아 번호</th><th>셔틀 버스 호차</th><th>담임 교사</th><th>원아 이름</th><th>나이</th><th>생년 월일</th><th>성별</th></tr>";				
			$.each(values, function(index, value) {
				
				
				output += "<tr>";
				output += "<td>" + value.kinder_num + "</td>";
				output += "<td>" + value.shuttle_carNum + "</td>";
				output += "<td>" + value.staff_name + "</td>";
				output += "<td><a href='../kinder/kinder_info?kinder_num=" + value.kinder_num + "'>" + value.kinder_name + "</a></td>";
				output += "<td>" + value.kinder_age + "</td>";
				output += "<td>" + value.kinder_birth + "</td>";
				output += "<td>" + value.kinder_sex + "</td>";
				output += "</tr>";
			});
			
			$("#kinderList").html(output);
		}
		
	})
	
}
getList();
</script>
<title>원생 관리</title>
</head>
<body>
	<h1>원생 관리</h1>
	<div class="btns">
		<input type="button" value="홈으로" onclick="location.href='../main/'">
		<input type="button" value="원생 등록" onclick="location.href='../kinder/kinder_register_form'">
	</div>
	<select id="searchType">
		<option>원생 번호</option>
		<option>담임 교사</option>
		<option>이름</option>
		<option>셔틀 버스 호차</option>
	</select>
	<input type="button" value="검색" id="search">
	
	<table id="kinderList" border="1"></table>
</body>
</html>