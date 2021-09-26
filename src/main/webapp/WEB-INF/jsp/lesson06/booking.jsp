<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>통나무 팬션</title>
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
        <div id="warp" class="container">
        	<jsp:include page="header.jsp"/>
        	<jsp:include page="nav.jsp"/>
            <section class="">
                <div class="banner"><img src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" alt="img1" class="w-100 h-100" id="bannerImg"></div>
                <div class="interface d-flex ">
                    <div class="front col-4 d-flex justify-content-center align-items-center"><a href="http://localhost:88/lesson06/quiz03/bookingNow" ><h1 class="front-text">실시간<br>예약하기</h1></a></div>
                    <div class="middle col-5">
                        <div class="m-3 d-flex align-items-center">
                            <span class="middle-text mr-3">예약확인</span>
                            <span class="mr-3 text-white">회원<input type="radio" name="mem" value="member" ></span>
                            <span class="text-white">비 회원<input type="radio" name="mem" value="non" checked></span></div>
                         <div class="member d-none">
                            <div class=" mt-3 mb-3 d-flex align-items-center">
                                <div class="info col-3 d-flex justify-content-end text-white">아이디:</div>
                                <input type="text" class="idInput form-control col-7">
                            </div>
                            <div class=" mt-3 mb-3 d-flex align-items-center">
                                <div class="info col-3 d-flex justify-content-end text-white">비밀번호:</div>
                                <input type="password" class="passwordInput form-control col-7">
                            </div>
                        </div>
                        <div class="non-member">
                            <div class=" mt-3 mb-3 d-flex align-items-center">
                                <div class="info col-3 d-flex justify-content-end text-white">이름:</div>
                                <input type="text" class="nameInput form-control col-7">
                            </div>
                            <div class=" mt-3 mb-3 d-flex align-items-center">
                                <div class="info col-3 d-flex justify-content-end text-white">전화번호:</div>
                                <input type="text" class="phoneInput form-control col-7">
                            </div>
                            <!-- <div class=" mt-3 mb-3 d-flex align-items-center">
                                <div class="info col-3 d-flex justify-content-end text-white">날짜:</div>
                                <input type="text" class="dateInput form-control col-7">
                            </div> -->
                        </div>
                        <div class=" mt-3 mb-3 d-flex align-items-center">
                            <div class="info col-8 d-flex justify-content-end text-white"></div>
                            <button type="button" class="findBtn btn btn-success">조회 하기</button>
                        </div>
                    </div>
                    <div class="back col-3 d-flex align-items-center justify-content-center"><div><h4><b>예약문의:</b></h4><h2><b>010<br>-0000-1111</b></h2></div></div>
                </div>
            </section>
            <jsp:include page="footer.jsp"/>
        </div>
        <script>
            $(document).ready(function() {
                $("input[name=mem]").on("change", function() {
                    let checkedValue = $('input[name=mem]:checked').val();
                    if (checkedValue == "member"){
                        $(".member").removeClass("d-none");
                        $(".non-member").addClass("d-none");
                    } else {
                        $(".member").addClass("d-none");
                        $(".non-member").removeClass("d-none");
                    }
                })

                
                $('.dateInput').datepicker({
                    // dayNamesMin: ['월', '화', '수', '목', '금', '토', '일']
                    dateFormat: "yy년 mm월 dd일"
                    , minDate: 0
                })

                
                $('.btn').on("click", function() {
                    let checkedValue = $('input[name=mem]:checked').val();
                        let name = $(".nameInput").val();
                        let phone = $(".phoneInput").val();
                        //let date = $(".dateInput").val();
                        let id = $(".idInput").val();
                        let password = $(".passwordInput").val()
                    if (checkedValue == "member"){;
                        if (id == ""){
                            alert("아이디를 입력해주세요.");
                            return;
                        }
                        if (password == ""){
                            alert("비밀번호를 입력해주세요.");
                            return;
                        }
                    } else {
                        if (name == ""){
                            alert("이름을 입력해주세요.");
                            return;
                        }
                        if (phone == ""){
                            alert("전화번호를 입력해주세요.");
                            return;
                        }
                        //if (phone.slice(0,3) != "010"){
                        //    alert("010 으로 시작하는 번호만 입력 가능합니다.")
                        //    return;
                        //}
                        //if (date == ""){
                        //    alert("날짜를 입력해주세요.");
                        //    return;
                        //}
                    }
                    
                    $.ajax({
                    	type: "POST"
                    	, url: 'lesson06/quiz03/findBooking'
                    	, data: {"bookingName": name, "bookingPhone": phone}
                    	, dataType: 'json'
                    	, success: function(data) {
                    		if (data.result == 'success') {
    							alert("성공");
    							location.reload(); // 새로고침
    						} else {
    							alert("예약 내역이 없습니다.");
    						}
                    	}
                    	, error: function(e) {
                    		alert("error: " + e);
                    	}
                    })
                });

                var idx = 0;
                var imgIndex = [
                "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg",
                "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner2.jpg",
                "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner3.jpg",
                "http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner4.jpg"
                ];

                setInterval(function() {
                    idx++;
                    if (idx == 4) {
                        idx = 0;
                    }

                    $("#bannerImg").attr("src", imgIndex[idx]);
                }, 3000);

           		//$('.findBtn').on('click', function(){
           		//	
           		//})

            });
            
        </script>
    </body>

</html>