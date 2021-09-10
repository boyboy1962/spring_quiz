<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-10">
	<h3 class="m-4">날씨 입력</h3>
	<form method="post" action="/afterAddWeather">
		<div class="">
			<div class="d-flex">
				<div class="input-group mb-5 mr-3">
					<span class="input-group-text" id="basic-addon1">날짜</span>
					<input type="text" class="form-control" id="startDate" name="date" >
				</div>
				<div class="input-group mb-5 mr-3 d-flex justify-content-end">
					<label class="input-group-text" for="Select01">날씨</label>
				  	<select class="form-select" id="Select01" name="weather">
				    	<option selected>선택하세요</option>
				    	<option>맑음</option>
				    	<option>구름조금</option>
				    	<option>흐림</option>
				    	<option>비</option>
				  	</select>
				</div>
				<div class="input-group mb-5 d-flex justify-content-end">
					<label class="input-group-text" for="Select02">미세먼지</label>
				  	<select class="form-select" id="Select02" name="microDust">
				    	<option selected>선택하세요</option>
				    	<option>좋음</option>
				    	<option>보통</option>
				    	<option>나쁨</option>
				    	<option>최악</option>
				  	</select>
				</div>
			</div>
			<div class="d-flex justify-content-around">
				<div class="input-group mr-3 mb-5">
					<span class="input-group-text">기온</span>
					<input type="text" class="form-control" id="startDate" name="temperatures" >
					<span class="input-group-text">°C</span>
				</div>
				<div class="input-group mr-3 mb-5">
					<span class="input-group-text">강수량</span>
					<input type="text" class="form-control" id="startDate" name="precipitation" >
					<span class="input-group-text">mm</span>
				</div>
				<div class="input-group mb-5">
					<span class="input-group-text">풍속</span>
					<input type="text" class="form-control" id="startDate" name="windSpeed" >
					<span class="input-group-text">km/h</span>
				</div>
			</div>
		</div>
		<div class="d-flex justify-content-end">
		<input type="submit" class="btn btn-primary" value="추가">
		</div>
	</form>
</div>