<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설(비품) 관리</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	function getList() {
		$.ajax({
			url : "/ius/equipment/get_equipment_list",
			type : "POST",
			data :  {
				
			},
			success: function(data) {
				$("#equipmentList").text("");
				values = data.equipmentList;
				output = "<tr><th>자산 번호</th><th>등록자</th><th>분류</th><th>비품명</th><th>수량</th><th>취득일자</th></tr>";
				$.each(values, function(index, value) {
					
					output += "<tr>";
					output += "<td>" + value.equipment_num + "</td>";
					output += "<td>" + value.staff_name + "</td>";
					output += "<td>" + value.equipment_cls + "</td>";
					output += "<td>" + value.equipment_name + "</td>";
					output += "<td>" + value.equipment_count + "</td>";
					output += "<td>" + value.equipment_regdate + "</td>";
					output += "</tr>";
				});
				
				$("#equipmentList").html(output);
			
			}
		})
	
	};

	getList();


</script>
</head>
<body>
	<h1>시설(비품) 관리</h1>
	<input type="button" value="홈으로" onclick="location.href='../main/'">
	<input type="button" value="시설(비품) 등록" onclick="location.href='../equipment/equipment_register_form'">
	<input type="button" value="구매품 등록" onclick="location.href=''">
	
	<table id="equipmentList" border="1">
	</table>
	
</body>
</html>