<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
function addComma(value){
	result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
    return result;
};

function getList() {
	$.ajax({
		url : "/ius/staff/get_staff_list",
		type : "POST",
		data : {
			
		},
		success: function(data) {
			$("#staffList").text("");			

			values = data.staffList;
			output = "<tr><th>교직원 코드</th><th>구분</th><th>아이디</th><th>이름</th><th>성별</th><th>나이</th><th>생년월일</th><th>주소</th><th>우편번호</th><th>연락처</th><th>입사일</th><th>퇴사일</th><th>재직여부</th><th>월급</th><th>이메일</th></tr>";				
			$.each(values, function(index, value) {
				
				output += "<tr>";
				output += "<td>" + value.staff_num + "</td>";
				output += "<td>" + value.job_Kname + "</td>";
				output += "<td>" + value.staff_id + "</td>";
				output += "<td><a href='./staff_info?staff_num=" + value.staff_num + "'>" + value.staff_name + "</a></td>";
				output += "<td>" + value.staff_sex + "</td>";
				output += "<td>" + value.staff_age + "</td>";
				output += "<td>" + value.staff_birth + "</td>";
				output += "<td>" + value.staff_addr + "</td>";
				output += "<td>" + value.staff_zipcode + "</td>";
				output += "<td>" + value.staff_tel + "</td>";
				output += "<td>" + value.staff_hireD + "</td>";
				output += "<td>" + value.staff_retireD + "</td>";
				output += "<td>" + value.staff_workYn + "</td>";			
				output += "<td>" + addComma(value.staff_salary) + "</td>";
				output += "<td>" + value.staff_email + "</td>";
				output += "</tr>";
			});
			
			$("#staffList").html(output);
		}
		
	})
	
}
getList();

	$(function(){
		$("#search").click(function(){
			var staff_name = $("#staff_name").val();
			var staff_workYn = $("#staff_workYn").val();
			var staff_cls = $("#staff_cls").val();
			
			$.ajax({
				url : "/ius/staff/search_staff_list",
				type : "POST",
				data : {
					staff_name : staff_name,
					staff_workYn : staff_workYn,
					staff_cls : staff_cls
				},
				success: function(data) {
					$("#staffList").text("");			

					values = data.staffList;
					output = "<tr><th>교직원 코드</th><th>구분</th><th>아이디</th><th>이름</th><th>성별</th><th>나이</th><th>생년월일</th><th>주소</th><th>우편번호</th><th>연락처</th><th>입사일</th><th>퇴사일</th><th>재직여부</th><th>월급</th><th>이메일</th></tr>";				
					$.each(values, function(index, value) {
						
						output += "<tr>";
						output += "<td>" + value.staff_num + "</td>";
						output += "<td>" + value.job_Kname + "</td>";
						output += "<td>" + value.staff_id + "</td>";
						output += "<td><a href='./staff_info?staff_num=" + value.staff_num + "'>" + value.staff_name + "</a></td>";
						output += "<td>" + value.staff_sex + "</td>";
						output += "<td>" + value.staff_age + "</td>";
						output += "<td>" + value.staff_birth + "</td>";
						output += "<td>" + value.staff_addr + "</td>";
						output += "<td>" + value.staff_zipcode + "</td>";
						output += "<td>" + value.staff_tel + "</td>";
						output += "<td>" + value.staff_hireD + "</td>";
						output += "<td>" + value.staff_retireD + "</td>";
						output += "<td>" + value.staff_workYn + "</td>";			
						output += "<td>" + addComma(value.staff_salary) + "</td>";
						output += "<td>" + value.staff_email + "</td>";
						output += "</tr>";
					});
					
					$("#staffList").html(output);
				}
				
			})
		});

})
</script>

<title>교직원 관리</title>
</head>
<body>
	<h1>교직원 관리</h1>
	<input type="button" value="홈으로" onclick="location.href='../main/'">
	<input type="button" value="교직원 등록" onclick="location.href='../staff/staff_register'">
	<input type="button" value="권한 관리" onclick="location.href='../authority/authority_edit'">
	<input type="button" value="근태 관리" onclick="location.href='../staff_attendance/attendance_list'">
	<div id="searchBar">
		이름<input type="text" id="staff_name" name="staff_name">
		상태
		<select id="staff_workYn" name="staff_workYn">
			<option value="Y" selected="selected">재직</option>
			<option value="P">휴직</option>
			<option value="N">퇴사</option>
		</select>
		직무
		<select id="staff_cls" name="staff_cls">
			<option value="" selected="selected">전체</option>
			<c:if test="${jobList != null}">
				<c:forEach items="${jobList}" var="job">
					<option value="${job.staff_cls}">${job.job_Kname}</option>
				</c:forEach>
			</c:if>
		</select>
		<input type="button" id="search" value="검색">
	</div>
	<table id="staffList" border="1" style="float:left;"></table>
	<table id="staffInfo" border="1" style="float:left;"></table>

</body>
</html>