<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function getList() {
		$.ajax({
			url : "/ius/parent/get_kinder_list",
			type : "POST",
			data : {
				
			},
			success: function(data) {
				$("#kinderList").text("");
				values = data.kinderList;
				output = "<tr><th>원생 이름</th><th>부 성명</th><th>모 성명</th></tr>";				
				$.each(values, function(index, value) {
		
					output += "<tr>";
					output += "<td><a href=\"javascript:view(" + value.kinder_num + ");\">" + value.kinder_name + "</a></td>";
					output += "<td>" + value.father_name + "</td>";
					output += "<td>" + value.mather_name + "</td>";
					output += "</tr>";
				});
				
				$("#kinderList").html(output);
			}
			
		})
		
	}
	getList();
	
</script>
<title>학부모 관리</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	<article>
			<div id="title_bar">
				<p>원생 관리</p>
				<h3>학부모 관리</h3>
			</div>
	
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<div id="bts">
						<input type="button" value="원생 관리" onclick="location.href='../kinder/kinder_list'">
						<input type="button" value="학부모 정보 입력" onclick="location.href='../parent/parent_register_form'">
					</div>
					
					<table id="kinderList" border="1"></table>
					
				</div>
			</section>
	</article>
<%@include file="../include/footer.jsp" %>
</body>
</html>