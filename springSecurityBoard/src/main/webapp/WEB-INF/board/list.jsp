<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath}/" />    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  
  <script type="text/javascript">
  
  $(document).ready(function() {
	   	    
		var regForm = $("#regForm");
  		 		
  		$("button").on("click", function(e){
  			var oper = $(this).data("oper");
  			if(oper == 'register'){
  				regForm.submit();
  			}else if(oper == "reset"){
  				regForm[0].reset();
  			}
  			else if(oper == "list"){
  				location.href="${root}list";
  			}
  			else if(oper == "remove"){
  				var idx = regForm.find("#idx").val();
  				location.href="${root}remove?idx="+idx;
  			}
  			else if(oper == "updateForm"){
  				regForm.find("#title , #content").attr("readonly" , false);
  				
  				var upBtn = "<button type='button' onclick='goUpdate();' class='btn btn-sm btn-info'>수정하기</button>";
  				$("#update").html(upBtn);
  				
  			}
  		});
  		
  		
  		// a 태그 클릭시 상세보기
  		$("a").on("click", function(e){
  			e.preventDefault(); // 태그기능막기
  			var idx = $(this).attr("href");
  			
  			$.ajax({
  				url : "${root}get",
  				type : "get",
  				data : {"idx": idx},
  				dataType : "json",
  				success : printBoard,
  				error : function(){alert("error");} 			
  			});
  		});
  		
	});
  
  function printBoard(vo){
	var regForm = $("#regForm");
	regForm.find("#title").val(vo.title);
	regForm.find("#content").val(vo.content);
	regForm.find("#writer").val(vo.writer);
	regForm.find("#idx").val(vo.idx);

	
	regForm.find("input, textarea").attr("readonly",true);
	
	$("#regDiv").css("display", "none");
	$("#updateDiv").css("display","table");
  }
  
  function goUpdate(){
	 var regForm = $("#regForm");
	 
	 regForm.attr("action","${root}modify");
	 regForm.submit();
  }
  </script>
</head>
<body>

  <h2>Card Header and Footer</h2>
  
  <div class="card">
    <div class="card-header">
    	<div class="jumbotron jumbotron-fluid">
		  <div class="container">
		  	<h1>Spring Boot</h1>
		    <p>음음</p>
		  </div>
		</div>
    </div>
    <div class="card-body">
    	<h4 class="car-title">Spring BOOT</h4>
    	<div class="row">
    		<div class="col-lg-2">
    			<div class="card" style="min-height: 500px;max-height: 1000px">
    				<div class="card-body">
    					<h4 class="card-title">GUEST</h4>
    					<p class="card-text">회원님 Welcom!</p>
    					<form action="">
    						<div class="form-group">
    							<label for="memId">아이디</label>
    							<input type="text" class="form-control" id="memId" name="memId"/>
    						</div>
    						
    						<div class="form-group">
    							<label for="memPwd">비밀번호</label>
    							<input type="password" class="form-control" id="memPwd" name="memPwd"/>
    						</div>
    						
    						<button type="button" class="btn btn-sm btn-primary form-control">로그인</button>
    					</form>
    				</div>
    			</div>
    		</div>
    		<div class="col-lg-5">
    			<div class="card" style="min-height: 500px;max-height: 1000px">
    				<div class="card-body">
    					<table class="table table-hober">
    						<thead>
    							<th>번호</th>
    							<th>제목</th>
    							<th>작성일</th>
    						</thead>
    						
    						<tbody>
    							<c:forEach items="${boardlist}" var="ls">
    								<tr>
	    								<th>${ls.idx}</th>
	    								<th><a href="${ls.idx}">${ls.title}</a></th>
	    								<th><fmt:formatDate value="${ls.indate}" pattern="yyyy-MM-dd"/></th>
    								</tr>    							
    							</c:forEach>
    						
    						</tbody>
    					</table>
    				</div>
    			</div>
    		</div>
    		<div class="col-lg-5">
    			<div class="card" style="min-height: 500px;max-height: 1000px">
    				<div class="card-body">
    					
    					<form id="regForm" action="${root}register" method="post">
    						<input type="hidden" name="idx" id="idx"/>
    						<div class="form-group">
    							<label for="memId">제목:</label>
    							<input type="text" class="form-control" id="title" name="title" placeholder="Enter title"/>
    						</div>
    						
    						<div class="form-group">
    							<label for="content">내용:</label>
    							<textarea rows="9" type="text" class="form-control" id="content" name="content"></textarea>
    						</div>
    						
    						
    						<div class="form-group">
    							<label for="writer">작성자</label>
    							<input type="text" class="form-control" id="writer" name="writer" placeholder="Enter writer"/>
    						</div>
    						
    						<div id="regDiv">
    						<button type="button" data-oper="register" class="btn btn-sm btn-primary">글등록</button>
    						<button type="button"  data-oper="reset" class="btn btn-sm btn-warning">취소</button>
    						</div>
    						
    						<div id="updateDiv" style="display: none">
    							<button type="button"  data-oper="list" class="btn btn-sm btn-primary">목록</button>
    							<span id="update"><button type="button"  data-oper="updateForm" class="btn btn-sm btn-success">수정</button></span>
    							<button type="button"  data-oper="remove" class="btn btn-sm btn-warning">삭제</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    	</div>
    </div> 
    <div class="card-footer">풋터입니다.</div>
    
  </div>

</body>
</html>