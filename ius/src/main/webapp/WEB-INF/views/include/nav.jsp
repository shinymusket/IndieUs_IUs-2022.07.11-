<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<nav>
            <div id="logo">
                <a href="../main/"><img src="<spring:url value='/resources/logoImg/ius_logo1.png' />" width="200px"></a>
            </div>
            <ul id="sideMenu">
                <li>
                    <a href="#">경영 정보</a>
                    <ul>
                        <li><a href="../staff/staff_list"><span>교직원 관리</span></a></li>
                        <li><a href="../equipment/equipment_list"><span>시설 관리</span></a></li>
                        <li><a href="../board/board_list"><span>전자 결재</span></a></li>
                        <li><a href="#"><span>셔틀버스 관리</span></a></li>
                        <li><a href="../meal/meal_list"><span>식단 관리</span></a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">회계 정보</a>
                    <ul>
                        <li><a href="../finance/finance_list"><span>재정 관리</span></a></li>
                    </ul>
                </li>
                <li>
                    <a href="../kinder/kinder_list">원생 정보</a>
                </li>
                <li>
                    <a href="#">그룹웨어</a>
                    <ul>
                        <li><a href="#"><span>공지사항</span></a></li>
                        <li><a href="#"><span>행사 및 일정</span></a></li>
                    </ul>
                </li>
                <li>
                    <a href="#">고객지원</a>
                </li>
            </ul>
            <br>
            <p class="copyright">Copyright © 2022.<br> Ius All Rights Reserved.</p>
        </nav>