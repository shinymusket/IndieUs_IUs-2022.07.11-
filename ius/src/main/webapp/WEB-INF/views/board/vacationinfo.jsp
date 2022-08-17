<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연차 신청서 상세보기</title>
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
					    <form method="GET" name="vacation_info">
					        <table id="order_info">
					            <tr>
					                <th>기 안 자</th>
					                <td>${vacationinfo.staff_name} </td>    
					            </tr>
					            
					             <tr>
					            <th>사 번 </th>
					            <td >
					           ${vacationinfo.staff_num}
					            </td>
					            </tr>
					            
					            <tr>
					                <th>기 안 일</th>
					                <td>
					               ${vacationinfo.workUpDate}
					                 </td>
					            </tr>
					            <tr>
					               <th>문서번호</th>
					              <td>
					                ${vacationinfo.workNum}
					             </td>
					            </tr>
					        </table>
					        
					        <table id="order_state">
					            <tr>
					                <th>신청</th>
					                <th>승인</th>
					            </tr>
					            <tr>
					                <td>
							         <p>${vacationinfo.staff_name}</p>
							        <p> ${vacationinfo.workUpDate}</p>
					                </td>
					                <td>
					                <p>결재 완료</p>
					                ${vacationinfo.workDownpdate}
					                </td>
					            </tr>
					        </table>
					        
					        <table id="vaca_table">
					        	<tr>
					                <th>제 목</th>
					                <td>
					               ${vacationinfo.doc_Sub}
					               </td>
					            </tr>
					            <tr>
					                <th>휴가 종류</th>
					                
					                <td>
					                ${vacationinfo.vacation_cat}
					              
					            </tr>
					            
					            <tr>
					                <th>기간 및 일시</th>
				                <td>
					                ${vacationinfo.vacation_period}
					                
					            </tr>
					          
					            <tr>
					                <th>휴가 사유</th>
					                <td>
					                ${vacationinfo.vacation_reason}
					                </td>
					            </tr>
					
					        </table>
					         <button type="submit" onclick="javascript: form.action='./vacation_adapt'">결재</button>
					 	     <button type="submit" onclick="javascript: form.action='./vacation_refer'">반려</button>
					         <input type="button" value="목록" onclick="location.href='../board/board_list'">
					    </form>
	   				</div>
		</section>
	</article>				    
    </body>
     <%@include file="../include/footer.jsp" %>
    </html>