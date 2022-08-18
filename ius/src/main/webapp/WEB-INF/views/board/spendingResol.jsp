<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>법인카드 지출 결의서</title>
<link rel="stylesheet" href="${path}/resources/eworks_board_css/spendingResol.css">
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


						    <h1>법인카드 지출결의서</h1>
						<form action="./spend_Register" method="post">
						    <table id="order_info">
						        <tr>
						            <th>기 안 자</th>
						            <td>
						            <input type="text" value ="${staff_name}" id="staff_name" name="staff_name" readonly>
						            </td>
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
						             <td>
						             ${nextSeq}
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
						           		${staff_name}
						              <script>
							               let today = new Date();   
							               document.write(today.toLocaleString() + '<br><br>');
						               </script>	
						            </td>
						            <td></td>
						        </tr>
						    </table>
						    
						    <table id="doc_title">
						        <tr>
						            <th>제목</th>
						            <td><input type="text" name="doc_Sub"  id="doc_Sub" >
						             </td>
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
						                <th>일 자</th>
						                <th>분 류</th>
						                <th>사용 내역</th>
						                <th>금 액</th>
						                <th colspan="2">비 고</th>
						            </tr>
						        </thead>
						        <tbody>
						            <tr	class="input_order_list">
						                <td>
						                	
						                    <input type="text"  name="spend_day" id="spend_day">
						                </td>
						                <td>
						                	
						                    <input type="text" name="spend_cat" id="spend_cat">
						                </td>
						                <td>
						                	
						                    <input type="text"  name="spend_list" id="spend_list">
						                </td>
						                <td>
						                	
						                    <input type="text"  name="spend_pay" id="spend_pay">
						                </td>
						                <td>
						                	
						                    <input type="text"  name="etc"  id="etc">
						                </td>
						                
						            </tr>
						        </tbody>
						        <tfoot>
						            <tr>
						                <th colspan="3">합계</th>
						                <td colspan="3"></td>
						            </tr>
						        </tfoot>
						    </table>
						        
						    <table id="total_etc">
						        <tr>
						            <th>지출 사유</th>
						            <td colspan="6">
						                <textarea rows="10" cols="100%"  name="spend_reason" id="spend_reason"></textarea>
						            </td>
						        </tr>
						    </table>
						    <input type="submit" value="등록">
						    <input type="reset" value="다시 작성" onclick="location.href='../board/spend_draft_form'">
						        <input type="button" value="목록" onclick="location.href='../board/board_list'">
						</form>
						
					</div>
		</section>
</article>
 					
</body>
<%@include file="../include/footer.jsp" %>
</html>