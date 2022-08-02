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
function view(kinder_num) {
	var kinder_num = kinder_num;
		
		$.ajax({
			url : "/ius/kinder/get_kinder_by_kinder_num",
			type : "POST",
			data : {
				kinder_num : kinder_num
			},
			success : function(data) {
				
				$("#kinder_num").val(data.kinder.kinder_num);
				
				if ((data.kinder.kinder_picture == null)|| (data.kinder.kinder_picture == "")) {
					data.kinder.kinder_picture = "\\imgUpload\\no_image.jpg";
				}
				
				$("#kinder_picture").html("<img src='" + data.kinder.kinder_picture + "' width='94.4px' height='113.3px'>");
				
				$("#kinder_name").val(data.kinder.kinder_name);
				$("#class_name").val(data.kinder.class_name);
				$("#staff_name").val(data.kinder.staff_name);	
				$("#kinder_father").val(data.fatherName);
				$("#kinder_mather").val(data.matherName);
				
				$("#shuttle_num").val(data.kinder.shuttle_num);
				$("#kinder_rrn1").val(data.kinder.kinder_rrn1);
				$("#kinder_rrn2").val(data.kinder.kinder_rrn2);
				$("#kinder_addr").val(data.kinder.kinder_addr);
				$("#kinder_zipcode").val(data.kinder.kinder_zipcode);
				$("#kinder_tel").val(data.kinder.kinder_tel);
				$("#kinder_regdate").val(data.kinder.kinder_regdate);
				$("#kinder_retireDate").val(data.kinder.kinder_retireDate);
				$("#kinder_regYn").val(data.kinder.kinder_regYn);
				
				$("#kinderInfo").hide();
				$("#parent").hide();
				$("#parentInfo").hide();
				
				$("#kinderInfo").show();
			}
		})
};



function getList() {
	$.ajax({
		url : "/ius/kinder/get_kinder_list",
		type : "POST",
		data : {
			
		},
		success: function(data) {
			$("#kinderList").text("");
			values = data.kinderList;
			output = "<tr><th>원생 이름</th><th>전화</th><th>학급</th></tr>";				
			$.each(values, function(index, value) {
	
				output += "<tr>";
				output += "<td><a href=\"javascript:view(" + value.kinder_num + ");\">" + value.kinder_name + "</a></td>";
				output += "<td>" + value.kinder_tel + "</td>";
				output += "<td>" + value.class_name + "</td>";
				output += "</tr>";
			});
			
			$("#kinderList").html(output);
		}
		
	})
	
}
getList();


function changeSearchSelect(){
	var searchType = $("#searchType").val();
	
	if (searchType == "kinder_regYn") {
		$("#search_regYn").show();
		$("#searchDateFrom").hide();
		$("#searchDateTO").hide();
		$("#searchContent").hide();
	} else if ((searchType == "kinder_regdate") || (searchType == "kinder_retireDate")) {
		$("#searchDateFrom").show();
		$("#searchDateTO").show();
		$("#search_regYn").hide();
		$("#searchContent").hide();
	} else {
		$("#searchDateFrom").hide();
		$("#searchDateTO").hide();
		$("#search_regYn").hide();
		$("#searchContent").show();
	};
	

};


