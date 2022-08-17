<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차 신청서</title>
<link rel="stylesheet" href="${path}/resources/eworks_board_css/vacationRequest.css">
<link rel="stylesheet" href="${path}/resources/css/articleF.css">
</head>
<body>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
<article>
		<div id="title_bar">
			<p>경영 정보</p>
			<h3>전자 결재</h3>
		</div>
	
			<div id="title_top">
			</div>
			
		<section>
				<div id="content">
					    <h1>연차 신청서</h1>
					    <form action="./vacation_Register" method="post">
					        <table id="order_info">
					            <tr>
					                <th>기 안 자</th>
					                <td>${staff_name} </td>
					            </tr>
					            
					             <tr>
					            <th>사 번 </th>
					            <td ><input type="text" value ="${staff_num}" id="staff_num" name="staff_num" readonly>
					            </td>
					            </tr>
					            
					            <tr>
					                <th>기 안 일</th>
					                <td>
					                   <script type="text/javascript">
					               
					               let today = new Date();   
					               document.write(today.toLocaleString() + '<br><br>');
					               </script>
					                
					                 </td>
					            </tr>
					            <tr>
					               <th>문서번호</th>
					               <td><input type="hidden" value ="${workNum}" id="workNum">
					               ${nextSeq}</td>
					            </tr>
					        </table>
					        
					        <table id="order_state">
					            <tr>
					                <th>신청</th>
					                <th>승인</th>
					            </tr>
					            <tr>
					                <td>
					        <input type="text" value ="${staff_name}"id="staff_name" name="staff_name" readonly>
					                </td>
					                <td></td>
					            </tr>
					        </table>
					        
					        <table id="vaca_table">
					        	<tr>
					                <th>제 목</th>
					                <td><input type="text" name="doc_Sub" id="doc_Sub"></td>
					            </tr>
					            <tr>
					                <th>휴가 종류</th>
					                <td><input type="text" name="vacation_cat" id="vacation_cat"></td>
					            </tr>
					            
					            <tr>
					                <th>기간 및 일시</th>
					                <td><input type="text" name="vacation_period" id="vacation_period"></td>
					            </tr>
					          
					            <tr>
					                <th>휴가 사유</th>
					                <td>
					                    <textarea rows="20" cols="100%" name="vacation_reason" id="vacation_reason"></textarea>
					                </td>
					            </tr>
					
					        </table>
					        <input type="submit" value="등록">
					        <input type="reset" value="다시 작성" onclick="location.href='../board/vacation_draft_form'">
					        <input type="button" value="목록" onclick="location.href='../board/board_list'">
					    </form>
			</div>
		</section>
	</article>					    
    </body>
    <%@include file="../include/footer.jsp" %>
    </html>