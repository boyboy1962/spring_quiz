<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에약하기</title>
        <!-- <link rel="stylesheet" href="jQuery_advance_problem_style.css" type="text/css"> -->
		<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!--<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
        <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script type="text/javascript" src="jQuery_complete_problem_script.js"></script>
        
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
	<link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"/>
		<jsp:include page="nav.jsp"/>
		<div class="">
			<h3 class="text-center p-3">바로 예약하기</h3>
		</div>
		<div class="d-flex">
			<div class="col-3"></div>
			<div class="col-6">
				<b class="">이름</b>
				<input type="text" class="form-control mt-1 mb-3" id="name">
				<b class="">예약날짜</b>
				<input type="text" class="dateInput form-control mt-1 mb-3" id="date">
				<b class="">숙박일수</b>
				<input type="text" class="form-control mt-1 mb-3" id="day">
				<b class="">숙박인원</b>
				<input type="text" class="form-control mt-1 mb-3" id="headcount">
				<b class="">전화번호</b>
				<input type="text" class="form-control mt-1 mb-3" id="phoneNumber">
				<button id="bookingBtn" class="btn btn-warning w-100 mt-3">예약하기</button>
			</div>
			<div class="col-3"></div>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){

            $('.dateInput').datepicker({
                // dayNamesMin: ['월', '화', '수', '목', '금', '토', '일']
                dateFormat: "yy-mm-dd"
                , minDate: 0
            });
			
			$("#bookingBtn").on('click', function(e){
				//alert("버튼 클릭");
				let name = $('#name').val().trim();
				//alert(name);
				if(name == '') {
					alert("이름을 입력하세요.");
					return false;
				}
				
				let date = $('#date').val().trim();
				//alert(date);
				if(date == '') {
					alert("날짜를 선택하세요.");
					return false;
				}

				let day = $('#day').val().trim();
				//alert(day);
				if(day == '') {
					alert("숙박일수를 입력하세요.");
					return false;
				}
				if(isNaN(day)){
					alert("숙박일수는 숫자만 입력이 가능합니다.");
					return false;
				}

				let headcount = $('#headcount').val().trim();
				//alert(day);
				if(headcount == '') {
					alert("숙박인원을 입력하세요.");
					return false;
				}
				if(isNaN(headcount)){
					alert("숙박인원은 숫자만 입력이 가능합니다.");
					return false;
				}

				let phoneNumber = $('#phoneNumber').val().trim();
				//alert(day);
				if(phoneNumber == '') {
					alert("전화번호를 입력하세요.");
					return false;
				}
				$.ajax({
					type: 'POST'
					, url: '/lesson06/quiz03/addBooking'
					, data: {"name":name, "headcount":headcount, "day":day, "date":date, "phoneNumber":phoneNumber}
					, dataType: 'json'
					, success:function(data) {
						if(data.result == 'success'){
							location.href = "/lesson06/quiz03/bookingMain";
							alert('성공');
						} else {
							alert("로직에 문제가 있음");
						}
					}
					, error: function(request, status, error){
						alert("뭐가 있나 = " + request);
						alert("요청:" + request + " 상태:" + status + "에러: " + error);
					}
				})
			});
		});
	</script>
</body>
</html>