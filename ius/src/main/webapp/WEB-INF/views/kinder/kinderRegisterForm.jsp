<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>원생 등록</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
<link type="text/css" rel="stylesheet" href="${path}/resources/css/kinder/kinderRegisterForm.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	
	<article>
			<div id="title_bar">
				<p>원생 관리</p>
				<h3>원생 등록</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<input type="button" value="원생 목록" onclick="location.href='../kinder/kinder_list'">
					<form action="./kinder_register" method="POST" name="frm" enctype="multipart/form-data">
						<table border="1">
							<tr>
								<th>원생 번호</th>
								<td>
									<input type="text" id="kinder_num" name="kinder_num" value="${nextKinderSeq}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>셔틀 버스 호차</th>
								<td>
									<select name="shuttle_num" id="shuttle_num">
										<option value="">-선택-</option>
										<c:if test="${shuttleList != null}">
											<c:forEach items="${shuttleList}" var="shuttle">
												<option value="${shuttle.shuttle_num}">${shuttle.shuttle_name}] ${shuttle.shuttle_carnum}</option>
											</c:forEach>
										</c:if>
									</select>
								</td>
							</tr>
							<tr>
								<th>담임 교사</th>
								<td>
									<select name="staff_num" id="staff_num">
										<option value="">-선택-</option>
										<c:if test="${homeTeacherList != null}">
											<c:forEach items="${homeTeacherList}" var="homeTeacher">
												<option value="${homeTeacher.staff_num}">${homeTeacher.staff_name}</option>
											</c:forEach>
										</c:if>
									</select>
								</td>
							</tr>
							<tr>
								<th>원생 이름</th>
								<td>
									<input type="text" name="kinder_name" id="kinder_name">
								</td>
								
							</tr>
							<tr>
								<th>주민등록번호</th>
								<td>
									<input type="text" name="kinder_rrn1" id="kinder_rrn1">-<input type="text" name="kinder_rrn2" id="kinder_rrn2">
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>
									<input type="text" name="kinder_addr" id="kinder_addr">
								</td>
							</tr>
							<tr>
								<th>우편번호</th>
								<td>
									<input type="text" name="kinder_zipcode" id="kinder_zipcode">
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="tel" name="kinder_tel" id="kinder_tel">
								</td>
							</tr>
							<tr>
								<th>등록 일</th>
								<td>
									<input type="date" name="kinder_regdate" id="kinder_regdate">
								</td>
							</tr>
							<tr>
								<th>퇴원 일</th>
								<td>
									<input type="date" name="kinder_retireDate" id="kinder_retireDate">
								</td>
							</tr>
							<tr>
								<th>재원 상태</th>
								<td>
									<select name="kinder_regYn" id="kinder_regYn">
										<option value="Y" selected="selected">재원</option>
										<option value="P">휴원</option>
										<option value="N">퇴원</option>
										<option value="G">졸업</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>프로필 사진</th>
								<td>
									<input type="file" name="kinder_picFile" id="kinder_picFile">
									<div class="select_img">
										<img src="">
									</div>
								</td>
							</tr>
							<tr>
								<th>보유 알러지 정보</th>
								<td>
									<input type="text" id="allergy_info" readonly="readonly" style='text-align:center'>
									<input type="hidden" id="allergy_code" name="allergy_code">
									<input type="button" value="입력" id="allergySel">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" value="등록" id="register"> 
								</td>
							</tr>
						</table>
					</form>
				</div>
			</section>
	</article>	
<%@include file="../include/footer.jsp" %>	
</body>
<script type="text/javascript" src="${path}/resources/js/kinder/kinderRegisterForm.js"></script>
</html>