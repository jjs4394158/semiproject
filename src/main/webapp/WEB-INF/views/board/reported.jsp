<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
    .content-container {
        margin-top: 100px;
        margin-bottom: 100px; /* 추가된 부분 */
    }
</style>
</head>
<body>
    <!-- ======= Header ======= -->
    <header id="header" class="header d-flex align-items-center fixed-top">
        <div class="container-fluid container-xl d-flex align-items-center justify-content-between">
            <a href="index.html" class="logo d-flex align-items-center">
                <h1>Toonniverce</h1>
            </a>
            <nav id="navbar" class="navbar">
                <ul>
                    <li><a href="single-post.html">전체 웹툰</a></li>
                    <li><a href="search-result.html">도전! 웹툰</a></li>
                    <li><a href="bList">자유게시판</a></li>
                    <li class="dropdown"><a href="#"><span>마이페이지</span> <i
                            class="bi bi-chevron-down dropdown-indicator"></i></a>
                        <ul>
                            <li><a href="mView?mId=${loginId}">내 정보</a></li>
                            <li><a href="bSearch?category=BWRITER&keyword=${loginId}">내가
                                    쓴 글</a></li>
                            <li><a href="#">보관함</a></li>
                        </ul></li>
                </ul>
            </nav>
            <!-- .navbar -->
        </div>
    </header>
    <!-- End Header -->

    <div class="container content-container">
        <div class="row">
            <div class="col-lg-12 d-flex justify-content-center">
                <h2>신고된 게시물입니다.</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 d-flex justify-content-center">
                <p>이 게시물은 신고되어 볼 수 없습니다.</p>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 d-flex justify-content-center">
                <a href="bList" class="btn btn-primary">목록으로 돌아가기</a>
            </div>
        </div>
    </div>
    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <div class="container">
            <%@ include file="../footer.jsp"%>
        </div>
    </footer>
    <!-- End Footer -->

</body>
</html>
