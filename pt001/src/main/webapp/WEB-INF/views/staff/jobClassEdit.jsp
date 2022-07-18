<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직무 분류</title>
</head>
<body>
	<c:if test="${jobList != null}">
		<form action="" id="">
			<table>
				<tr>
					<th>한글명</th>
					<th>영문명</th>
				</tr>
				<c:forEach items="${jobList}" var="job">
					<tr>	
						<td>${job.job_Kname}</td>
						<td>${job.job_Ename}</td>
					</tr>
				</c:forEach>	
				<tr>
					<td>
						<input type="text" name="job_Kname" id="job_Kname" placeholder="직무 한글명">
					</td>
					<td>
						<input type="text" name="job_Ename" id="job_Ename" placeholder="직무 영문명">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록">
						<input type="button" value="수정">
						<input type="button" value="삭제">
					</td>
				</tr>
			</table>
		</form>
	</c:if>

</body>
</html>