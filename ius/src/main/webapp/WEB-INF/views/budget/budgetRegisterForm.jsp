<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예산 등록</title>
</head>
<body>
	<h1>예산 등록</h1>
	<form action="./budget_register" method="POST">
		<table border="1">
			<tr>
				<th>예산 년도</th>
				<th>구분</th>
				<th>항목 명</th> <!-- 최대 8자 -->
				<th>총 금액</th>
			</tr>
			<tr>
				<td>
					<input type="number" name="budget_year" min="2022" value="2022">
				</td>
				<td>
					<select name="budget_iE" id=""> <!-- value 값이 없을 때 유효성 검사 -->
						<option value="">-선택-</option>
						<option value="In">수입</option>
						<option value="Ex">지출</option>
					</select>
				</td>
				<td>
					<input type="text" name="budget_cls" id="">
				</td>
				<td>
					<input type="number" name="budget_total" id="">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>