<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$("#register").click(function(){
			if ($("#staff_cls").val() == "") {
				alert("직무를 선택해주세요.");
				$("#staff_cls").val().focus();
				return;
			};
			
			if ($("#staff_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#staff_id").val().focus();
				return;
			};
			
			if ($("#staff_name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#staff_name").val().focus();
				return;
			};
			
			if ($("#staff_rrn1").val() == "" || $("#staff_rrn2").val() == "") {
				alert("주민등록번호를 입력해주세요.");
				$("#staff_rrn").val().focus();
				return;
			};
			
			if ($("#staff_rrn1").val().length != 6) {
				alert("주민등록번호 앞자리 입력이 잘못되었습니다.");
				$("#staff_rrn1").val().focus();
				return;
			};
			
			if ($("#staff_rrn2").val().length != 7) {
				alert("주민등록번호 뒷자리 입력이 잘못되었습니다.");
				$("#staff_rrn2").val().focus();
				return;
			};
				
			$("form").submit();
		});
		
		$("#staff_cls_edit").click(function(){
			url = "./job_class_Edit";
			window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbar=yes, resizeable=no, width=450, height=200");
		});
		
	})
	
</script>
<title>교직원 등록</title>
</head>
<body>
	<h1>교직원 등록</h1>
	<input type="button" value="홈으로" onclick="location.href='../index'">
	<input type="button" value="목록으로" onclick="location.href='./staff_list'">
	<form action="./staff_register" method="POST" name="frm">
		<table border="1">
			<tr>
				<th>교직원 코드</th>
				<td>
					<input type="text" name="staff_num" id="staff_num" value="${nextSeq}" readonly="readonly">
				</td>
				<th>직무*</th>
				<td>
					<select name="staff_cls" id="staff_cls">
						<option value="">--선택--</option>
						<c:forEach items="${jobList}" var="job">
							<option value="${job.staff_cls}">${job.job_Kname}</option>
						</c:forEach>
					</select>
					<input type="button" id="staff_cls_edit" value="편집">
				</td>
			</tr>
			<tr>
				<th>아이디*</th>
				<td>
					<input type="text" name="staff_id" id="staff_id">
				</td>
				<th>이름*</th>
				<td>
					<input type="text" name="staff_name" id="staff_name"> 
				</td>
			</tr>
			<tr>
				<th>주민등록번호*</th>
				<td>
					<input type="text" name="staff_rrn1" id="staff_rrn1" placeholder="ex)110011">
					-
					<input type="text" name="staff_rrn2" id="staff_rrn2" placeholder="0000000">
				</td>
				<th>주소</th>
				<td>
					<input type="text" name="staff_addr" id="staff_addr">
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text" name="staff_zipcode" id="staff_zipcode">
				</td>
				<th>연락처</th>
				<td>
					<input type="tel" name="staff_tel" id="staff_tel">
				</td>
			</tr>
			<tr>
				<th>입사일</th>
				<td>
					<input type="text" name="staff_hireD" id="staff_hireD" placeholder="예)220716">
				</td>
				<th>퇴사일</th>
				<td>
					<input type="text" name="staff_retireD" id="staff_retireD">
				</td>
			</tr>
			<tr>
				<th>재직여부*</th>
				<td>
					<select name="staff_workYn" id="staff_workYn">
						<option value="Y">재직</option>
						<option value="N">퇴사</option>
					</select>
				</td>
				<th>월급</th>
				<td>
					<input type="number" name="staff_salary" id="staff_salary"> 
				</td>
			</tr>
			<tr>
				<th colspan="2">이메일</th>
				<td colspan="2">
					<input type="email" name="staff_email" id="staff_email">
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" id="register" value="등록"> <!-- 추후 유효성 검사 구현 / 그런데 유효성 검사가 꼭 필요할지? 주민등록번호 입력값 유효성 검사가 꼭 필요해보인다.-->
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>