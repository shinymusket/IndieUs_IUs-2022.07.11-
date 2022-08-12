<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${path}/resources/js/kinder/kinderList.js"></script>
<title>원생 관리</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
<link type="text/css" rel="stylesheet" href="${path}/resources/css/kinder/kinderList.css">
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
					<div id="controllBtns">
						<input type="button" value="원생 등록" onclick="location.href='../kinder/kinder_register_form'">
						<input type="button" value="학부모 관리" onclick="location.href='../parent/parent_list'">
						<input type="button" value="출결 관리" onclick="location.href='../attendance/attendance_list'">
						<input type="button" value="상담 일지" onclick="location.href='../consult/consult_list'">
						<input type="button" value="수납 관리" onclick="location.href='../receipt/receipt_list'">
					</div>
					
					<div id="searchDiv">
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
					
					<table id="kinderList" class="list" border="1" style="float : left;"></table>
	
					<table id="kinderInfo" class="list" border="1" style="float : left; display : none;">
						<tbody>
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
										모<input type="text" id="kinder_mather" readonly="readonly" style='text-align:center' size="8">
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
									<th>보유 알러지</th>
									<td>
										<input type="text" id="allergy_info" readonly="readonly" style='text-align:center'>
										<input type="hidden" id="allergy_code">
										<input type="button" id="get_allergy_info" value="자세히" style="display : none;">
									</td>
								</tr>
							</tbody>
					
							<tfoot>
								<tr>
									<td colspan="4">
										<input type="button" value="정보 수정" id="update">
										<input type="button" value="삭제" id="delete">
									</td>
								</tr>
							</tfoot>
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
					
					<div id="allergy" style="float : left; display : none;">
						<table id=allergyDetailInfo border="1"></table>
					</div>
					
					
					
				</div>
			</section>
	</article>	
	
<%@include file="../include/footer.jsp" %>	
</body>
</html>