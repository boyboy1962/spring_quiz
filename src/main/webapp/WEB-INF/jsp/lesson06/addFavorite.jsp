<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>즐겨 찾기 등록</title>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 등록하기</h1>
		<div class="mt-3">
			<b>이름: </b>
			<input type="text" class="form-control col-5" name="webName" placeholder="웹 이름을 입력하세요.">
		</div>
		<div class="mt-3">
			<b >URL: </b>
			<input type="text" class="form-control" name="webAddress" placeholder="웹 주소를 복사해서 붙여넣어 주세요.">
		</div>
		<button id="addWebBtn" class="btn btn-success mt-3">즐겨찾기 등록</button>
	</div>
</body>
</html>