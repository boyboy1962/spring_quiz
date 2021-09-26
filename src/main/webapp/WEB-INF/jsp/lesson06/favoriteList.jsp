<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<!-- ajax를 사용하려면 더 많은 함수가 있는 jquery js 포함해야 한다. -->
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 목록</h1>
		
		<table class="table text-center">
			<thead>
				<tr>
					<th>No.</th>
					<th>이름</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${favoriteList}" var="favorite">
				<tr>
					<th>${favorite.id}</th>
					<th>${favorite.name}</th>
					<th>${favorite.url}</th>
					<!-- 1/. value에 원하는 값을 담아 놓는다. -->
					<%-- <td><button type="button" name="delBtn" class="removeBtn btn btn-danger " value="${favorite.id}">삭제</button> --%>
					
					<!-- 2. data를 이용해서 태그에 값을 임시 저정하기 -->
					<td><button type="button" name="delBtn" class="removeBtn btn btn-danger" data-favorite-id="${favorite.id}">삭제</button>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function(){
			//(1) value에 원하는 값을 담아 놓는다.
			/* $('td').on('click', 'button[name=delBtn]', function(){
				//alert("삭제 버튼 클릭");
				alert($(this).val()); //this는 반드시 외워야한다. 이거를 써야 해당되는 id를 받아 올 수 있다.
				alert(e.target.value);
			}); */
			
			// 2. data를 이용해서 태그에 값을 임시 저정하기
			// 태그: 태그안에 data-favorite-id 		data- 그 뒤로부터는 우리가 이름을 정한다.(대문자 사용 X)
			$('.removeBtn').on('click', function(){
				let favoriteId = $(this).data('favorite-id');
				alert(favoriteId);
				
				$.ajax({
					type: "POST" // Get으로 하면 web 주소로 삭제를 할 수 있지만 post로만 호출이 가능하다.
					, url: '/lesson06/Quiz01/delete_favorite'
					, data: {'favorite_id':favoriteId}
					, success: function(data) {
						// json : 성공 : {"result":success} 실패 : {"result":fail}
						if (data.result == 'success') {
							//alert("성공");
							location.reload(); // 새로고침
						} else {
							alert("삭제가 실패했습니다.");
						}
					}
					, error: function(e) {						
						alert("error:" + e);
					}
					
				});
			});
		});
	</script>
</body>
</html>