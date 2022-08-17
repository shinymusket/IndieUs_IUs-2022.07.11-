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

<script>
        
        $(document).ready(function() {
            var wrapper = $("#order_list");
            var add_button = $(".add_order_button");

            $(add_button).click(function(e) {
                e.preventDefault();
                    $("#order_list > tbody").append("<tr class='input_order_list'>"
                            +"<td><input type='text'></td>"
                            +"<td><input type='text'></td>"
                            +"<td><input type='text'></td>"
                            +"<td><input type='text'></td>"
                            +"<td class='del_button'><input type='button' value='삭제'></td></tr>");
            });
            
            $(wrapper).on("click", ".del_button", function(e) {
                e.preventDefault();
                $(this).parent('.input_order_list').remove();
            })
        });
        
      
        
    </script>
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
								   <form action="./buy_order_Register" method="POST">
								       <table id="order_info">
								           <tr>
								               <th>기 안 자</th>
								               <td >${staff_name}</td>
								           </tr>
								           <tr>
								               <th>사 번 </th>
								               <td ><input type="text" value ="${staff_num}" id="staff_num" name="staff_num" readonly>
								               </td>
								           </tr>
								           <tr>
								               <th>기 안 일</th>
								               <td>
								              
								            	 <script>
									               let today = new Date();   
									               document.write(today.toLocaleString() + '<br><br>');
									               </script>		
								                </td>
								           </tr>
								           
								           <tr>
								               <th>문서번호</th>
								               <td> ${nextSeq}</td>
								           </tr>
								       </table>
								       
								       <table id="order_state">
								           <tr>
								               <th>기안</th>
								           </tr>
								           <tr>
								               <td>
								               <input type="text" value ="${staff_name}"id="staff_name" name="staff_name" readonly>
								               <br>
									               <script>
									               let today = new Date();   
									               document.write(today.toLocaleString() + '<br><br>');
									               </script>		
								               </td>
								               
								           </tr>
								       </table>
								       
								       <table id="doc_title">
								           <tr>
								               <th>제목</th>
								               <td><input type="text" name="doc_Sub" id="doc_Sub"></td>
								           </tr>
								           
								       </table>
								       
								       <table id="order_list">
								           <thead>
								               <tr>
								                   <td colspan="7" id="add_button_td">
								                       <input type="button" value="추가" class="add_order_button">
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
								                       <input type="text" name = "product_name" id="product_name">
								                   </td>
								                  
								                   <td>
								                       <input type="text" name = "product_amount" id="product_amount">
								                   </td>
								                   
								                   <td>
								                       <input type="text" name = "product_pay" id="product_pay">
								                   </td>
								                   
								                   <td>
								                       <input type="text" name = "product_money" id="product_money">
								                   </td>
								                   
								                  
								                   <td class="del_button">
								                   
								                       <input type="button" value="삭제">
								                       
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
								               <td colspan="6">
								                   <textarea rows="10" cols="100%" id="etc" name="etc"></textarea>
								               </td>
								           </tr>
								       </table>
								       <input type="submit" value="등록">
								       <input type="reset" value="다시 작성" onclick="location.href='../board/buy_draft_form'">
								       <input type="button" value="목록" onclick="location.href='../board/board_list'">
								  
								  
								  	 </form>
   						</div>
			</section>
</article>
 
</body>
<%@include file="../include/footer.jsp" %>
</html>