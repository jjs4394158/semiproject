<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>교환 내역</title>
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
        .section-header {
            text-align: center;
            padding-bottom: 30px;
        }
        .table-container {
            max-width: 1200px;
            margin: 0 auto;
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
            cursor: pointer.
        }
        .reserv:hover {
            background-color: #0056b3.
        }
        .table thead {
            background-color: #f8f9fa.
        }
    </style>
</head>
<body>
    <!-- ======= Header ======= -->
    <header id="header" class="header d-flex align-items-center fixed-top">
        <%@ include file="../header.jsp"%>
    </header><!-- End Header -->

    <main id="main">
        <section id="change-history" class="change-history">
            <div class="container" data-aos="fade-up">
                <div class="section-header">
                    <h3>교환 내역</h3>
                    <p>${sessionScope.loginId}님의 교환 내역입니다.</p>
                </div>
                <div class="table-container" style="margin-top: 20px;">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">이름</th>
                                <th scope="col">이메일</th>
                                <th scope="col">전화번호</th>
                                <th scope="col">이벤트</th>
                                <th scope="col">주소</th>
                                <th scope="col">메시지</th>
                                <th scope="col">포인트</th>
                                <th scope="col">날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="reserv" items="${reservList}">
                                <tr>
                                    <th scope="row">${reserv.RNum}</th>
                                    <td>${reserv.name}</td>
                                    <td>${reserv.email}</td>
                                    <td>${reserv.phone}</td>
                                    <td>${reserv.event}</td>
                                    <td>${reserv.RAddr}</td>  <!-- rAddr 속성 이름이 맞는지 확인합니다. -->
                                    <td>${reserv.message}</td>
                                    <td>${reserv.price}</td>
                                    <td>${reserv.RDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section><!-- End Change History Section -->
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
</body>
</html>
