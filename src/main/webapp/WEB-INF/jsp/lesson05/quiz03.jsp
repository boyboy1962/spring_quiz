<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리</title>
	<!-- bootstrap CDN link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>


	<div class="container">
	
<!-- 
1. JSTL Formatter 숫자, 비율
아래와 같이 선거의 득표수가 기호순서대로 저장되어 있다.

List<Integer> candidates = new ArrayList<>();
candidates.add(263001);
candidates.add(173942); 
candidates.add(563057); 

해당 리스트를 컨트롤러에서 Model을 통해서 jsp 에 전달하고, 아래와 같은 화면을 구성하세요.
총 1,000,000 명이 투표하였다. 이를 기반으로 투표율을 계산하세요.
득표수와 득표율은 fomatter 를 통해서 출력하세요.
 -->
 
		<h1>1. 후보자 득표율</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>기호</th>
					<th>득표수</th>
					<th>득표율</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="candidates" items="${candidates}" varStatus="status">
					<tr>
						<th>${status.count}</th>
						<th>
							<fmt:formatNumber value="${candidates}"/>
						</th>
						<th>
							<fmt:formatNumber value="${candidates/sum}" type="percent"/>
						</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
<!--
2. JSTL Formatter 통화, 날짜
아래와 같이 카드 사용 명세서가 저장되어 있다.
List<Map<String, Object>> cardBills = new ArrayList<>();

Map<String, Object> cardBill = new HashMap<>();
cardBill.put("store", "GS48");
cardBill.put("pay", 7800);
cardBill.put("date", "2025-09-14");
cardBill.put("installment", "일시불");
cardBills.add(cardBill);

cardBill = new HashMap<>();
cardBill.put("store", "현태백화점");
cardBill.put("pay", 2750000);
cardBill.put("date", "2025-09-18");
cardBill.put("installment", "3개월");
cardBills.add(cardBill);

cardBill = new HashMap<>();
cardBill.put("store", "요촌치킨");
cardBill.put("pay", 180000);
cardBill.put("date", "2025-09-20");
cardBill.put("installment", "일시불");
cardBills.add(cardBill);
해당 리스트를 컨트롤러에서 Model을 통해서 jsp 에 전달하고, 아래와 같은 화면을 구성하세요.
날짜 정보는 문자열로 저장되어 있다. formatter 를 이용해서 date 객체로 만들고, 아래와 같은 형태로 출력하세요.
사용금액은 통화 format으로 출력하세요.
  -->		
  	
		<h1>2. 카드 명세서</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>사용처</th>
					<th>가격</th>
					<th>사용날짜</th>
					<th>할부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cardBills" items="${cardBills}">
					<tr>
						<th>${cardBills.store}</th>
						<th>
							<fmt:formatNumber value="${cardBills.pay}" type="currency" />
						</th>
						<th>
							<fmt:parseDate value="${cardBills.date}" pattern="yyyy-MM-dd" var="dateInput"/>
							<fmt:formatDate value="${dateInput}" pattern="yyyy년 MM월 dd일"/>
						</th>
						<th>${cardBills.installment}</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>



</body>
</html>







