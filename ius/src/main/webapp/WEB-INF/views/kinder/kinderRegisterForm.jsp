<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원생 등록</title>
</head>
<body>
	<h1>원생 등록</h1>
	<input type="button" value="원생 목록" onclick="location.href='../kinder/kinder_list'">
	<form action="./kinder/kinder_register" method="POST" name="frm">
		<table border="1">
			<tr>
				<th>원생 번호</th>
				<td>
				
				</td>
			</tr>
			<tr>
				<th>셔틀 버스 호차</th>
				<td>
					<select>
						<option value="">-선택-</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>담임 교사</th>
				<td>
					<select>
						<option value="">-선택-</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>원생 이름</th>
				<td>
					<input type="text">
				</td>
				
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td>
					<input type="text">-<input type="text">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text">
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td>
					<input type="text">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="tel">
				</td>
			</tr>
			<tr>
				<th>등록 일</th>
				<td>
					<input type="date">
				</td>
			</tr>
			<tr>
				<th>재원 상태</th>
				<th>
					<select>
						<option>재원</option>
						<option>휴원</option>
						<option>퇴원</option>
						<option>졸업</option>
					</select>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>