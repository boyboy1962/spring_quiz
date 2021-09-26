<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<!-- ajax를 사용하려면 더 많은 함수가 있는 jquery js 포함해야 한다. -->
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"/>
		<jsp:include page="nav.jsp"/>
		<div class="">
			<h3 class="text-center p-3">예약 목록 보기</h3>
		</div>
		<table class="table text-center">
			<thead>
				<tr>
					<th>이름</th>
					<th>예약날짜</th>
					<th>숙박일수</th>
					<th>숙박인원</th>
					<th>전화번호</th>
					<th>예약상태</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="booking" items="${bookingList}">
					<tr>
						<td>${booking.name}</td>
						<td>${booking.date}</td>
						<td>${booking.day}</td>
						<td>${booking.headcount}</td>
						<td>${booking.phoneNumber}</td>
						<td>
							<c:choose>
								<c:when test="${booking.state eq '확정'}">
									<div class="text-success">
										${booking.state}
									</div>
								</c:when>
								<c:when test="${booking.state eq '대기중'}">
									<div class="text-primary">
										${booking.state}
									</div>
								</c:when>
								<c:when test="${booking.state eq '취소'}">
									<div class="text-danger">
										${booking.state}
									</div>
								</c:when>
							</c:choose>
						</td>
						<td><button class="deleteBtn btn btn-danger" data-booking-id="${booking.id}">삭제</button></th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			$(".deleteBtn").on('click', function(){
				// alert('삭제가 작동함');
				let bookingId = $(this).data('booking-id');
				//alert(bookingId);
				$.ajax({
					type:"POST"
					, url: '/lesson06/quiz03/deleteBooking'
					, data: {"bookingId": bookingId}
					, dataType: 'json'
					, success: function(data) {
						if (data.result == "success"){
							alert("성공")
							location.reload();
						} else {
							alert("삭제 실패");
						}
					}
					, error: function(e){
						alert("error: " + e);
					}
				})
				
			});
		});
	</script>
	
</body>
</html>