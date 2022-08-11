<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${path}/resources/js/staff/staffRegister.js"></script>
<title>교직원 등록</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
<link type="text/css" rel="stylesheet" href="${path}/resources/css/staff/staffRegister.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	<article>
	<!-- 왼쪽 소제목 박스 (타이틀 써 주시면 됩니다) -->
		<div id="title_bar">
			<p>경영 정보</p>
			<h3>교직원 등록</h3>
		</div>

		<!-- 오른쪽 기능 박스 (검색 등등 필요없으면 div 안에 내용 지워도 무방)-->
		<div id="title_top">
		</div>

		<section>
			<div id="content">
				<input type="button" value="목록으로" onclick="location.href='./staff_list'">
				<form action="./staff_register" method="POST" name="frm" enctype="multipart/form-data">
					<table border="1">
						<tr>
							<th>교직원 코드</th>
							<td>
								<input type="text" name="staff_num" id="staff_num" value="${nextSeq}" readonly="readonly">
							</td>
							<th>직무*</th>
							<td>
								<input type="hidden" name="staff_cls" id="staff_cls">
								<input type="text" name="job_Kname" id="job_Kname" readonly="readonly">
								<input type="button" id="staff_cls_edit" value="선택">
							</td>
						</tr>
						<tr>
							<th>아이디*</th>
							<td>
								<input type="text" name="staff_id" id="staff_id">
								<input type="hidden" name="staff_reid" id="staff_reid">
								<input type="button" value="아이디 중복 검사" name="staff_idChk" id="staff_idChk">
							</td>
							<th>이름*</th>
							<td>
								<input type="text" name="staff_name" id="staff_name"> 
							</td>
						</tr>
						<tr>
							<th colspan="1">프로필 사진</th>
							<td colspan="3">
								<input type="file" name="staff_picFile" id="staff_picFile">
								<div class="select_img">
									<img src="">
								</div>
							</td>
						</tr>
						<tr>
							<th>주민등록번호*</th>
							<td>
								<input type="text" name="staff_rrn1" id="staff_rrn1" placeholder="ex)110011">
								-
								<input type="text" name="staff_rrn2" id="staff_rrn2" placeholder="0000000">
							</td>
							<th>연락처</th>
							<td>
								<input type="tel" name="staff_tel" id="staff_tel">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="staff_addr" id="staff_addr">
							</td>
							<th>우편번호</th>
							<td>
								<input type="text" name="staff_zipcode" id="staff_zipcode">
							</td>
						</tr>
						<tr>
							<th>입사일</th>
							<td>
								<input type="date" name="staff_hireD" id="staff_hireD">
							</td>
							<th>퇴사일</th>
							<td>
								<input type="date" name="staff_retireD" id="staff_retireD">
							</td>
						</tr>
						<tr>
							<th>재직여부*</th>
							<td>
								<select name="staff_workYn" id="staff_workYn">
									<option value="Y">재직</option>
									<option value="P">휴직</option>
									<option value="N">퇴사</option>
								</select>
							</td>
							<th>월급</th>
							<td>
								<input type="text" name="staff_salary" id="staff_salary" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
							</td>
						</tr>
						<tr>
							<th colspan="1">이메일*</th>
							<td colspan="3">
								<input type="email" name="staff_email" id="staff_email">
								<input type="hidden" id="check_email">
								<font id="check" size="2"></font>
								<p>이메일은 비밀번호 찾기와 초기 비밀번호 발급시 사용되므로 정확하게 입력해주시기 바랍니다.</p>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<input type="button" id="register" value="등록"> 
								<input type="reset" value="취소">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</section>
	</article> 


<%@include file="../include/footer.jsp" %>
</body>
</html>