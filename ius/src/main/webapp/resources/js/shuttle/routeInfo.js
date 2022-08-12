function d_Value(target) {
	  // 선택한 option의 value 값
	  const driverValue = target.value;
	  console.log(target.value);
	  
		$.ajax({
			url : "/ius/bus/get_driver_tel",
			type : "POST",
			data : {
				staff_num : driverValue
			},
			success: function(data){
				console.log(data.staff_tel);
				$("#driver_tel").val(data.staff_tel);
			}
		})
};

$(document).ready(function() {
	
	var wrapper = $("#bus_route");
	var add_button = $(".add_bus_button");

	$(add_button).click(function(e) {
	    e.preventDefault();
	        $(wrapper).append("<tr class='input_route'>"
	                +"<td><input type='hidden' name='route_id[]' class='route_id'><select class='hour' name='shuttle_hour[]'>"
	                +"<c:forEach var='h' begin='0' end='24'><c:choose><c:when test='${h < 10 }'><option value='0${h}'>0${h}</option>"
	    			+"</c:when><c:otherwise><option value='${h}'>${h}</option></c:otherwise></c:choose></c:forEach></select> 시"
	                +"<select class='minute' name='shuttle_minute[]'><c:forEach var='m' begin='0' end='59'><c:choose><c:when test='${m < 10}'><option value='0${m}'>0${m}</option>"
	                +"</c:when><c:otherwise><option value='${m}'>${m}</option></c:otherwise></c:choose></c:forEach></select> 분</td>"
	                +"<td><input type='text' name='bus_stop[]' required='required'></td>"
	                +"<td class='del_button'>&times;</td><tr>");
		});

	  $("#bus_route").on("click", ".deleteInput", function(e) {
	        e.preventDefault();
	        
			var num = $(this).parent('.input_route').find('.route_id').val();
	        
	        $.ajax({
	        	url : "/ius/bus/route_delete",
	        	type : "POST",
	        	data : {
	        		route_id : num
	        	},
	        	success : function(data) {
	        		alert("삭제되었습니다.");
	        	}
	        })

	        $(this).parent('.input_route').remove();
	  });
	  
	  $("#bus_route").on("click", ".del_button", function(e){
		  e.preventDefault();
		  $(this).parent('.input_route').remove();
	  });
});

