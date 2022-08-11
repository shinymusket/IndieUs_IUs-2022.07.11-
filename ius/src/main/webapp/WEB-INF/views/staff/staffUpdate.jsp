<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${path}/resources/js/staff/staffUpdate.js"></script>
<title>교직원 정보 수정</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
<link type="text/css" rel="stylesheet" href="${path}/resources/css/staff/staffRegister.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	<article>
		<div id="title_bar">
			<p>경영 정보</p>
			<h3>교직원 정보 수정</h3>
		</div>

		<div id="title_top">
		</div>

		<section>
			<div id="content">
				<input type="button" value="목록으로" onclick="location.href='./staff_list'">
				<form action="./staff_update" method="POST" enctype="multipart/form-data">
					<table border="1">
						<tr>
							<th>교직원 코드</th>
							<td>
								<input type="text" name="staff_num" id="staff_num" value="${staff.staff_num}" readonly="readonly">
							</td>
							<th>구분</th>
							<td>
								<select name="staff_cls" id="staff_cls">
									<c:forEach items="${jobList}" var="job" >
										<c:if test="${staff.staff_cls == job.staff_cls}">
											<option value="${job.staff_cls}" selected="selected">${job.job_Kname}</option>					
										</c:if>
										<c:if test="${staff.staff_cls != job.staff_cls}">
											<option value="${job.staff_cls}">${job.job_Kname}</option>
										</c:if>
									</c:forEach>
								</select>
								
							</td>
						</tr>
						<tr>
							<th>아이디</th>
							<td>
								<input type="text" name="staff_id" id="staff_id" value="${staff.staff_id}" readonly="readonly">
							</td>
							<th>이름</th>
							<td>
								<input type="text" name="staff_name" id="staff_name" value="${staff.staff_name}"> 
							</td>
						</tr>
						<tr>
							<th>주민등록번호</th>
							<td>
								<input type="text" name="staff_rrn1" id="staff_rrn1" value="${staff.staff_rrn1}">
								-
								<input type="text" name="staff_rrn2" id="staff_rrn2" value="${staff.staff_rrn2}">
							</td>
							<th>주소</th>
							<td>
								<input type="text" name="staff_addr" id="staff_addr" value="${staff.staff_addr}">
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>
								<input type="text" name="staff_zipcode" id="staff_zipcode" value="${staff.staff_zipcode}">
							</td>
							<th>연락처</th>
							<td>
								<input type="tel" name="staff_tel" id="staff_tel" value="${staff.staff_tel}">
							</td>
						</tr>
						<tr>
							<th>입사일</th>
							<td>
								<input type="date" name="staff_hireD" id="staff_hireD" value="${staff.staff_hireD}">
							</td>
							<th>퇴사일</th>
							<td>
								<input type="date" name="staff_retireD" id="staff_retireD" value="${staff.staff_retireD}">
							</td>
						</tr>
						<tr>
							<th>재직여부</th>
							<td>
								<c:if test="${staff.staff_workYn == 'Y'}">
									<select name="staff_workYn" id="staff_workYn">
										<option value="Y" selected="selected">재직</option>
										<option value="P">휴직</option>
										<option value="N">퇴사</option>
									</select>
								</c:if>
								<c:if test="${staff.staff_workYn == 'P'}">
									<select name="staff_workYn" id="staff_workYn">
										<option value="Y">재직</option>
										<option value="P" selected="selected">휴직</option>
										<option value="N" >퇴사</option>
									</select>
								</c:if>		
								
								<c:if test="${staff.staff_workYn == 'N'}">
									<select name="staff_workYn" id="staff_workYn">
										<option value="Y">재직</option>
										<option value="P">휴직</option>
										<option value="N" selected="selected">퇴사</option>
									</select>
								</c:if>
							</td>
							<th>월급</th>
							<td>
								<input type="text" name="staff_salary" id="staff_salary" value="${staff.staff_salary}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
							</td>
						</tr>
						<tr>
							<th colspan="2">이메일</th>
							<td colspan="2">
								<input type="email" name="staff_email" id="staff_email" value="${staff.staff_email}" readonly="readonly"><p>이메일은 변경할 수 없습니다.</p>
							</td>
						</tr>
						<tr>
							<th colspan="2">프로필 사진</th>
							<td colspan="2">
								새로 업로드하실 경우에는 기존 사진에서 새로운 사진으로 대체됩니다.
								<input type="file" name="staff_picFile" id="staff_picFile">
								<div class="select_img">
									<img src="">
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<input type="button" value="수정" id="update">
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