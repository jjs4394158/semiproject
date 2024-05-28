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

<!-- Bootstrap CSS & JS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>



</head>
<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<%@ include file="../header.jsp"%>
	</header>
	<!-- End Header -->





	<!-- ======= Information Section ======= -->
	<div class="container"
		style="margin-top: 70px; height: 100px; display: flex; align-items: center; justify-content: center; width: 300px; margin-left: auto; margin-right: auto;">
		<div class="row">
			<div class="col-lg-12 d-flex justify-content-center">
				<span style="font-size: 50px; font-family: var(- -font-primary);">도전!
					웹툰</span>
			</div>
		</div>
	</div>
	<br />

	<div class="row justify-content-center"
		style="display: flex; align-items: center;">

		<div class="col-lg-6">

			<div class="card">


				<div class="card-body">
					<br />
					<form class="row g-3" action="cwSearch" method="GET">
						<!-- 검색 카테고리 -->
						<div class="col-md-2">
							<select name="category" class="form-select">
								<option value="CWTITLE">제목</option>
								<option value="CWCONTENTS">내용</option>
								<option value="CWWRITER">작성자</option>
							</select>
						</div>

						<!-- 검색어 -->
						<div class="col-md-4">
							<input type="text" class="form-control" name="keyword">
						</div>

						<!-- 검색버튼 -->
						<div class="col-md-4">
							<button type="submit" class="btn btn-outline-secondary">검색</button>
						</div>


						<c:if test="${pages ne 0}">
							<div class="col-md-2">
								<select id="limit" class="form-select">
									<option value="5">게시글수</option>
									<option value="5">5개씩</option>
									<option value="10">10개씩</option>
									<option value="20">20개씩</option>
								</select>
							</div>
						</c:if>
					</form>
					<br />


					<!-- Table with hoverable rows -->
					<table class="table table-hover" style="text-align: center;">
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">썸네일</th>
								<th scope="col">작성자</th>
								<th scope="col">작성일</th>
								<th scope="col">조회수</th>
								<th scope="col">추천</th>
							</tr>

						</thead>
						<tbody>

							<c:forEach var="list" items="${cwebtoonList}">
								<!-- 모델에 추가된 데이터를 반복해서 가져옴 -->
								<tr>
									<td>${list.cwNum}</td>
									<th><a href="cwView?cwNum=${list.cwNum}"
										style="color: black; text-decoration: underline;">${list.cwTitle}</a></th>
									<td><img src="./resources/fileUpload/${list.cwFileName}"
										class="img-fluid rounded-start" alt="..."
										style="margin: 20px auto; max-width: 100px;"></td>
									<td>${list.cwWriter}</td>
									<td>${list.cwDate}</td>
									<td>${list.cwHit}</td>
									<td>${list.cwLikes}</td>
								</tr>
							</c:forEach>




						</tbody>
					</table>
					<!-- End Table with hoverable rows -->

					<c:if test="${pages ne 0}">
						<div style="text-algin: center">
							<!-- Disabled and active states -->
							<nav aria-label="...">
								<ul class="pagination" style="margin: 0 auto; width: 300px;">
									<!-- 이전 -->
									<c:if test="${paging.page <= 1}">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">이전</a></li>
									</c:if>
									<c:if test="${paging.page > 1}">
										<li class="page-item"><a class="page-link"
											href="bList?page=${paging.page-1}&limit=${paging.limit}">이전</a>
										</li>
									</c:if>



									<!-- 페이지 번호 -->
									<c:forEach var="i" begin="${paging.startPage}"
										end="${paging.endPage}">
										<c:if test="${paging.page == i}">
											<li class="page-item active" aria-current="page"><a
												class="page-link" href="#">${i}</a></li>
										</c:if>

										<c:if test="${paging.page != i}">
											<li class="page-item"><a class="page-link"
												href="bList?page=${i}&limit=${paging.limit}">${i}</a></li>
										</c:if>

									</c:forEach>


									<!-- 다음 -->
									<c:if test="${paging.page >= paging.maxPage}">
										<li class="page-item disabled"><a class="page-link"
											href="#" tabindex="-1" aria-disabled="true">다음</a></li>
									</c:if>
									<c:if test="${paging.page < paging.maxPage}">
										<li class="page-item"><a class="page-link"
											href="bList?page=${paging.page+1}&limit=${paging.limit}">다음</a>
										</li>
									</c:if>

								</ul>
							</nav>
							<!-- End Disabled and active states -->

							<div style="text-align: right; margin-right: 20px;">
								<a href="cwwriteForm"
									style="color: white; background-color: skyblue; isplay: inline-block; padding: 6px 6px;">웹툰투고</a>
							</div>
						</div>
					</c:if>
				</div>
			</div>

		</div>
	</div>

	<!-- End #main -->

	<br />
	<br />

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<%@ include file="../footer.jsp"%>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="./resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="./resources/assets/vendor/aos/aos.js"></script>
	<script src="./resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="./resources/assets/js/main.js"></script>
	<c:if test="${loginId eq null}">
		<script>
  alert('로그인 후 사용해주세요.');
	location.href="loginForm";
</script>
	</c:if>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>

	<script>
		$("#limit").change(()=>{
			let limit = $('#limit').val();
			location.href=`mList?limit=` + limit;
		});
		
		$('#logout').click(()=>{
			location.href = "mLogout";
			alert("로그아웃되었습니다.");
		});

		</script>


</body>

</html>