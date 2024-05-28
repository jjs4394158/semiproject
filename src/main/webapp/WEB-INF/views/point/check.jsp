<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Toonniverce</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="./resources/assets/img/웹툰1.png" rel="icon">
<link href="./resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="./resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="./resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="./resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">
<link href="./resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="./resources/assets/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS Files -->
<link href="./resources/assets/css/variables.css" rel="stylesheet">
<link href="./resources/assets/css/main.css" rel="stylesheet">
<link href="./resources/assets/css/point.css" rel="stylesheet">

<!-- Bootstrap CSS & JS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>

<style>
.transparent-button {
	background: none;
	border: none;
	font-size: 24px;
	cursor: pointer;
}

#checkInButton {
	background-color: #87CEEB;
	border-radius: 15px;
	border: none;
	color: white;
	padding: 10px 20px;
	margin-top: 20px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

#checkInButton:hover {
	background-color: #00BFFF;
}

#currentMonthYear {
	font-size: 24px; /* 글자 크기를 크게 설정 */
	margin: 0 10px; /* 좌우 여백 설정 */
}
</style>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<c:set var="isLoggedIn" value="${not empty loginId}" />
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center">
				<h1>Toonniverce</h1>
			</a>
			<nav id="navbar" class="navbar">
				<ul>
					<li><a href="single-post.html">전체 웹툰</a></li>
					<li><a href="search-result.html">도전! 웹툰</a></li>
					<li><a href="bList">자유게시판</a></li>
					<li class="dropdown"><a href="#"><span>포인트</span> <i
							class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<li><a href="check">출석체크</a></li>
							<li><a href="ladder">룰렛돌리기</a></li>
						</ul></li>
					<li class="dropdown"><a href="#"><span>마이페이지</span> <i
							class="bi bi-chevron-down dropdown-indicator"></i></a>
						<ul>
							<li><a href="mView?mId=${loginId}">내 정보</a></li>
							<li><a href="bSearch?category=BWRITER&keyword=${loginId}">내가
									쓴 글</a></li>
							<li><a href="point">내 포인트</a></li>
							<li><a href="#">보관함</a></li>
						</ul></li>
				</ul>
			</nav>
			<!-- .navbar -->
			<div class="position-relative"
				style="width: 100%; display: flex; justify-content: flex-end;">
				<a href="#" class="mx-2 js-search-open"><span class="bi-search"></span></a>
				<i class="bi bi-list mobile-nav-toggle"></i>
				<div class="search-form-wrap js-search-form-wrap"
					style="flex: 1; margin: 0 10px;">
					<form action="search-result.html" class="search-form"
						style="display: flex; align-items: center;">
						<span class="icon bi-search"></span> <input type="text"
							placeholder="Search" class="form-control"
							style="flex: 1; margin: 0 5px;">
						<button class="btn js-search-close">
							<span class="bi-x"></span>
						</button>
					</form>
				</div>
				<!-- End Search Form -->
				<c:choose>
					<c:when test="${isLoggedIn}">
						<div style="display: flex; align-items: center; margin: 0 10px;">
							<img src="./resources/assets/img/포인트.png" alt="포인트"
								style="width: 20px; height: 20px; margin-right: 5px;"> <span
								id="points">${sessionScope.mpoints}</span>
						</div>
						<!-- 포인트 섹션 -->
						<button type="button" id="logout" class="btn-book-a-table"
							style="margin-left: 10px;">Logout</button>
					</c:when>
					<c:otherwise>
						<button type="button" id="login" class="btn-book-a-table"
							style="margin-left: 10px;">Join / Login</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</header>
	<!-- End Header -->

	<main id="main" class="card justify-content-center" role="main"
		style="width: 550px; margin: 120px auto; text-align: center; overflow-y: auto; display: flex; flex-direction: column; align-items: center;">
		<div class="container main-content" style="width: 500px;">
			<h1>출석체크</h1>
			<p>내 포인트 확인</p>
			<h4 id="mpoints">${sessionScope.mpoints}</h4>
			<button id="pUp" style="color: blue;">출석체크하기</button>
			<br />
		</div>
	</main>


	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<%@ include file="../footer.jsp"%>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="./resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="./resources/assets/vendor/aos/aos.js"></script>
	<script src="./resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="./resources/assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script>
        $('#join').click(function() {
            location.href = "joinForm";
        });

        $('#login').click(function() {
            location.href = "loginForm";
        });

        $('#point').click(function() {
            location.href = "point";
        });

        $('#mlist').click(function() {
            location.href = "mList";
        });

        $('#logout').click(function() {
            location.href = "mLogout";
            alert("로그아웃되었습니다.");
        });

        $("#write").click(function() {
            location.href="writeForm";
        });

        $('#reserv').click(function() {
            location.href = "reserv";
        });

        $("#myinfo").click(function() {
            location.href="mView?mId=${loginId}";
        });

        $("#mylist").click(function() {
            location.href="bSearch?category=BWRITER&keyword=${loginId}";
        });

        $("#blist").click(function() {
            location.href="bList";
        });

        $('#check').click(function() {
            location.href = "check";
        });

        $('#pUp').click(function() {
            location.href = "pUp?mId=${loginId}";
        });        
        

        document.addEventListener("DOMContentLoaded", function() {
            var loginId = "${sessionScope.loginId}"; // 로그인한 사용자의 아이디를 가져옵니다.
            var checkInButton = document.getElementById("checkInButton");
            var attendanceCalendar = document.getElementById("attendanceCalendar");
            var prevMonthButton = document.getElementById("prevMonth");
            var nextMonthButton = document.getElementById("nextMonth");
            var currentMonthYear = document.getElementById("currentMonthYear");

            var currentDate = new Date();

            checkInButton.addEventListener("click", function() {
                var today = new Date().toISOString().split('T')[0];
                checkIn(loginId, today);
            });

            prevMonthButton.addEventListener("click", function() {
                currentDate.setMonth(currentDate.getMonth() - 1);
                loadAttendance(loginId);
            });

            nextMonthButton.addEventListener("click", function() {
                currentDate.setMonth(currentDate.getMonth() + 1);
                loadAttendance(loginId);
            });

            function checkIn(loginId, date) {
                fetch('/check-in', {
                    method: 'GET',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ loginId: loginId, date: date })
                })
                .then(function(response) { return response.text(); })
                .then(function(data) {
                    alert(data);
                    loadAttendance(loginId);
                    updatePoints(); // 포인트 업데이트 호출
                })
                .catch(function(error) {
                    console.error('Error:', error);
                });
            }

            function loadAttendance(loginId) {
                fetch('/get-attendance')
                    .then(function(response) { return response.json(); })
                    .then(function(data) {
                        renderCalendar(data);
                    })
                    .catch(function(error) {
                        console.error('Error:', error);
                    });
            }

            function renderCalendar(data) {
                attendanceCalendar.innerHTML = '';
                var year = currentDate.getFullYear();
                var month = currentDate.getMonth();
                var today = new Date().toISOString().split('T')[0];

                currentMonthYear.textContent = year + '-' + addLeadingZeros(month + 1, 2);

                var daysInMonth = new Date(year, month + 1, 0).getDate();

                for (var i = 1; i <= daysInMonth; i++) {
                    var day = addLeadingZeros(i, 2);
                    var date = year + '-' + addLeadingZeros(month + 1, 2) + '-' + day;
                    var dayDiv = document.createElement('div');
                    dayDiv.className = 'day';

                    if (date === today) {
                        dayDiv.classList.add('today');
                    }

                    var attendanceEntry = data.find(function(entry) { return entry.date === date; });
                    if (attendanceEntry && attendanceEntry.checkedIn) {
                        dayDiv.classList.add('present');
                    }

                    dayDiv.textContent = i;
                    attendanceCalendar.appendChild(dayDiv);
                }
            }

            function addLeadingZeros(number, length) {
                var numStr = String(number);
                while (numStr.length < length) {
                    numStr = '0' + numStr;
                }
                return numStr;
            }

            function updatePoints() {
                fetch('/get-points')
                    .then(function(response) { return response.json(); })
                    .then(function(data) {
                        document.querySelector("#points").textContent = data;
                    })
                    .catch(function(error) {
                        console.error('Error:', error);
                    });
            }

            loadAttendance(loginId);
        });
        
        $(document).ready(function() {
            $('#pUp').click(function() {
                const mId = "${loginId}";
                $.ajax({
                    type: "GET",
                    url: "pUp",
                    data: { mId: mId },
                    dataType: "json",
                    success: function(result) {
                        $('#mpoints').text(result);
                    },
                    error: function() {
                        alert('포인트 업데이트 실패!');
                    }
                });
            });
        });
    </script>
</body>
</html>
