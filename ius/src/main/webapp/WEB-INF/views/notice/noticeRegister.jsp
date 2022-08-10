<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${path}/resources/js/summernote/summernote-lite.js"></script>
<script type="text/javascript" src="${path}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link type="text/css" rel="stylesheet" href="${path}/resources/css/summernote/summernote-lite.css">
<link type="text/css" rel="stylesheet" href="${path}/resources/css/articleF.css?">
</head>
<style>
	#notice_title {
		height : 30px;
	 	width : 1238px;
	 	padding-left : 10px;
	 	margin-bottom : 10px;
	}
	
	#btn {
		width : 1238px;
	} 
	
	#register {
		display : inline-block;
		width : 50px;
		margin: 5px auto;
	}
</style>
<body>
<script type="text/javascript">
	var $jQ = jQuery.noConflict();
	$jQ(document).ready(function(){
		$jQ("#notice_content").summernote({
			height : 300,
			width : 1238,
			minHeight : null,
			maxHeight : null,
			focus : true,
			lang : "ko-KR",
			placeholder : '내용을 입력하세요'
		});
		
		$jQ("#register").click(function(){
			var notice_title =  $jQ("#notice_title").val();
			var notice_content = $jQ("#notice_content").val();
		})
		
		
		
		
		
		
		
			
	});
</script>
<%@include file="../include/header.jsp" %>
<%@include file="../include/nav.jsp" %>
	<article>
			<div id="title_bar">
				<p>공지사항</p>
				<h3>공지사항 등록</h3>
			</div>
	
			<div id="title_top">
			</div>
	
			<section>
				<div id="content">
					<div id="notice">
						<form action="./notice_register" method="POST">
							<input type="hidden">
							<input type="text" id="notice_title" name="notice_title" placeholder="제목">
							<textarea id="notice_content" name="notice_content"></textarea>
							
							<div id="btn">
								<input type="button" value="등록" id="register">
							</div>
						</form>
					</div>
				</div>
			</section>
	</article>	

<%@include file="../include/footer.jsp" %>
</body>

</html>