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
		function getList(){
			$.ajax({
				url: "/ius/staff/get_job_list",
				type: "POST",
				data: {
					
				},
				success: function (json) {
					json = json.replace(/\n/gi, "\\r\\n"); // 개행문자 대체
					$("#jobList").text(""); // 직무 리스트 영역 초기화
					var obj = JSON.parse(json); // service 클래스로부터 전달된 문자열 파싱
					var jobList = obj.jobList;
					var output = "<tr><th>직무 코드</th><th>한글명</th><th>영문명</th></tr>";
					for (var i = 0; i < jobList.length; i++) {
						output += "<tr>";
						for (var j = 0; j < jobList[i].length; j++) {
							var job = jobList[i][j];
							if (j === 0) {
								output += "<td>" + job.staff_cls + "</td>";
							} else if (j === 1) {
								output += "<td>" + job.job_Kname + "</td>";
							} else if (j === 2) {
								output += "<td>" + job.job_Ename + "</td></tr>";
							}
							
						};
					};
					$("#jobList").html(output);
				}	
			})
		}
		getList();
		
		$("#insert_btn").click(function(){
			if($("#job_Kname").val().trim() === "") {
				alert("한글명을 입력하세요.");
				$("#job_Kname").val("").focus();
			}else if($("#job_Ename").val().trim() === "") {
				alert("영문명을 입력하세요.");
				$("#job_Ename").val("").focus();
			} else {
				$.ajax({
					url: "/ius/staff/insert_job_list",
					type: "POST",
					data: {
						job_Kname : $("#job_Kname").val(),
						job_Ename : $("#job_Ename").val()
					},
					success: function() {
						$("#job_Kname").val("");
						$("#job_Ename").val("");
						getList();
					}
				})
			}	
		})
		
	})


</script>
<title>직무 분류</title>
</head>
<body>
	<table border="1" id="jobList"></table>
	<form>
		<input type="text" name="job_Kname" id="job_Kname" placeholder="한글명">
		<input type="text" name="job_Ename" id="job_Ename" placeholder="영문명">
		<input type="button" value="추가" id="insert_btn">
		<input type="button" value="수정" id="">
		<input type="button" value="삭제" id="">
	</form>
	
</body>
</html>