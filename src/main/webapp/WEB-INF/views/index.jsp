<!-- 기존 코드 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <style>
        .swiper-container {
            width: 100%;
            height: 100%;
        }
        .swiper-slide {
            text-align: center;
            font-size: 18px;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .play-pause-button {
            position: absolute;
            top: 10px;
            right: 10px;
            z-index: 10;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            color: #fff;
            background-color: rgba(0, 0, 0, 0.7);
        }
    </style>
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
        <%@ include file="header.jsp" %>
    </header><!-- End Header -->

    <main id="main">

        <!-- ======= Hero Slider Section ======= -->
        <section id="hero-slider" class="hero-slider d-flex justify-content-center align-items-center">
            <div class="container-md" data-aos="fade-in">
                <div class="row">
                    <div class="col-12">
                        <div class="swiper sliderFeaturedPosts">
                            <button class="play-pause-button">
                                <span id="playPauseIcon" class="bi bi-pause"></span>
                            </button>
                            <div class="swiper-wrapper">
                                <div class="swiper-slide">
                                    <div class="img-bg-inner d-flex justify-content-center align-items-center">
                                        <iframe width="1000" height="562"
                                            src="https://www.youtube.com/embed/qjLcIzWYNdY?si=rxp8RBx_XH0XkrDd"
                                            title="YouTube video player" frameborder="0"
                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                            referrerpolicy="strict-origin-when-cross-origin"
                                            allowfullscreen></iframe>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="img-bg-inner d-flex justify-content-center align-items-center">
                                        <iframe width="1000" height="562"
                                            src="https://www.youtube.com/embed/_t2QXir9Evc?si=Ea_7IRqSNT3NEib1"
                                            title="YouTube video player" frameborder="0"
                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                            referrerpolicy="strict-origin-when-cross-origin"
                                            allowfullscreen></iframe>
                                    </div>
                                </div>
                                <div class="swiper-slide">
                                    <div class="img-bg-inner d-flex justify-content-center align-items-center">
                                        <iframe width="1000" height="562"
                                            src="https://www.youtube.com/embed/-TZmHA6q2KU?si=cmL8ddLwUU4AGtdX"
                                            title="YouTube video player" frameborder="0"
                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                            referrerpolicy="strict-origin-when-cross-origin"
                                            allowfullscreen></iframe>
                                    </div>
                                </div>
                            </div>
                            <div class="custom-swiper-button-next">
                                <span class="bi-chevron-right"></span>
                            </div>
                            <div class="custom-swiper-button-prev">
                                <span class="bi-chevron-left"></span>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Hero Slider Section -->

        <!-- ======= Culture Category Section ======= -->
        <section class="category-section">
            <div class="container" data-aos="fade-up">
                <div class="section-header d-flex justify-content-between align-items-center mb-5">
                    <h2>Naver</h2>
                    <div><a href="wList?platform=naver" class="more">See All Naver</a></div>
                </div>

                <div class="row" style="display: flex; flex-wrap: nowrap; justify-content: center;">
                    <a href="https://comic.naver.com/webtoon/list?titleId=823195&tab=sat" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/쌉초의난.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://comic.naver.com/webtoon/list?titleId=760001" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/하렘.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://comic.naver.com/webtoon/list?titleId=747269" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/전독시.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://comic.naver.com/webtoon/list?titleId=823285" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/기자매.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://comic.naver.com/webtoon/list?titleId=641253" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/외모.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                </div>
            </div>
        </section><!-- End Culture Category Section -->

        <!-- ======= Business Category Section ======= -->
        <section class="category-section">
            <div class="container" data-aos="fade-up">
                <div class="section-header d-flex justify-content-between align-items-center mb-5">
                    <h2>Kakao</h2>
                    <div><a href="wList?platform=kakao" class="more">See All Kakao</a></div>
                </div>

                <div class="row" style="display: flex; flex-wrap: nowrap; justify-content: center;">
                    <a href="https://webtoon.kakao.com/content/%EB%82%98-%ED%98%BC%EC%9E%90%EB%A7%8C-%EB%A0%88%EB%B2%A8%EC%97%85/2320" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/나혼자.jpg" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://webtoon.kakao.com/content/%EB%82%B4%EC%9D%BC%EC%9D%98-%EC%9C%BC%EB%9C%B8/2728" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/선업튀.jpg" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://webtoon.kakao.com/content/%EC%95%85%EB%85%80%EB%8A%94-%EB%A7%88%EB%A6%AC%EC%98%A4%EB%84%A4%ED%8A%B8/2464" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/악녀.jpg" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://webtoon.kakao.com/content/%EC%95%84%EB%B9%A0%EA%B0%80-%EB%84%88%EB%AC%B4-%EA%B0%95%ED%95%A8/2402" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/아빠가.jpg" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://webtoon.kakao.com/content/%ED%99%88-%ED%94%8C%EB%A0%88%EC%9D%B4%ED%8A%B8%EC%9D%98-%EB%B9%8C%EB%9F%B0/3287" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/또구.jpg" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                </div>
            </div>
        </section><!-- End Business Category Section -->

        <!-- ======= Lifestyle Category Section ======= -->
        <section class="category-section">
            <div class="container" data-aos="fade-up">
                <div class="section-header d-flex justify-content-between align-items-center mb-5">
                    <h2>Lezhin</h2>
                    <div><a href="wList?platform=lezhin" class="more">See All Lezhin</a></div>
                </div>

                <div class="row" style="display: flex; flex-wrap: nowrap; justify-content: center;">
                    <a href="https://www.lezhin.com/ko/comic/black_survival_bp" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/레진1.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://www.lezhin.com/ko/comic/aran" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/레진2.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://www.lezhin.com/ko/comic/tong_3" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/레진3.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://www.lezhin.com/ko/comic/headleader" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/레진4.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                    <a href="https://webtoon.kakao.com/content/%ED%99%88-%ED%94%8C%EB%A0%88%EC%9D%B4%ED%8A%B8%EC%9D%98-%EB%B9%8C%EB%9F%B0/3287" style="display: inline-block; width: 230px; height: 300px; margin-right: 10px;">
                        <img src="./resources/assets/img/레진5.png" style="width: 100%; height: 100%; object-fit: cover;"> 
                    </a>
                </div>
            </div>
        </section><!-- End Lifestyle Category Section -->

    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <%@ include file="footer.jsp" %>
    </footer>

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
            
        $("#blist").click(()=>{
            location.href="bList";
        });
        
        $('#check').click(()=>{
            location.href = "check";
        });

        $('#roulette').click(()=>{
            location.href = "roulette";
        });
        
        $('#mPoint').click(()=>{
    		location.href = "mPoint";
    	});
        
        var swiper = new Swiper('.sliderFeaturedPosts', {
            loop: true,
            navigation: {
                nextEl: '.custom-swiper-button-next',
                prevEl: '.custom-swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            autoplay: {
                delay: 5000,
                disableOnInteraction: false,
            },
        });

        var isPlaying = true;

        document.querySelector('.play-pause-button').addEventListener('click', function() {
            if (isPlaying) {
                swiper.autoplay.stop();
                document.getElementById('playPauseIcon').classList.remove('bi-pause');
                document.getElementById('playPauseIcon').classList.add('bi-play');
            } else {
                swiper.autoplay.start();
                document.getElementById('playPauseIcon').classList.remove('bi-play');
                document.getElementById('playPauseIcon').classList.add('bi-pause');
            }
            isPlaying = !isPlaying;
        });
    </script>
</body>
</html>
