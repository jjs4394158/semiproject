<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="./resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="./resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="./resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="./resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link href="./resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="./resources/assets/vendor/aos/aos.css" rel="stylesheet">

    <!-- Template Main CSS Files -->
    <link href="./resources/assets/css/variables.css" rel="stylesheet">
    <link href="./resources/assets/css/main.css" rel="stylesheet">

    <!-- Bootstrap CSS & JS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
</head>
<body>
     <!-- ======= Header ======= -->
    <header id="header" class="header d-flex align-items-center fixed-top">
        <c:set var="isLoggedIn" value="${not empty loginId}" />
        <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
            <a href="index.html" class="logo d-flex align-items-center">
                <!-- Uncomment the line below if you also wish to use an image logo -->
                <!-- <img src="./resources/assets/img/logo.png" alt=""> -->
                <h1>Toonniverce</h1>
            </a>
            <nav id="navbar" class="navbar">
                <ul>
                    <li><a href="wList">전체 웹툰</a></li>
                    <li><a href="dojeon">도전! 웹툰</a></li>
                    <li><a href="bList">자유게시판</a></li>
                    <li class="dropdown"><a href="#"><span>포인트</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                        <ul>
                            <li><a href="mPoint">포인트 교환</a></li>
                            <li><a href="check">출석체크</a></li>
                        </ul>
                    </li>  
                    <li class="dropdown"><a href="#"><span>마이페이지</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                        <ul>
                            <li><a href="mView?mId=${loginId}">내 정보</a></li>
                            <li><a href="bSearch?category=BWRITER&keyword=${loginId}">내가 쓴 글</a></li>
                            <li><a href="cPoint">내 포인트</a></li>
                            <li><a href="change">교환 내역</a></li>
                        </ul>
                    </li>
                </ul>
            </nav><!-- .navbar -->

            <div class="position-relative">
                <a href="#" class="mx-2 js-search-open"></a>
                <!-- ======= Search Form ======= -->
                <div class="search-form-wrap js-search-form-wrap">
                    <form action="search-result.html" class="search-form">
                        <span class="icon bi-search"></span>
                        <input type="text" placeholder="Search" class="form-control">
                        <button class="btn js-search-close">
                            <span class="bi-x"></span>
                        </button>
                    </form>
                </div>
                <!-- End Search Form -->
                <c:choose>
                    <c:when test="${isLoggedIn}">
                        <div style="display: flex; align-items: center; margin: 0 10px;">
                            <img src="./resources/assets/img/포인트.png" alt="포인트" style="width: 20px; height: 20px; margin-right: 5px;">
                            <span id="currentPoints">${sessionScope.mpoints}</span>
                        </div>
                        <button type="button" id="logout" class="btn-book-a-table" style="margin-left: 10px;">Logout</button>
                    </c:when>
                    <c:otherwise>
                        <button type="button" id="login" class="btn-book-a-table" style="margin-left: 10px;">Join / Login</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </header><!-- End Header -->

    <main>
        <div class="container">
            <form action="updatePoints" method="post" id="pointForm">
                <input type="hidden" name="mid" value="${sessionScope.loginId}">
                <input type="hidden" name="points" id="pointsInput">
                <button type="button" onclick="updateUserPoints()">Update Points</button>
            </form>
        </div>
    </main>

    <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="./resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="./resources/assets/vendor/aos/aos.js"></script>
    <script src="./resources/assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="./resources/assets/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script>
        $('#join').click(()=>{
            location.href = "joinForm";
        });
        
        $('#dojeon').click(()=>{
            location.href = "dojeon";
        });
        
        $('#login').click(()=>{
            location.href = "loginForm";
        });
        
        $('#mlist').click(()=>{
            location.href = "mList";
        });
        
        $('#logout').click(()=>{
            location.href = "mLogout";
            alert("로그아웃되었습니다.");
        });
        
        $("#write").click(()=>{
            location.href="writeForm";
        });
        
        $("#myinfo").click(()=>{
            location.href="mView?mId=${loginId}";
        });
        
        $("#mylist").click(()=>{
            location.href="bSearch?category=BWRITER&keyword=${loginId}";
        });
        
        $('#check').click(()=>{
            location.href = "check";
        });
        
        $('#wList').click(()=>{
            location.href = "wList";
        });
        
        
        $('#mPoint').click(()=>{
            location.href = "mPoint";
        });
        
        $('#cPoint').click(()=>{
            location.href = "cPoint";
        });
        
        $('#change').click(()=>{
            location.href = "change";
        });
        
        function updateUserPoints() {
            var newPoints = prompt("Enter new points:");
            if (newPoints !== null && newPoints !== "") {
                document.getElementById("pointsInput").value = newPoints;
                document.getElementById("pointForm").submit();
            }
        }
    </script>
</body>
</html>
