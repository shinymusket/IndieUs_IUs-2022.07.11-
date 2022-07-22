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
	$(function(){
		function getInfo(num) {
			var objParams = {
					staff_num = num;
			}
			
			var values = [];
			
			$.post(
				"/ius/authority/get_authority_info",
				objParams,
				function(retVal) {
					$("#authorityInfo").text("");
					
					values = retVal.authorityInfo;
					
					output = "<tr><th>권한</th><th>여부</th></tr>"
					$.each(values, function(index, value) {
						output += "<tr><td>관리자</td>"
						output += "<td>+ +</td></tr>"
						
					});
					
					
				}
					)
		};
		
		
		
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