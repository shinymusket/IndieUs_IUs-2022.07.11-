<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 신청서</title>
<link rel="stylesheet" href="${path}/resources/eworks_board_css/buyOrder.css">
<link rel="stylesheet" href="${path}/resources/css/articleF.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
   
				 <h1>구매 신청서</h1>
								   <form method="GET" name="buy_info">
								       <table id="order_info">
								           <tr>
								               <th>기 안 자</th>
								                <td ><input type="text" value ="${buyinfo.staff_name}" id="staff_name" name="staff_name" readonly>
								              </td>
								               <td ></td>
								           </tr>
								           <tr>
								               <th>사 번 </th>
								    	    <td ><input type="text" value ="${buyinfo.staff_num}" id="staff_num" name="staff_num" readonly>
								              </td>
								           </tr>
								           <tr>
								               <th>기 안 일</th>
								               <td>
								           		  ${buyinfo.workUpDate}
								                </td>
								           </tr>
								           <tr>
								               <th>문서번호</th>
								               <td>
								               ${buyinfo.workNum}
								             </td>
								           </tr>
								       </table>
								       
								       <table id="order_state">
								           <tr>
								               <th>기안</th>
								               <th>승인</th>
								           </tr>
								           <tr>
								               <td>
								               ${buyinfo.staff_name}
								          	  ${buyinfo.workUpDate}
								               </td>
								               <td>
								               <p>결재 완료</p>
								               ${buyinfo.workDowndate}
								               </td>
								           </tr>
								       </table>
								       
								       <table id="doc_title">
								           <tr>
								               <th>제목</th>
								              
								               <td>
								                ${buyinfo.doc_Sub}
								                
								             
								        	  </tr>
								       </table>
								       <table id="order_list">
								           <thead>
								               <tr>
								                   <td colspan="7" id="add_button_td">
								                   </td>
								               </tr>
								               <tr>
								                   <th>품 명</th>
								                   <th>수 량</th>
								                   <th>단 가</th>
								                   <th>금 액</th>
								               </tr>
								           </thead>
								           
								           <tbody>
								           
								               <tr	class="input_order_list">
								                   <td>
								                   ${buyinfo.product_name}
								                   </td>
								                  
								                   <td>
								                    ${buyinfo.product_amount}
								                   </td>
								                   
								                   <td>
								                      ${buyinfo.product_pay}
								                   </td>
								                   
								                   <td>
								                       ${buyinfo.product_money}
								                   </td>
								               </tr>
								           </tbody>
								           <tfoot>
								               <tr>
								                   <th colspan="2">합계</th>
								                   <td></td>
								                   <td></td>
								                   <td></td>
								                   <td></td>
								               </tr>
								           </tfoot>
								       </table>
								           
								       <table id="total_etc">
								           <tr>
								               <th>기타</th>
								               <td colspan="6" >
								               ${buyinfo.etc}
								               </td>
								           </tr>
								       </table>
								       <button type="submit" onclick="javascript: form.action='./buy_order_adapt'">결재</button>
								 	   <button type="submit" onclick="javascript: form.action='./buy_order_refer'">반려</button>
								       <input type="button" value="목록" onclick="location.href='../board/board_list'">
								  
								</form>
  				</div>
		</section>
	</article>
	 
</body>
<%@include file="../include/footer.jsp" %>
</html>