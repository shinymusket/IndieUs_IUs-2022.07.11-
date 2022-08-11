/* function getList() {
		$.ajax({
			url : "/ius/equipment/get_equipment_list",
			type : "POST",
			data :  {
				
			},
			success: function(data) {
				$("#equipmentList").text("");
				values = data.equipmentList;

				output = "<tr><th>자산 번호</th><th>등록자</th><th>분류</th><th>비품명</th><th>수량</th><th>취득일자</th><th>구분</th></tr>";
				$.each(values, function(index, value) {
					
					output += "<tr>";
					output += "<td>" + value.equipment_num + "</td>";
					output += "<td>" + value.staff_name + "</td>";

					output += "<td>" + value.equip_cls_name + "</td>";
					output += "<td><a href='../equipment/equipment_info?equipment_num=" + value.equipment_num + "'>" + value.equipment_name + "</a></td>";
					output += "<td>" + value.equipment_count + "</td>";
					output += "<td>" + value.equipment_regdate + "</td>";
					output += "<td>" + value.equipment_cate + "</td>";
					output += "</tr>";
				});
				
				$("#equipmentList").html(output);
			
			}
		})
	
	};

	getList(); */
	
	function getCookie(name) {	// 저장된 쿠키 가져오기
	    var nameEQ = name + "=";
	    var ca = document.cookie.split(';');
	    for(var i=0;i < ca.length;i++) {
	        var c = ca[i];
	        while (c.charAt(0)==' ') c = c.substring(1,c.length);
	        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	    }
	    return null;
	}
	
	function changeSearchType() { // 검색타입 변환시
		
		var searchType = $("#searchType").val();
		
		if( searchType == "equip_cls_name") { // 검색 타입이 분류명인 경우.
			$("#searchContent").hide();
			$("#searchDate").hide();
			$("#equip_cls_num").show();
			$("#equipment_cate").hide();
		} else if (searchType == "equipment_regdate") { // 검색 타입이 취득날짜인 경우.
			$("#searchContent").hide();
			$("#searchDate").show();
			$("#equip_cls_num").hide();
			$("#equipment_cate").hide();
		} else if (searchType == "equipment_cate") { // 검색 타입이 구분인 경우.
			$("#searchContent").hide();
			$("#searchDate").hide();
			$("#equip_cls_num").hide();
			$("#equipment_cate").show();
		} else { // 그 외에
			$("#searchContent").show();
			$("#searchDate").hide();
			$("#equip_cls_num").hide();
			$("#equipment_cate").hide();
		};
	};
	
	function getInfo(equipment_num) {
		location.href="../equipment/equipment_info?equipment_num=" + equipment_num;
	};
	
	
	
$(function(){
	$("#equipRegister").click(function(){ // 시설(비품) 등록시 시설 권한이 있는지 유무 체크확인.
		var facility = getCookie("facility");
	
		console.log(facility);
		
		if (facility == "N") { // 시설 권한이 없으면 등록 불가.
			alert("권한이 없습니다.");
		} else if (facility == "Y") { 
			location.href='../equipment/equipment_register_form';
		}
	});
	
	$("#purchaseRegister").click(function(){ // 구매품 등록시 시설 권한이 있는지 유무 체크확인.
		var facility = getCookie("facility");
	
		console.log(facility);
		
		if (facility == "N") { // 시설 권한이 없으면 등록 불가.
			alert("권한이 없습니다.");
		} else if (facility == "Y") { 
			location.href='../equipment/purchaseEquip_form'
		}
	});
	
	
})