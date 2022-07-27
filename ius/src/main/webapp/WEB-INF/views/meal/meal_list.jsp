<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%
	Calendar cal = Calendar.getInstance();
	
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	int year = cal.get(Calendar.YEAR); 
	int month = cal.get(Calendar.MONTH);
	int date = cal.get(Calendar.DATE);
	
	if(strYear != null)
	{
	  year = Integer.parseInt(strYear);
	  month = Integer.parseInt(strMonth);
	  
	}
	

	//년도 / 월 셋팅
	cal.set(year, month, 1);
	
	int startDay = cal.getMinimum(Calendar.DATE);
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int start = cal.get(Calendar.DAY_OF_WEEK);
	int newLine = 0;

	// 오늘 날짜 저장
/* 	SimpleDateFormat dateFormet = new SimpleDateFormat("yyyyMMdd");
	String intToday = dateFormet.format(cal.getTime()); */

%>
<html lang="ko">
<HEAD>
<TITLE>캘린더</TITLE>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<script type="text/javaScript" language="javascript"></script>
<style TYPE="text/css">
		body {
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}

		td {color:#595959;}
		th {color:#000000;}


A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}

</style>
</HEAD>
<BODY>
<form name="calendarFrm" id="calendarFrm" action="" method="post">

<DIV id="content" style="width:900px">
<table width="100%" border="0" cellspacing="1" cellpadding="1">
	<tr>
		<td align ="right">
			<input type="button" onclick="location.href='./meal_list'" value="오늘"/>
			<input type="button" onclick="location.href='../meal/addMealMenu'" value="식단 등록"/>
		</td>
	
	</tr>
</table>

<!--날짜 네비게이션  -->

<table width="100%" border="0" cellspacing="1" cellpadding="1" bgcolor="#F3F9D7"  style="border:1px solid #CED99C">
	<tr>
		<td align="center" >
			<!-- 이전 년도 -->
			<a href="<c:url value='./meal_list' />?year=<%=year-1%>&amp;month=<%=month%>" target="_self">
				<b>&lt;&lt;</b>
			</a>
			
			<!-- 이전 달 -->
			<%if(month > 0 ){ %>
			<a href="<c:url value='./meal_list' />?year=<%=year%>&amp;month=<%=month-1%>" target="_self">
				<b>&lt;</b>
			</a>
			<%} else {%>
				<b>&lt;</b>
			<%} %>
			
			&nbsp;&nbsp;
			<%=year%>년
			
			<%=month+1%>월
			&nbsp;&nbsp;
			
			<!-- 다음 달 -->
			<%if(month < 11 ){ %>
			<a href="<c:url value='./meal_list' />?year=<%=year%>&amp;month=<%=month+1%>" target="_self">
				<b>&gt;</b>
			</a>
			<%}else{%>
				<b>&gt;</b>
			<%} %>
			
			<!-- 다음 년도 -->
			<a href="<c:url value='./meal_list' />?year=<%=year+1%>&amp;month=<%=month%>" target="_self">
				<b>&gt;&gt;</b>
			</a>
		</td>
	</tr>
	</table>
	
<br>

<table width="100%" border="1px" cellspacing="1" cellpadding="1" bgcolor="#FFFFFF">
	<THEAD>
		<TR bgcolor="#CECECE">
			<TD width='100px'>
			<DIV align="center"><font color="red">일</font></DIV>
			</TD>
			<TD width='100px'>
			<DIV align="center">월</DIV>
			</TD>
			<TD width='100px'>
			<DIV align="center">화</DIV>
			</TD>
			<TD width='100px'>
			<DIV align="center">수</DIV>
			</TD>
			<TD width='100px'>
			<DIV align="center">목</DIV>
			</TD>
			<TD width='100px'>
			<DIV align="center">금</DIV>
			</TD>
			<TD width='100px'>
			<DIV align="center"><font color="#529dbc">토</font></DIV>
			</TD>
		</TR>
	</THEAD>
	<TBODY>
		<TR>
		<%
		
		// 달력 시작 빈공란 표시
		for(int index = 1; index < start ; index++ ) {
		  out.println("<TD >&nbsp;</TD>");
		  newLine++;
		}
		
			
		for(int index = 1; index <= endDay; index++)
		{
			String color = "";
			
			if(newLine == 0){			color = "RED";
			}else if(newLine == 6){ 	color = "#529dbc";
			}else{						color = "BLACK"; };
		
			String thisDate = Integer.toString(year);
		
			thisDate += Integer.toString(month+1).length() == 1 ? "-0" + Integer.toString(month+1) : "-" + Integer.toString(month+1);
			thisDate += Integer.toString(index).length() == 1 ? "-0" + Integer.toString(index) + " 00:00:00" : "-" + Integer.toString(index) + " 00:00:00";
			
			request.setAttribute("thisDate", thisDate);
			
			String backColor = "#EFEFEF";
		
			out.println("<TD valign='top' align='left' height='92px' bgcolor='"+backColor+"' nowrap>");
			%>
			
			<font color="<%=color%>">
				<%=index %>
			</font>
			
			<c:forEach items="${menuList}" var="list">
				<c:if test="${list.menu_edate eq thisDate}">
					<c:if test="${list.meal_code eq 'B'}">
						<div>
						오전 간식<br>
						${list.meal_menu}
						</div>
						<br>
					</c:if>
					<c:if test="${list.meal_code eq 'L'}">
						<div>
						점심<br>
						${list.meal_menu}
						</div>
						<br>
					</c:if>
					
					<c:if test="${list.meal_code eq 'S'}">
					오후 간식<br>
						<div>
						${list.meal_menu}
						</div>
						<br>
					</c:if>
				</c:if>	
			</c:forEach>
			
			<%
			
			out.println("</TD>");
			newLine++;
		
			// 일주일 표시
			if(newLine == 7)
			{
			  out.println("</TR>");
			  if(index <= endDay)
			  {
			    out.println("<TR>");
			  }
			  newLine=0;
			}
			
		}
		
		// 달 마지막 공란 Loop 그리기
		while(newLine > 0 && newLine < 7)
		{
		  out.println("<TD></TD>");
		  newLine++;
		}
		%>
		</TR>
	
	</TBODY>
</TABLE>
</DIV>
</form>
</BODY>
</HTML>
