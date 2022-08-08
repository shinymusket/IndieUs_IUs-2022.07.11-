<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재정 관리</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
//만들어진 테이블에 페이지 처리
function page(){ 
	
	var reSortColors = function($table) {
	  $('tbody tr:odd td', $table).removeClass('even').removeClass('listtd').addClass('odd');
	  $('tbody tr:even td', $table).removeClass('odd').removeClass('listtd').addClass('even');
	 };
	 $('table.paginated').each(function() {
	  var pagesu = 10;  //페이지 번호 갯수
	  var currentPage = 0;
	  var numPerPage = 15;  //목록의 수
	  var $table = $(this);    
	  
	  //length로 원래 리스트의 전체길이구함
	  var numRows = $table.find('tbody tr').length;
	  //Math.ceil를 이용하여 반올림
	  var numPages = Math.ceil(numRows / numPerPage);
	  //리스트가 없으면 종료
	  if (numPages==0) return;
	  //pager라는 클래스의 div엘리먼트 작성
	  var $pager = $('<td align="center" id="remo" colspan="10"><div class="pager"></div></td>');
	  
	  var nowp = currentPage;
	  var endp = nowp+10;
	  
	  //페이지를 클릭하면 다시 셋팅
	  $table.bind('repaginate', function() {
	  //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	  
	   $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	   $("#remo").html("");
	   
	   if (numPages > 1) {     // 한페이지 이상이면
	    if (currentPage < 5 && numPages-currentPage >= 5) {   // 현재 5p 이하이면
	     nowp = 0;     // 1부터 
	     endp = pagesu;    // 10까지
	    }else{
	     nowp = currentPage -5;  // 6넘어가면 2부터 찍고
	     endp = nowp+pagesu;   // 10까지
	     pi = 1;
	    }
	    
	    if (numPages < endp) {   // 10페이지가 안되면
	     endp = numPages;   // 마지막페이지를 갯수 만큼
	     nowp = numPages-pagesu;  // 시작페이지를   갯수 -10
	    }
	    if (nowp < 1) {     // 시작이 음수 or 0 이면
	     nowp = 0;     // 1페이지부터 시작
	    }
	   }else{       // 한페이지 이하이면
	    nowp = 0;      // 한번만 페이징 생성
	    endp = numPages;
	   }
	   // [처음]
	   $('<br /><span class="page-number" cursor: "pointer">[처음]</span>').bind('click', {newPage: page},function(event) {
	          currentPage = 0;   
	          $table.trigger('repaginate');  
	          $($(".page-number")[2]).addClass('active').siblings().removeClass('active');
	      }).appendTo($pager).addClass('clickable');
	    // [이전]
	      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[이전]&nbsp;</span>').bind('click', {newPage: page},function(event) {
	          if(currentPage == 0) return; 
	          currentPage = currentPage-1;
	    $table.trigger('repaginate'); 
	    $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	    // [1,2,3,4,5,6,7,8]
	   for (var page = nowp ; page < endp; page++) {
	    $('<span class="page-number" cursor: "pointer" style="margin-left: 8px;"></span>').text(page + 1).bind('click', {newPage: page}, function(event) {
	     currentPage = event.data['newPage'];
	     $table.trigger('repaginate');
	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	     }).appendTo($pager).addClass('clickable');
	   } 
	    // [다음]
	      $('<span class="page-number" cursor: "pointer">&nbsp;&nbsp;&nbsp;[다음]&nbsp;</span>').bind('click', {newPage: page},function(event) {
	    if(currentPage == numPages-1) return;
	        currentPage = currentPage+1;
	    $table.trigger('repaginate'); 
	     $($(".page-number")[(currentPage-nowp)+2]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	    // [끝]
	   $('<span class="page-number" cursor: "pointer">&nbsp;[끝]</span>').bind('click', {newPage: page},function(event) {
	           currentPage = numPages-1;
	           $table.trigger('repaginate');
	           $($(".page-number")[endp-nowp+1]).addClass('active').siblings().removeClass('active');
	   }).appendTo($pager).addClass('clickable');
	     
	     $($(".page-number")[2]).addClass('active');
	reSortColors($table);
	  });
	   $pager.insertAfter($table).find('span.page-number:first').next().next().addClass('active');   
	   $pager.appendTo($table);
	   $table.trigger('repaginate');
	 });
};


$(function(){
	function addComma(value){
		result = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); 
        return result;
    };
		
	function getList() {
		$.ajax({
			url : "/ius/finance/get_finance_list",
			type : "POST",
			data : {
				
			},
			success: function(data) {
				$("#list").text("");
				values = data.financeList;
				output = "<tr><th>재정 코드</th><th>회계 년도</th><th>예산 항목</th><th>교직원명</th><th>집행 날짜</th><th>항목</th><th>구분</th><th>집행 금액</th></tr>";				
				$.each(values, function(index, value) {
					
					if (value.finance_iE == 'In') {
						financeType = '수입';
					} else if (value.finance_iE == 'Ex') {
						financeType = '지출';
					}
					
					output += "<tr>";
					output += "<td>" + value.finance_num + "</td>";
					output += "<td>" + value.finance_eYear + "</td>";
					output += "<td>" + value.budget_cls + "</td>";
					output += "<td>" + value.staff_name + "</td>";
					output += "<td>" + value.finance_eDate + "</td>";
					output += "<td><a href='../finance/finance_info?finance_num=" + value.finance_num + "'>" + value.finance_cls + "</a></td>";
					output += "<td>" + financeType + "</td>";
					output += "<td>" + addComma(value.finance_amount) + "</td>";
					output += "</tr>";
				});
				
				$("#list").html(output);
				page();
			}
			
		})
		
	}
	getList();
	
	$("#yearSearch").click(function(){
		if ($("#finance_year").val() == "") {
			alert("년도를 선택하세요.");
			$("#finance_year").val().focus();
			return;
		};
		
		financeYear = $("#finance_year").val();
		
		var objParams = {
				seachYear : $("#finance_year").val(),
				finance_type : $("#finance_type").val()
		}
		
		var values = [];
		
		$.post(
			"/ius/finance/get_finance_list_by_year",
			objParams,
			function(retVal) {
				$("#list").text("");
				$("#financeYear").text("");
				$("#totalIncome").text("");
				$("#totalExpense").text("");
				$("#balance").text("");
	
				values = retVal.financeList;
				totalIncome = retVal.totalIncome;
				totalExpense = retVal.totalExpense;
				balance = (totalIncome-totalExpense);
				
				output = "<tr><th>재정 코드</th><th>회계 년도</th><th>예산 항목</th><th>교직원명</th><th>집행 날짜</th><th>항목</th><th>구분</th><th>집행 금액</th></tr>";				
				$.each(values, function(index, value) {
					if (value.finance_iE == 'In') {
						financeType = '수입';
					} else if (value.finance_iE == 'Ex') {
						financeType = '지출';
					}
					
					
					output += "<tr>";
					output += "<td>" + value.finance_num + "</td>";
					output += "<td>" + value.finance_eYear + "</td>";
					output += "<td>" + value.budget_cls + "</td>";
					output += "<td>" + value.staff_name + "</td>";
					output += "<td>" + value.finance_eDate + "</td>";
					output += "<td><a href='../finance/finance_info?finance_num=" + value.finance_num + "'>" + value.finance_cls + "</a></td>";
					output += "<td>" + financeType + "</td>";
					output += "<td>" + addComma(value.finance_amount) + "</td>";
					output += "</tr>";
				});
				
				$("#financeYear").html(financeYear);
				$("#totalIncome").html(addComma(totalIncome));
				$("#totalExpense").html(addComma(totalExpense));
				$("#balance").html(addComma(balance));
				$("#list").html(output);
				
				page();
			}
		)
	});
	
})
</script>
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	<article>
			<div id="title_bar">
				<p>경영 정보</p>
				<h3>재정 관리</h3>
			</div>
	
			
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<select name="finance_year" id="finance_year">
						<option value="">--년도--</option>
						<c:if test="${financeYearList != null}">
							<c:forEach items="${financeYearList}" var="financeYear">
								<option value="${financeYear}">${financeYear}년도</option>
							</c:forEach>	
						</c:if>
					</select>
					
					<select name="finance_type" id="finance_type">
						<option value="total">전체</option>
						<option value="In">수입</option>
						<option value="Ex">지출</option>
					</select>
					
					<input type="button" value="검색" id="yearSearch">
					<br>
					<input type="button" value="예산 항목" onclick="location.href='../budget/budget_list'">
					<input type="button" value="수입 등록" onclick="location.href='../finance/finance_register_form?iE=In'">
					<input type="button" value="지출 등록" onclick="location.href='../finance/finance_register_form?iE=Ex'">
					
					<table border="1" id="finalAccount">
						<tr>
							<th>회계 년도</th>
							<th>총 수입</th>
							<th>총 지출</th>
							<th>잔액</th>
						</tr>	
						<tr>
							<td id="financeYear"></td>
							<td id="totalIncome"></td>
							<td id="totalExpense"></td>
							<td id="balance"></td>
						</tr>
					</table>
					<table border="1" id="list" class="tbl paginated"></table>
				</div>
			</section>
	</article>	
<%@include file="../include/footer.jsp" %>	
</body>
</html>