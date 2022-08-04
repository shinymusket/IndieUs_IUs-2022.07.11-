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
		url : "/ius/kinder/get_kinder_list",
		type : "POST",
		data : {
			
		},
		success: function(data) {
			$("#kinder_list_tbl").text("");
			values = data.kinderList;
			output = "<tr><th>원생 번호</th><th>원생 이름</th><th>학급명</th><th>담당 교사</th></tr>";				
			$.each(values, function(index, value) {
	
				output += "<tr>";
				output += "<td>" + value.kinder_num + "</td>";
				output += "<td><a href=\"javascript:view(" + value.kinder_num + ");\">" + value.kinder_name + "</a></td>";
				output += "<td>" + value.class_name + "</td>";
				output += "<td>" + value.staff_name + "</td>";
				output += "</tr>";
			});
			
			$("#kinder_list_tbl").html(output);
		}
		
	})
	
}
getList();

function view(kinder_num) {
	var kinder_num = kinder_num;
	$("#kinder_num").val(kinder_num);
	
	$.ajax({
		url : "/ius/consult/get_consult_by_kinder_num",
		type : "POST",
		data : {
			kinder_num : kinder_num
		},
		success : function(data) {
			$("#consult").hide();
			$("#consult_tbl").text("");
			values = data.consultInfo;
			output = "<tr><th>상담 일시</th><th>상담자</th><th>가족 관계</th><th>내담자</th><th>상담 내용</th></tr>";				
			$.each(values, function(index, value) {
				
				output += "<tr>";
				output += "<td>" + value.consult_date + "</td>";
				output += "<td>" + value.staff_name + "</td>";
				output += "<td>" + value.relation + "</td>";
				output += "<td>" + value.parent_name + "</td>";
				output += "<td>" + value.consult_content + "</td>";
				output += "</tr>";
			});
			
			$("#consult_tbl").html(output);
			$("#consult").show();
			
		}
	})
	
};

$(function(){
	$("#searchBtn").click(function(){
		
		var searchType = $("#searchType").val();
		var searchContent = $("#searchContent").val();
		
		$.ajax({
			url : "/ius/attendance/search_kinder",
			type : "POST",
			data : {
				searchType : searchType,
				searchContent : searchContent
			},
			success : function(data) {
				$("#kinder_list_tbl").text("");
				values = data.kinderList;
				output = "<tr><th>원생 번호</th><th>원생 이름</th><th>학급명</th><th>담당 교사</th></tr>";				
				$.each(values, function(index, value) {
		
					output += "<tr>";
					output += "<td>" + value.kinder_num + "</td>";
					output += "<td><a href=\"javascript:view(" + value.kinder_num + ");\">" + value.kinder_name + "</a></td>";
					output += "<td>" + value.class_name + "</td>";
					output += "<td>" + value.staff_name + "</td>";
					output += "</tr>";
				});
				
				$("#kinder_list_tbl").html(output);
				
			}
		})
			
	});
	
	$("#selectBtn").click(function(){
		if ($("#date_from").val() == "") {
			alert("조회 시작 날짜를 입력해주세요");
			return;
		};
		if ($("#date_to").val() == "") {
			alert("조회 끝 날짜를 입력해주세요");
			return;
		};
		
		var kinder_num = $("#kinder_num").val();
		var date_from = $("#date_from").val();
		var date_to = $("#date_to").val();
		
		$.ajax({
			url : "/ius/consult/select_consult",
			type : "POST",
			data : {
				kinder_num : kinder_num,
				date_from : date_from,
				date_to : date_to
			},
			success : function(data) {
				$("#consult").hide();
				$("#consult_tbl").text("");
				values = data.consultInfo;
				output = "<tr><th>상담 일시</th><th>상담자</th><th>가족 관계</th><th>내담자</th><th>상담 내용</th></tr>";				
				$.each(values, function(index, value) {
					
					output += "<tr>";
					output += "<td>" + value.consult_date + "</td>";
					output += "<td>" + value.staff_name + "</td>";
					output += "<td>" + value.relation + "</td>";
					output += "<td>" + value.parent_name + "</td>";
					output += "<td>" + value.consult_content + "</td>";
					output += "</tr>";
				});
				
				$("#consult_tbl").html(output);
				$("#consult").show();
				
			}
		})
		
		
		
	});
	
	
	
})



</script>
<title>상담 일지</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	<article>
			<div id="title_bar">
				<p>원생 관리</p>
				<h3>상담 일지</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<div id="controllBtns">
						<input type="button" value="원생 관리" onclick="location.href='../kinder/kinder_list'">
					</div>
					
					<div id="kinder_list" style="float: left;">
						<div id="searchBts">
							<select id="searchType">
								<option value="kinder_num">원생 번호</option>
								<option value="kinder_name">원생 이름</option>
								<option value="class_name">학급명</option>
								<option value="staff_name">담당 교사</option>
							</select>
							<input type="text" id="searchContent">
							<input type="button" value="검색" id="searchBtn">
						</div>
						<table id="kinder_list_tbl" border="1"></table>
					</div>
					
					<div id="consult" style="float: left; display:none;">
						<div id="selectBts">
							<input type="hidden" id="kinder_num">
							<input type="date" id="date_from">
							<input type="date" id="date_to">
							<input type="button" value="조회" id="selectBtn"> 
						</div>
						
						<table id="consult_tbl" border="1"></table>
					</div>
					
				</div>
			</section>
	</article>	
<%@include file="../include/footer.jsp" %>	
</body>
</html>