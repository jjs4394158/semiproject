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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">
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
        .book-a-table {
            padding: 60px 0;
        }
        .section-header {
            text-align: center;
            padding-bottom: 10px;
        }
        .php-email-form {
            width: 100%;
        }
        
        .reserv {
            display: inline-block;
            padding: 10px 20px;
            font-size: 1em;
            color: #fff;
            background-color: skyblue;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            cursor: pointer;
        }
        .reserv:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- ======= Header ======= -->
    <header id="header" class="header d-flex align-items-center fixed-top">
        <%@ include file="../header.jsp"%>
    </header><!-- End Header -->

    <main id="main" style="width: 100%;">
        <section id="book-a-table" class="book-a-table">
            <div class="container center-form-container" data-aos="fade-up">
                <div class="section-header">
                    <h3>포인트 교환하기</h3>
                    <p>${sessionScope.loginId}님의 포인트는 <span id="userPoints">${sessionScope.mpoints}</span> 입니다.</p>
                </div>
                
                <div class="d-flex justify-content-center" style="margin-top: 30px;">
                    <div class="col-lg-8">
                        <form action="reserv" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100" enctype="multipart/form-data" onsubmit="return checkPoints()">
                            <div class="row gy-4">
                                <div class="col-lg-4 col-md-6">
                                    <input type="text" name="name" class="form-control" id="name" placeholder="Your Name" required>
                                    <div class="validate"></div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
                                    <div class="validate"></div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="Your Phone" required>
                                    <div class="validate"></div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <select style="font-size: 14px; height: 45px;" class="form-control" name="event" id="event" required onchange="updatePrice()">
                                        <option value="">Select an item</option>
                                        <option value="iPhone 15 Pro" data-price="20000">iPhone 15 Pro</option>
                                        <option value="AirPods(3세대)" data-price="10000">AirPods(3세대)</option>
                                        <option value="Nintendo Switch" data-price="10000">Nintendo Switch</option>
                                        <option value="PlayStation 5" data-price="15000">PlayStation 5</option>
                                        <option value="신세계 상품권(10만원)" data-price="5000">신세계 상품권(10만원)</option>
                                        <option value="스타벅스 e카드교환권(5만원)" data-price="3000">스타벅스 e카드교환권(5만원)</option>
                                    </select>
                                    <div class="validate"></div>
                                </div>
                                
                                <div class="col-lg-4 col-md-6">
                                    <input type="text" name="price" class="form-control" id="price" placeholder="Price" readonly>
                                </div>
                            </div>
                            <div class="row gy-4 mt-3">
                                <div class="col-lg-4 col-md-6">
                                    <input type="text" name="rAddr" id="sample6_postcode" class="form-control" placeholder="우편번호">
                                    <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-secondary mt-2" value="주소찾기">
                                    <div class="validate"></div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <input type="text" name="rAddr" id="sample6_address" class="form-control" placeholder="주소">
                                    <div class="validate"></div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <input type="text" name="rAddr" id="sample6_detailAddress" class="form-control" placeholder="상세주소">
                                    <div class="validate"></div>
                                </div>
                            </div>
                            <div class="form-group mt-3">
                                <textarea class="form-control" name="message" rows="5" placeholder="Message"></textarea>
                                <div class="validate"></div>
                            </div>
                            <div class="mb-3">
                                <div class="error-message"></div>
                                <div class="sent-message">Thank you!</div>
                            </div>
                            <div class="text-center"><button type="submit" class="reserv">제출하기</button></div>
                        </form>
                    </div><!-- End Reservation Form -->
                </div>
            </div>
        </section><!-- End Book A Table Section -->
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

    <!-- Template Main JS File -->
    <script src="./resources/assets/js/main.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <!-- jQuery & DaumAPI -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    $('#reserv').click(()=>{
		location.href = "change";
	});
    
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = '';
                    if (data.userSelectedType === 'R') { 
                        addr = data.roadAddress;
                    } else { 
                        addr = data.jibunAddress;
                    }

                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }

        function updatePrice() {
            var eventSelect = document.getElementById("event");
            var selectedOption = eventSelect.options[eventSelect.selectedIndex];
            var price = selectedOption.getAttribute("data-price");
            var userPoints = parseInt(document.getElementById("userPoints").innerText);

            if (price && parseInt(price) > userPoints) {
                alert("포인트가 부족합니다.");
                document.getElementById("price").value = "";
            } else {
                document.getElementById("price").value = price ? price : "";
            }
        }

        function checkPoints() {
            var price = parseInt(document.getElementById("price").value);
            var userPoints = parseInt(document.getElementById("userPoints").innerText);
            if (price > userPoints) {
                alert("포인트가 부족합니다.");
                return false;
            }
            document.getElementById("userPoints").innerText = userPoints - price;
            return true;
        }
    </script>
</body>
</html>