$(function(){
	$("#search").click(function(){
		var searchType = $("#searchType").val();
		var searchContent = $("#searchContent").val();
		var search_regYn = $("#search_regYn").val();
		var searchDateFrom = $("#searchDateFrom").val();
		var searchDateTO = $("#searchDateTO").val();
		
		$.ajax({
			url : "/ius/kinder/search_kinder_list_by_searchType",
			type : "POST",
			data : {
				searchType : searchType,
				searchContent : searchContent,
				search_regYn : search_regYn,
				searchDateFrom : searchDateFrom,
				searchDateTO : searchDateTO	
			},
			success : function(data) {
				$("#kinderList").text("");
				values = data.kinderList;
				output = "<tr><th>원생 이름</th><th>전화</th><th>학급</th></tr>";				
				$.each(values, function(index, value) {
		
					output += "<tr>";
					output += "<td><a href=\"javascript:view(" + value.kinder_num + ");\">" + value.kinder_name + "</a></td>";
					output += "<td>" + value.kinder_tel + "</td>";
					output += "<td>" + value.class_name + "</td>";
					output += "</tr>";
				});
				
				
				$("#kinderInfo").hide();
				$("#parent").hide();
				$("#parentInfo").hide();
				
				$("#kinderList").html(output);
			}
			
		})
			
	});
	
	$("#update").click(function(){
		$("#staffInfo").hide();
		var kinder_num = $("#kinder_num").val();
		location.href="./update_form_kinder?kinder_num=" + kinder_num;
	});
	
	$("#delete").click(function(){
		var kinder_num = $("#kinder_num").val();
		var input = confirm('정말 삭제하시겠습니까?');
		if (input === true) {
			$("#kinderInfo").hide();
			alert("삭제되었습니다.");
			location.href="./delete_kinder?kinder_num=" + kinder_num;
		} else {
			alert("취소되었습니다.");
		};
		
		
	});
	
	$("#getParentInfo").click(function(){
		$("#parent").show();
	});
	
	$("#getFatherInfo").click(function(){
		var kinder_num = $("#kinder_num").val();
		var relation = "F";
		
		$.ajax({
			url : "/ius/kinder/get_parent_by_kinder_num",
			type : "POST",
			data : {
				kinder_num : kinder_num,
				relation :  relation
			},
			
			success : function(data) {
				
				$("#relation").val(data.parent.relation);
				$("#parent_name").val(data.parent.parent_name);
				$("#parent_tel").val(data.parent.parent_tel);
				$("#parent_email").val(data.parent.parent_email);
				
				if (data.parent.parent_sex == 'M') {
					parent_sex = '남성';
				} else if (data.parent.parent_sex == 'F') {
					parent_sex = '여성';
				}
		
				$("#parent_sex").val(parent_sex);
				$("#parent_birth").val(data.parent.parent_birth);
							
				$("#parentInfo").show();
			}
		})
	});
	
	$("#getMatherInfo").click(function(){
		var kinder_num = $("#kinder_num").val();
		var relation = "M";
		
		$.ajax({
			url : "/ius/kinder/get_parent_by_kinder_num",
			type : "POST",
			data : {
				kinder_num : kinder_num,
				relation :  relation
			},
			
			success : function(data) {
				
				$("#relation").val(data.parent.relation);
				$("#parent_name").val(data.parent.parent_name);
				$("#parent_tel").val(data.parent.parent_tel);
				$("#parent_email").val(data.parent.parent_email);
				
				if (data.parent.parent_sex == 'M') {
					parent_sex = '남성';
				} else if (data.parent.parent_sex == 'F') {
					parent_sex = '여성';
				}
		
				$("#parent_sex").val(parent_sex);
				$("#parent_birth").val(data.parent.parent_birth);
							
				$("#parentInfo").show();
			}
		})
	});
	
	
	
	
})


