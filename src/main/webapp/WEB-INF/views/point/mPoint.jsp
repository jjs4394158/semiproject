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
    <link href="./resources/assets/css/point.css" rel="stylesheet">

    <style>
        main {
            padding-left: 20px;
            padding-right: 20px;
        }
        .where_use {
            max-width: 1200px;
            margin: 0 auto;
        }
        .wrap_point {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: space-between;
        }
        .wrap_point .img_box {
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 10px;
            width: calc(33.333% - 20px); 
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .wrap_point .brand_txt {
            margin-top: 10px;
            text-align: center;
        }
        .wrap_point img {
            width: 200px; 
            height: 200px; 
            object-fit: cover; 
        }
        .pageTitle {
            text-align: center;
            margin-top: 120px; 
        }
        .pageTitle .tit {
            font-size: 2em; 
        }
        .pageTitle .desc {
            font-size: 1.2em; 
        }
         .exchange-button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }
        .exchange-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- ======= Header ======= -->
    <header id="header" class="header d-flex align-items-center fixed-top">
        <%@ include file="../header.jsp"%>
    </header><!-- End Header -->

    <main id="main">
        <article class="where_use">
            <!-- pageTitle -->
            <div class="pageTitle bg_blue">
                <div class="layout1">
                    <h2 class="tit">포인트 교환</h2>
                    <p class="desc">Toonniverce 포인트를 쌓아 상품으로 교환하세요!</p>
                    <a href="cPoint" class="exchange-button">교환하기</a>
                </div>
            </div>
            <!--// pageTitle -->

            <section class="wrap_point">
                <div class="img_box">
                    <img src="./resources/assets/img/경품1.png" alt="아이폰">
                    <div class="brand_txt">
                        <div class="inner">
                            <p class="tit">iPhone 15 Pro</p>
                            <p class="desc">20,000 POINT</p>
                        </div>
                    </div>
                </div>
                <div class="img_box">
                    <img src="./resources/assets/img/경품2.png" alt="에어팟">
                    <div class="brand_txt">
                        <div class="inner">
                            <p class="tit">AirPods(3세대)</p>
                            <p class="desc">10,000 POINT</p>
                        </div>
                    </div>
                </div>
                <div class="img_box">
                    <img src="./resources/assets/img/경품3.png" alt="스위치">
                    <div class="brand_txt">
                        <div class="inner">
                            <p class="tit">Nintendo Switch</p>
                            <p class="desc">10,000 POINT</p>
                        </div>
                    </div>
                </div>
                
                <div class="img_box">
                    <img src="./resources/assets/img/경품4.png" alt="플스">
                    <div class="brand_txt">
                        <div class="inner">
                            <p class="tit">PlayStation 5</p>
                            <p class="desc">15,000 POINT</p>
                        </div>
                    </div>
                </div>
                <div class="img_box">
                    <img src="./resources/assets/img/경품5.png" alt="상품권">
                    <div class="brand_txt">
                        <div class="inner">
                            <p class="tit">신세계 상품권(10만원)</p>
                            <p class="desc">5,000 POINT</p>
                        </div>
                    </div>
                </div>
                <div class="img_box">
                    <img src="./resources/assets/img/경품6.png" alt="스벅">
                    <div class="brand_txt">
                        <div class="inner">
                            <p class="tit">스타벅스 e카드교환권(5만원)</p>
                            <p class="desc">3,000 POINT</p>
                        </div>
                    </div>
                </div>
            </section>
        </article>
    </main>

    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <%@ include file="../footer.jsp" %>
    </footer><!-- End Footer -->

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
</body>
</html>
