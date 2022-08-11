<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
	var currentDate  = new Date().toISOString().substring(0, 10);
	$("#purchase_date").val(currentDate);
	

    //키를 누르거나 떼었을때 이벤트 발생
    $("#purchase_price").bind('keyup keydown',function(){
        inputNumberFormat(this);
    });

    //입력한 문자열 전달
    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    };
      
    //콤마찍기
    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    };

    //콤마풀기
    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    };

    //숫자만 리턴(저장할때)
    //alert(cf_getNumberOnly('1,2./3g')); -> 123 return
    function cf_getNumberOnly (str) {
        var len      = str.length;
        var sReturn  = "";

        for (var i=0; i<len; i++){
            if ( (str.charAt(i) >= "0") && (str.charAt(i) <= "9") ){
                sReturn += str.charAt(i);
            }
        }
        return sReturn;
    };
    
    $("#finance_select").click(function(){
    	url = "./equipment_finance_select";
		window.open(url, "_blank_1", "toolbar=yes, menubar=no, scrollbar=yes, resizeable=no, width=550, height=400");
    });
    
    $("#equip_cls_sel").click(function(){
		url = "./equipment_class_edit";
		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbar=yes, resizeable=no, width=550, height=400");
    });
    
    $("#register").click(function(){
    	if($("#finance_num").val().trim() == "") {
    		alert("재정 코드를 선택해주세요.");
    		$("#finance_num").val().focus();
    		return;
    	};
    	if($("#equip_cls_num").val().trim() == "") {
    		alert("분류 항목을 선택해주세요.");
    		$("#equip_cls_num").val().focus();
    		return;
    	};
    	if($("#equipment_name").val().trim() == "") {
    		alert("비품명을 입력해주세요.");
    		$("#equipment_name").val().focus();
    		return;
    	};
    	if($("#equipment_name").val().length > 10) {
    		alert("비품명은 10자이하여야 합니다.");
    		$("#equipment_name").val().focus();
    		return;
    	};
    	if($("#purchase_price").val().trim() == "") {
    		alert("구매 가격을 입력해주세요.");
    		$("#purchase_price").val().focus();
    		return;
    	};
    	
		value = cf_getNumberOnly ($("#purchase_price").val());
		$("#purchase_price").val(value);
		
		frm.submit();
    	
    });
    
   
})




</script>
<title>구매품 등록</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	
	<article>
			<div id="title_bar">
				<p>경영 정보</p>
				<h3>구매품 등록</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<input type="button" value="목록으로" onclick="location.href='../equipment/equipment_list'">
					<form name="frm" action="./purchaseEquipRegister" method="POST">
						<table border="1">
							<tr>
								<th>구매 번호</th>
								<td>
									<input type="text" id="purchase_num" name="purchase_num" readonly="readonly" value="${purchaseSeq}"> 
								</td>
							<tr>
							<tr>
								<th>재정 코드</th>
								<td>
									<input type="text" id="finance_cls" name="finance_cls" readonly="readonly">
									<input type="hidden" id="finance_num" name="finance_num">
									<input type="button" value="조회" id="finance_select">
								</td>
							</tr>
							<tr>
								<th>구매자</th>
								<td>
									<input type="text" id="staff_name" name="staff_name" value="${staff_name}" readonly="readonly">
									<input type="hidden" id="staff_num" name="staff_num" value="${staff_num}">
								</td>
							</tr>
							<tr>
								<th>자산번호</th>
								<td>
									<input type="text" id="equipment_num" name="equipment_num" readonly="readonly" value="${equipSeqNum}">
								</td>
							</tr>
							<tr>
								<th>분류 항목</th>
								<td>
									<input type="text" id="equip_cls_name" name="equip_cls_name" readonly="readonly">
									<input type="hidden" id="equip_cls_num" name="equip_cls_num">
									<input type="button" id="equip_cls_sel" value="선택">
								</td>
							</tr>
							<tr>
								<th>비품명</th>
								<td>
									<input type="text" id="equipment_name" name="equipment_name">
								</td>
							</tr>
							<tr>
								<th>구매 일자</th>
								<td>
									<input type="date" id="purchase_date" name="purchase_date">
								</td>
							</tr>
							<tr>
								<th>구매 가격</th>
								<td>
									<input type="text" id="purchase_price" name="purchase_price">
								</td>
							</tr>
							<tr>
								<th>구매 수량</th>
								<td>
									<input type="number" id="purchase_count" name="purchase_count" value="1" min="1">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" value="등록" id="register">
								</td>
							</tr>	
						</table>
					</form>
				</div>
			</section>
	</article>	

<%@include file="../include/footer.jsp" %>
</body>
</html>