</script>
<title>원생 관리</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	
	<article>
			<div id="title_bar">
				<p>원생 관리</p>
				<h3>원생 관리</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<div class="btns">
						<input type="button" value="원생 등록" onclick="location.href='../kinder/kinder_register_form'">
						<input type="button" value="학부모 관리" onclick="location.href='../parent/parent_list'">
					</div>
					
					<div class="searhBar">
						<select name="searchType" id="searchType" onchange="changeSearchSelect()">
							<option value="kinder_num">원생 번호</option>
							<option value="staff_name">담임 교사</option>
							<option value="kinder_name">이름</option>
							<option value="shuttle_num">셔틀 버스 호차</option>
							<option value="kinder_regYn">재원 여부</option>
							<option value="kinder_regdate">입소일</option>
							<option value="kinder_retireDate">퇴소일</option>
						</select>
						<input type="text" name="searchContent" id="searchContent">
						<select name="search_regYn" id="search_regYn" style="display : none;">
							<option value="Y">재원</option>
							<option value="N">퇴원</option>
							<option value="P">휴원</option>
							<option value="G">졸업</option>
						</select>
						<input type="date" id="searchDateFrom" style="display : none;">
						<input type="date" id="searchDateTO" style="display : none;">
						<input type="button" value="검색" id="search">
					</div>
					
					<table id="kinderList" border="1" style="float : left;"></table>
	
					<table id="kinderInfo" border="1" style="float : left; display : none;">
						<tr>
							<th colspan="2">원생 번호</th>
							<td colspan="2">
								<input type="text" id="kinder_num" readonly="readonly" style='text-align:center'>
							</td>
						</tr>		
						<tr>
							<td rowspan="6" id="kinder_picture" width='94.4px' height='113.3px'>
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td colspan="2">
								<input type="text" id="kinder_name" readonly="readonly" style='text-align:center'>
							</td>
						</tr>
						<tr>
							<th>학급 명</th>
							<td colspan="2">
								<input type="text" id="class_name" readonly="readonly" style='text-align:center'>
							</td>	
						</tr>
						<tr>
							<th>담당 교사</th>
							<td colspan="2">
								<input type="text" id="staff_name" readonly="readonly" style='text-align:center'>
							</td>
						</tr>
						<tr>
							<th>학부모</th>
							<td colspan="2">
								부<input type="text" id="kinder_father" readonly="readonly" style='text-align:center' size="8">
								모<input type="text" id="kinder_mother" readonly="readonly" style='text-align:center' size="8">
								<input type="button" value="학부모 정보" id="getParentInfo">
							</td>
						</tr>
						<tr>
							<th>셔틀버스 호차</th>
							<td colspan="2">
								<input type="text" id="shuttle_num" readonly="readonly" style='text-align:center'>
							</td>
						</tr>
						<tr>
							<th colspan="2">주민등록번호</th>
							<td colspan="2">
								<input type="text" id="kinder_rrn1" readonly="readonly" style='text-align:center'>-<input type="text" id="kinder_rrn2" readonly="readonly" style='text-align:center'>
							</td>
						</tr>
						<tr>
							<th colspan="2">주소</th>
							<td colspan="2">
								<input type="text" id="kinder_addr" readonly="readonly" style='text-align:center'>
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>
								<input type="text" id="kinder_zipcode" readonly="readonly" style='text-align:center'>
							</td>
							<th>연락처</th>
							<td>
								<input type="text" id="kinder_tel" readonly="readonly" style='text-align:center'>
							</td>
						</tr>
						<tr>
							<th>입소일</th>
							<td>
								<input type="date" id="kinder_regdate" readonly="readonly" style='text-align:center'>
							</td>
							<th>퇴소일</th>
							<td>
								<input type="date" id="kinder_retireDate" readonly="readonly" style='text-align:center'>
							</td>
						</tr>
						<tr>
							<th>재원여부</th>
							<td>
								<input type="text" id="kinder_regYn" readonly="readonly" style='text-align:center'>
							</td>
							<th>알러지 정보</th>
							<td>
							</td>
						</tr>
						<tr>
							<th colspan="4">출결 내역</th>
						</tr>
						<tr>
							<td colspan="4">
								<input type="button" value="정보 수정" id="update">
								<input type="button" value="삭제" id="delete">
							</td>
						</tr>
					</table>
					
					<div id="parent" style="float : left; display : none;">
						<input type="button" value="부" id="getFatherInfo">
						<input type="button" value="모" id="getMatherInfo">
					
						<table id="parentInfo" border="1" style="display : none;">
							<tr>
								<th colspan="2">보호자 정보</th>
							</tr>
							<tr>
								<th>가족 관계</th>
								<td>
									<input type="text" id="relation" readonly="readonly" style='text-align:center'>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" id="parent_name" readonly="readonly" style='text-align:center'>
								</td>
							</tr>
							<tr>
								<th>전화 번호</th>
								<td>
									<input type="text" id="parent_tel" readonly="readonly" style='text-align:center'>
								</td>
							</tr>
							<tr>
								<th>이메일 주소</th>
								<td>
									<input type="text" id="parent_email" readonly="readonly" style='text-align:center'>
								</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<input type="text" id="parent_sex" readonly="readonly" style='text-align:center'> 
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="date" id="parent_birth" readonly="readonly" style='text-align:center'> 
								</td>
							</tr>			
						</table>
					</div>
					
					
					
					
				</div>
			</section>
	</article>	
	
<%@include file="../include/footer.jsp" %>	
</body>
</html>