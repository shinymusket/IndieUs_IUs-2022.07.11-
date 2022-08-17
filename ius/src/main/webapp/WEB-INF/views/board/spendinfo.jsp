<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지출 내역서</title>
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
				<form action="./spend_Register" method="GET">
				    <table id="order_info">
				        <tr>
				            <th>기 안 자</th>
				            <td>
				            ${spendinfo.staff_name}
				            </td>
				        </tr>
				         <tr>
				            <th>사 번 </th>
				            <td>
				            ${spendinfo.staff_num}
				            </td>
				        </tr>
				        <tr>
				            <th>기 안 일</th>
				           <td >
				           ${spendinfo.workUpDate}
				            </td>
				        </tr>
				        <tr>
				             <th>문서번호</th>
				          	 <td>
				            ${spendinfo.workNum}
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
				         	 <p>${spendinfo.staff_name}</p>
				              <p>${spendinfo.workUpDate}</p>
				            </td>
				            <td>
				               <p>결재 완료</p>
				               ${spendinfo.workDowndate}
				            </td>
				        </tr>
				    </table>
				    
				    <table id="doc_title">
				        <tr>
				            <th>제목</th>
				            <td>
					            ${spendinfo.doc_Sub}
				            </td>
				    	</tr>
				    </table>
				    
				    <table id="order_list">
				        <thead>
				            
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
				                   ${spendinfo.spend_day}
				                </td>
				                <td>
				                    ${spendinfo.spend_cat}
				                </td>
				                <td>
				                    ${spendinfo.spend_list}
				                </td>
				                <td>
				                    ${spendinfo.spend_pay}
				                </td>
				                <td>
				                    ${spendinfo.etc}
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
				            ${spendinfo.spend_reason}
				            
				            </td>
				        </tr>
				    </table>
				 	  <button type="submit" onclick="javascript: form.action='./spend_order_adapt'">결재</button>
				 	  <button type="submit" onclick="javascript: form.action='./spend_order_refer'">반려</button>
				     <input type="button" value="목록" onclick="location.href='../board/board_list'">
				</form>
			</div>
		</section>
	</article>
</body>
<%@include file="../include/footer.jsp" %>
</html>