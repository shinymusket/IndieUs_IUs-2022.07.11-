<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 부여</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
 function getInfo(num) {
	 var objParams = {
				staff_num : num
		}
	 
	 $.post(
				"/ius/authority/get_authority_info",
				objParams,
				function(retVal) {
					$("#authorityInfo").text("");
					
					value = retVal.authorityInfo;		
					
					var master = "";
					var teacher = "";
					var dietitian = "";
					var facilities = "";
					var bus = "";
					var info = "";
					var event = "";
					var gallery = "";
					

					if (value.m == "Y") {
						master = "checked";
					};
					if (value.t == "Y") {
						teacher = "checked";
					};
					if (value.d == "Y") {
						dietitian = "checked";
					};
					if (value.f == "Y") {
						facilities = "checked";
					};
					if (value.s == "Y") {
						bus = "checked";
					};
					if (value.i == "Y") {
						info = "checked";
					};
					if (value.e == "Y") {
						event = "checked";
					};
					if (value.g == "Y") {
						gallery = "checked";
					};
					
					output = "<tr><th>권한</th><th>여부</th></tr>";
					output += "<tr><td>관리자</td>";
					output += "<td><input type='checkbox' id='master' "+ master + "></tr>";
					output += "<tr><td>교사</td>";
					output += "<td><input type='checkbox' id='teacher' "+ teacher + "></tr>";
					output += "<tr><td>급식</td>";
					output += "<td><input type='checkbox' id='dietitian' "+ dietitian +"></tr>";
					output += "<tr><td>시설</td>";
					output += "<td><input type='checkbox' id='facilities' "+ facilities +"></tr>";
					output += "<tr><td>셔틀버스</td>";
					output += "<td><input type='checkbox' id='bus' "+ bus +"></tr>";
					output += "<tr><td>안내사항</td>";
					output += "<td><input type='checkbox' id='info' "+ info +"></tr>";
					output += "<tr><td>행사 및 일정</td>";
					output += "<td><input type='checkbox' id='event' "+ event +"></tr>";
					output += "<tr><td>갤러리</td>";
					output += "<td><input type='checkbox' id='gallery' "+ gallery +"></tr>";
					output += "<tr><td colspan='2'><input type='button' value='등록' id='register'></td></tr>";
					
					$("#authorityInfo").html(output);
					
				}
					)
 }



$(function(){

		$("#master").change(function() {
		    if(this.checked) {
		       $("#teacher").checked;
		       $("#dietitian").checked;
		       $("#facilities").checked;
		       $("#bus").checked;
		       $("#info").checked;
		       $("#event").checked;
		       $("#gallery").checked;   
		    }
		});
		
	
}) 


	



</script>
</head>
<body>
	<h1>권한 부여</h1>
	<div id="btns">
		<input type="button" value="홈으로" onclick="location.href='../main/'">
		<input type="button" value="교직원 관리" onclick="location.href='../staff/staff_list'">
	</div>
	
	<table id="staffInfo" border="1" style="float: left;">
		<tr>
			<th>교직원 코드</th>
			<th>교직원 이름</th>
			<th>교직원 아이디</th>
			<th>직무</th>
		</tr>
		<c:if test="${staffList != null}">
			<c:forEach items="${staffList}" var="staff">
				<tr>
					<td>${staff.staff_num}</td>
					<td>${staff.staff_name}</td>
					<td><a href="javascript:getInfo(${staff.staff_num})">${staff.staff_id}</a></td>
					<td>${staff.job_Kname}</td>
				</tr>
			</c:forEach>
		</c:if>	
	</table>
	<table id="authorityInfo" border="1" style="float: left;"></table>
</body>
</html>