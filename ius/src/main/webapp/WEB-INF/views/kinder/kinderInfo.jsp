<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원생 정보 조회</title>
</head>
<body>
	<h1>원생 정보 조회</h1>
	<input type="button" value="목록" onclick="location.href='../kinder/kinder_list'">
	<table border="1">
		<tr>
			<th>원생 번호</th>
			<td>${kinder.kinder_num}</td>
		</tr>
		<tr>
			<th>셔틀 버스 호차</th>
			<td>${kinder.shuttle_num}</td>
		</tr>
		<tr>
			<th>담임 교사</th>
			<td>${kinder.staff_name}</td>
		</tr>
		<tr>
			<th>재원 여부</th>
			<td>${kinder.kinder_regYn}</td>
		</tr>
		<tr>
			<th>원생 이름</th>
			<td>${kinder.kinder_name}</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>${kinder.kinder_}</td>
		</tr>
		<tr>
			<th>주민등록번호</th>
			<td></td>
		</tr>
		<tr>
			<th>주소</th>
			<td></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td></td>
		</tr>
		<tr>
			<th>입소일</th>
			<td></td>
		</tr>
		<tr>
			<th>퇴소일</th>
			<td></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="수정">
				<input type="button" value="삭제">
			</td>
		</tr>
	</table>
</body>
</html>