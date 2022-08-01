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
	function view(class_number) {
		var class_number = class_number;
			
			$.ajax({
				url : "/ius/class/get_class_by_class_num",
				type : "POST",
				data : {
					class_number : class_number
				},
				success : function(data) {
					$("#class_number").val(data.classInfo.class_number);
					$("#class_name").val(data.classInfo.class_name);
					$("#staff_name").val(data.classInfo.staff_name);
					$("#staff_tel").val(data.classInfo.staff_tel);
					
					values = data.classKinderList;
					output = "<tr><th>원생 이름</th><th>원생 연락처</th></tr>";
					$.each(values, function(index, value) {
						output += "<tr>";
						output += "<td>" + value.kinder_name + "</td>";
						output += "<td>" + value.kinder_tel + "</td>";
						output += "</tr>";
					});
					
					$("#classKinder").html(output);
					
					$("#classInfo").show();
				}
			})
	};



	function getList() {
		$.ajax({
			url : "/ius/class/get_class_list",
			type : "POST",
			data : {
				
			},
			success: function(data) {
				$("#classList").text("");			
	
				values = data.classList;
				output = "<tr><th>반 번호</th><th>반 이름</th><th>담당 교사</th></tr>";			
				$.each(values, function(index, value) {
					
					output += "<tr>";
					output += "<td>" + value.class_number + "</td>";
					output += "<td><a href=\"javascript:view('" + value.class_number + "');\">" + value.class_name + "</a></td>";
					output += "<td>" + value.staff_name + "</td>";
					output += "</tr>";
				});
				
				$("#classList").html(output);
			}
			
		})
		
	}
	getList();
	

</script>
<title>학급 관리</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	<article>
			<div id="title_bar">
				<p>경영 정보</p>
				<h3>학급 관리</h3>
			</div>
	
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<input type="button" value="교직원 관리" onclick="location.href='../staff/staff_list'">
					<input type="button" value="학급 등록" onclick="location.href='../class/class_register_form'">
					
					<div id="searchBar">
					</div>
					
						<table id="classList" border="1" style="float : left;"></table>
						
						<div id="classInfo" style="float : left; display : none;">
							<table border="1" >
								<tr>
									<th colspan="1">학급 번호</th>
									<td colspan="3">
										<input type="text" id="class_number" name="class_number" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th colspan="1">학급 명</th>
									<td colspan="3">
										<input type="text" id="class_name" name="class_name" readonly="readonly">
									</td>	 
								</tr>
								<tr>
									<th>담당 교사</th>
									<td>
										<input type="text" id="staff_name" name="staff_name" readonly="readonly">
									</td>
									<th>연락처</th>
									<td>
										<input type="text" id="staff_tel" name="staff_tel" readonly="readonly">
									</td>
								</tr>
							</table>
							<table id="classKinder" border="1">
							</table>
						</div>
								
				</div>
			</section>
	</article> 

<%@include file="../include/footer.jsp" %>	
</body>
</html>