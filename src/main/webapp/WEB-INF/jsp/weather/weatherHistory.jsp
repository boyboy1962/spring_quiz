<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="col-10">
	<table class="table text-center">
		<thead>
			<tr>
				<th>날짜</th>
				<th>날씨</th>
				<th>온도</th>
				<th>강수량</th>
				<th>미세먼지</th>
				<th>풍속</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="weatherHistory" items="${weatherHistoryList}">
				<tr>
					<th>
						<fmt:formatDate value="${weatherHistory.date}" pattern="yyyy년 MM월 dd일"/>
					</th>
					<th>
						<c:choose>
							<c:when test="${weatherHistory.weather eq '맑음'}">
								<img class="" alt="맑음" src="/images/lesson05/sunny.jpg" width="">
							</c:when>
							<c:when test="${weatherHistory.weather eq '흐림'}">
								<img class="" alt="맑음" src="/images/lesson05/cloudy.jpg" width="">
							</c:when>
							<c:when test="${weatherHistory.weather eq '구름조금'}">
								<img class="" alt="맑음" src="/images/lesson05/partlyCloudy.jpg" width="">
							</c:when>
							<c:when test="${weatherHistory.weather eq '비'}">
								<img class="" alt="맑음" src="/images/lesson05/rainy.jpg" width="">
							</c:when>
						</c:choose>
						<%-- ${weatherHistory.weather} --%>
					</th>
					<th>${weatherHistory.temperatures}℃</th>
					<th>${weatherHistory.precipitation}mm</th>
					<th>${weatherHistory.microDust}</th>
					<th>${weatherHistory.windSpeed}km/h</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>