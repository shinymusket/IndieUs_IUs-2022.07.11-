<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식단 수정</title>
<style>
	table{
	text-align: center;
	}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>

function openWin(url,name){
	window.open(url,name,"width=300, height=400");	
}

function openlAllergy(name){
	window.open("./allergyInfo", name, "width=300, height=400");
}

// 엔터 누를 시 이벤트 발생 안되게 
document.addEventListener('keydown', function(event) {
	  if (event.keyCode === 13) {
	    event.preventDefault();
	  };
	}, true);

</script>
<script>
	$(document).ready(function() {
	    var max_fields = 6;
	    var wrapper = $("#lunch");
	    var add_button = $("#add_form_field");
	
	    var x = 0;
	    $(add_button).click(function(e) {
	        e.preventDefault();
	        if (x < max_fields) {
	            x++;
	            $(wrapper).append("<tr id='input-menu'><td><input type='text' name='lMenu[]' required='required'></td><td><input type='text' name='lKcal[]' required='required'> kcal</td><td><input type='text' id='lallergy"+x+"' name='lallergy[]' readonly='readonly'><input type='button' value='선택' onclick='openlAllergy(`lallergy"+x+"`)'></td> <td id='deleteInput' class='AutoInput' title='Delete'>x</td></tr>");
	        } else {
	            alert('6개를 초과할 수 없습니다.')
	        }
	    });
	
	    $(wrapper).on("click", "#deleteInput", function(e) {
	        e.preventDefault();
	        $(this).parent('#input-menu').remove();
	        x--;
	    })
	});
	
</script>
</head>
<body>
<form action="" method="POST">
	<table border="1" width="800px">
		<tr>
			<td colspan="4">식단 등록</td>
		</tr>
		<tr>
			<td>급식 일자</td>
			<td colspan="3">
				<input type="date" name="menu_edate">
			</td>
		</tr>
		<tr>
			<td colspan="4">식단</td>
		</tr>
		<tr>
			<td>음식명</td>
			<td>칼로리</td>
			<td>알레르기 유발</td>
		</tr>
	</table>
	<table>
		<tr>
			<td colspan="4">오전 간식 <input name="addButton" id="add_form_field" type="button" value="+"></td>
		</tr>
	</table>
		
	<table  border="1" width="800px" id="lunch">
			<tr>
				<td colspan="4">점심 (최대 6개)<input name="addButton" id="add_form_field" type="button" value="+"></td>
			</tr>	
	</table>
		
	<table  border="1" width="800px" id="B">
		<tr>
			<td colspan="3">오후 간식  <input type="button" value="추가" onclick="add_textbox()"></td>
		</tr>
		<tr>
			<td>
				<input type="text" valeu="">
			</td>
			<td>
				<input type="text" value=""> kcal
			</td>
			<td>
				<input type="text" id ="allergy" name="allergy7" readonly="readonly">
				<input type="button" value="선택" onclick="openWin('AllergyCheckServlet','allergy7')">
			</td>
		</tr>
	</table>
</form>
</body>
</html>