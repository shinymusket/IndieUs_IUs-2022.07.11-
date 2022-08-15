$(function(){
	
	$("#staff_email").change(function(){
		var staff_email = $("#staff_email").val();
		
		$.ajax({
			url : "/ius/main/get_email_exist_check",
			type : "POST",
			data : {
				staff_email : staff_email
			},
			success: function(data) {
				if(data.result == 0) {
					$("#check").html("존재하지 않는 이메일입니다.");
					$("#check").attr("color", "red");
				} else {
					$("#check").html("이메일로 가입된 정보가 있습니다.");
					$("#check").attr("color", "green");
				}
				
			}
			
		})
		
	});
	
	$("#search").click(function(){
		var staff_email = $("#staff_email").val();
		
		if (staff_email == "") {
			alert("이메일을 입력해주세요.");
			return;
		}
		
		$.ajax({
			url : "/ius/main/search_password_by_email",
			type : "POST",
			data : {
				staff_email : staff_email
			},
			success: function(data) {
				if (data.result == 0) {
					alert("이메일이 없습니다.");
				} else {
					$("#check").html("");
					alert("이메일로 임시비밀번호가 발송되었습니다.");
				}

			}
			
		})
		
	});
	
})