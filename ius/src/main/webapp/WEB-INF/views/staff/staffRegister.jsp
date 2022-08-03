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
			$("#staff_picFile").change(function(){
				if(this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result).width(94.4);
					}
					reader.readAsDataURL(this.files[0]);
				}	
			});
	
			var currentDate  = new Date().toISOString().substring(0, 10);
			$("#staff_hireD").val(currentDate);
			
			//키를 누르거나 떼었을때 이벤트 발생
		    $("#staff_salary").bind('keyup keydown',function(){
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
		
		
			$("#staff_idChk").click(function(){
				if ($("#staff_id").val() == "") {
					alert("아이디를 입력해주세요.");
					$("#staff_id").val().focus();
					return;
				};
				
				var userIdCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/); // 아이디 유효성 검사 정규식
				
				if(!userIdCheck.test($("#staff_id").val())) {
					alert("아이디는 영문 대소문자, 숫자 5자리 이상 20자리 이하로 입력하여야 합니다.");
					$("#staff_id").val().focus();
					return;
				};
	
				
				
				let url = "./staff_id_check?staff_id=" + $("#staff_id").val();
				window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbar=yes, resizeable=no, width=450, height=200");
					
			});
		
		
		    $("#register").click(function(){
		    	var email = $("#staff_email").val();
		    	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		    	
		   
			if ($("#staff_cls").val() == "") {
				alert("직무를 선택해주세요.");
				$("#staff_cls").val().focus();
				return;
			};
			
			if ($("#staff_id").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#staff_id").val().focus();
				return;
			};
			
			if ($("#staff_name").val() == "") {
				alert("이름을 입력해주세요.");
				$("#staff_name").val().focus();
				return;
			};
			
			if ($("#staff_rrn1").val() == "" || $("#staff_rrn2").val() == "") {
				alert("주민등록번호를 입력해주세요.");
				$("#staff_rrn").val().focus();
				return;
			};
			
			if ($("#staff_rrn1").val().length != 6) {
				alert("주민등록번호 앞자리 입력이 잘못되었습니다.");
				$("#staff_rrn1").val().focus();
				return;
			};
			
			if ($("#staff_rrn2").val().length != 7) {
				alert("주민등록번호 뒷자리 입력이 잘못되었습니다.");
				$("#staff_rrn2").val().focus();
				return;
			};
			
			if (email == "") {
				alert("이메일은 필수 입력 항목입니다.");
				$("#staff_email").val().focus();
				return;
			} else if (exptext.test(email) == false) {
				alert("이메일 형식이 올바르지 않습니다.");
				$("#staff_email").val().focus();
				return;
			};
			
			if ($("#staff_reid").val().length == 0 || $("#staff_reid").val() != $("#staff_id").val()) {
				alert("아이디 중복 검사를 하지 않았습니다.");
				$("#staff_idChk").val().focus();
				return;
			};
			
			
			
			value = cf_getNumberOnly ($("#staff_salary").val());
			
			$("#staff_salary").val(value);
			$("form").submit();
			
		});
		
		$("#staff_cls_edit").click(function(){
			url = "./job_class_Edit";
			window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbar=yes, resizeable=no, width=550, height=400");
		});
		
	})
	
</script>
<title>교직원 등록</title>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	<article>
	<!-- 왼쪽 소제목 박스 (타이틀 써 주시면 됩니다) -->
		<div id="title_bar">
			<p>경영 정보</p>
			<h3>교직원 등록</h3>
		</div>

		<!-- 오른쪽 기능 박스 (검색 등등 필요없으면 div 안에 내용 지워도 무방)-->
		<div id="title_top">
		</div>

		<section>
			<div id="content">
				<input type="button" value="목록으로" onclick="location.href='./staff_list'">
				<form action="./staff_register" method="POST" name="frm" enctype="multipart/form-data">
					<table border="1">
						<tr>
							<th>교직원 코드</th>
							<td>
								<input type="text" name="staff_num" id="staff_num" value="${nextSeq}" readonly="readonly">
							</td>
							<th>직무*</th>
							<td>
								<input type="hidden" name="staff_cls" id="staff_cls">
								<input type="text" name="job_Kname" id="job_Kname" readonly="readonly">
								<input type="button" id="staff_cls_edit" value="선택">
							</td>
						</tr>
						<tr>
							<th>아이디*</th>
							<td>
								<input type="text" name="staff_id" id="staff_id">
								<input type="hidden" name="staff_reid" id="staff_reid">
								<input type="button" value="아이디 중복 검사" name="staff_idChk" id="staff_idChk">
							</td>
							<th>이름*</th>
							<td>
								<input type="text" name="staff_name" id="staff_name"> 
							</td>
						</tr>
						<tr>
							<th colspan="2">프로필 사진</th>
							<td colspan="2">
								<input type="file" name="staff_picFile" id="staff_picFile">
								<div class="select_img">
									<img src="">
								</div>
							</td>
						</tr>
						<tr>
							<th>주민등록번호*</th>
							<td>
								<input type="text" name="staff_rrn1" id="staff_rrn1" placeholder="ex)110011">
								-
								<input type="text" name="staff_rrn2" id="staff_rrn2" placeholder="0000000">
							</td>
							<th>주소</th>
							<td>
								<input type="text" name="staff_addr" id="staff_addr">
							</td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td>
								<input type="text" name="staff_zipcode" id="staff_zipcode">
							</td>
							<th>연락처</th>
							<td>
								<input type="tel" name="staff_tel" id="staff_tel">
							</td>
						</tr>
						<tr>
							<th>입사일</th>
							<td>
								<input type="date" name="staff_hireD" id="staff_hireD">
							</td>
							<th>퇴사일</th>
							<td>
								<input type="date" name="staff_retireD" id="staff_retireD">
							</td>
						</tr>
						<tr>
							<th>재직여부*</th>
							<td>
								<select name="staff_workYn" id="staff_workYn">
									<option value="Y">재직</option>
									<option value="P">휴직</option>
									<option value="N">퇴사</option>
								</select>
							</td>
							<th>월급</th>
							<td>
								<input type="text" name="staff_salary" id="staff_salary" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"> 
							</td>
						</tr>
						<tr>
							<th colspan="2">이메일*</th>
							<td colspan="2">
								<input type="email" name="staff_email" id="staff_email">
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<input type="button" id="register" value="등록"> 
								<input type="reset" value="취소">
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