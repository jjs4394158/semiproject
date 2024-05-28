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
  	<%@ include file="../header.jsp" %>
    </header><!-- End Header -->


	
	  <!-- ======= Information Section ======= -->
    <div class="container">
      <div class="row">
          <span style="font-size: 50px; font-family: var(--font-primary); background-color: lightgray; margin: 0 auto; width: 300px; text-align: center;">PROFILE</span>
      </div>
    </div>
    <br/>



			<div class="row justify-content-center">
				<div class="col-lg-6">
				
				<div class="pagetitle" style="text-align:center;">
					<h1>${modify.BNum}번 게시글 수정</h1>
				</div>

					<div class="card">
						<div class="card-body">
							<h5 class="card-title"></h5>

							<form action="bModify" method="post" enctype="multipart/form-data">

								<!-- 제목 -->
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">제목</label>
									<div class="col-sm-10">
										<input type="text" name="bTitle" placeholder="${modify.BTitle}" class="form-control" />
									</div>
								</div>

								<!-- 내용 -->
								<div class="row mb-3">
                  					<label for="inputPassword" class="col-sm-2 col-form-label">내용</label>
                 
                  					<div class="col-sm-10">
                    					<textarea name="bContents" class="form-control" style="height: 100px">${modify.BContents}</textarea>
                  					</div>
              					</div>

								<!-- 첨부파일 -->
								<div class="row mb-3">
									<label for="inputNumber" class="col-sm-2 col-form-label">프로필 사진</label>
									<div class="col-sm-10">
										<input class="form-control" type="file" id="bFile" name="bFile"> 
										<br/><img id="preview" width="150px" src="./resources/fileUpload/${modify.BFileName}"/>
									</div>
								</div>
								
								

								<!-- 등록 버튼 -->
								<div class="row mb-3">
									<div class="col-sm-10" style="text-align: center;">
										<input type="hidden" name="bNum" value="${modify.BNum}"/>
										<input type="hidden" name="bFileName" value="${modify.BFileName}"/>
										<button type="submit" class="btn btn-primary">수정</button>
									</div>
								</div>

							</form>
							<!-- End General Form Elements -->

						</div>
					</div>

				</div>

			</div>

	<!-- End #main -->

 <br/>
    <br/>
    

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <%@ include file="../footer.jsp" %>
  </footer><!-- End Footer -->

	<a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="./resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="./resources/assets/vendor/aos/aos.js"></script>
  <script src="./resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="./resources/assets/js/main.js"></script>
  
  <!-- jQuery & DaumAPI -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	$('#bFile').on("change", (event)=>{
		let file = event.target.files[0];
		
		let reader = new FileReader();
		reader.onload = (e) => {
			$('#preview').attr("src", e.target.result);
		}
		
		reader.readAsDataURL(file);
	});
</script>


</body>

</html>