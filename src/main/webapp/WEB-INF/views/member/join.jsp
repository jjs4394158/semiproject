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

<!-- ======= Content Section ======= -->
<div id="content"  >
</div>
<br/>
  <!-- Content goes here -->

  <!-- ======= Information Section ======= -->
<section id="information" style="margin-top: 70px; height: 100px; display: flex; align-items: center; justify-content: center; width: 300px; margin-left: auto; margin-right: auto;">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 d-flex justify-content-center">
          <span style="font-size: 50px; font-family: var(--font-primary);">회원가입</span>
        </div>
      </div>
    </div>
  </section>
  <br/>
 
			<div class="row justify-content-center">
				<div class="col-lg-6" >
					<div class="card" >
						<div class="card-body" >
							<h5 class="card-title"></h5>

							<!-- 회원가입 form 양식 -->
							<form action="mJoin" method="post" enctype="multipart/form-data">

								<!-- 아이디 -->
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">아이디</label>
									<div class="col-sm-10">
										<input type="text" name="mId" id="mId" class="form-control" />
										<p id="check1"></p>
									</div>
								</div>

								<!-- 비밀번호 -->
								<div class="row mb-3">
									<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
									<div class="col-sm-10">
										<input type="password" name="mPw" id="mPw" class="form-control" />
										<p id="check2"></p>
									</div>
								</div>

								<!-- 비밀번호 확인 -->
								<div class="row mb-3">
									<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호
										확인</label>
									<div class="col-sm-10">
										<input type="password" id="checkPw" class="form-control" />
										<p id="check3"></p>
									</div>
								</div>

								<!-- 이름 -->
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">이름</label>
									<div class="col-sm-10">
										<input type="text" name="mName" class="form-control" />
									</div>
								</div>

								<!-- 생년월일 -->
								<div class="row mb-3">
									<label for="inputDate" class="col-sm-2 col-form-label">생년월일</label>
									<div class="col-sm-10">
										<input type="date" name="mBirth" class="form-control">
									</div>
								</div>

								<!-- 이메일 -->
								<div class="row mb-3">
									<label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
									<div class="col-sm-10">
										<input type="email" name="mEmail" class="form-control">
									</div>
								</div>

								<!-- 연락처 -->
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">연락처</label>
									<div class="col-sm-10">
										<input type="text" name="mPhone" class="form-control" />
									</div>
								</div>


								<!-- 주소 -->
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">주소</label>
									<div class="col-md-6">
										<div class="input-group">
											<input type="text" name="addr1" id="sample6_postcode"
												class="form-control" placeholder="우편번호"> <input
												type="button" onclick="sample6_execDaumPostcode()"
												class="btn btn-secondary" value="주소찾기">
										</div>
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label"></label>
									<div class="col-md-6">
										<input type="text" name="addr2" id="sample6_address"
											class="form-control" placeholder="주소">
									</div>
								</div>
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label"></label>
									<div class="col-md-6">
										<input type="text" name="addr3" id="sample6_detailAddress"
											class="form-control" placeholder="상세주소">
									</div>
								</div>

								<!-- 프로필 사진 -->
								<div class="row mb-3">
									<label for="inputNumber" class="col-sm-2 col-form-label">프로필 사진</label>
									<div class="col-sm-10">
										<input class="form-control" type="file" id="mProfile"name="mProfile"> 
										<br/><img id="preview" width="150px" />
									</div>
								</div>

								<!-- 가입 버튼 -->
								<div class="row mb-3">
									<div class="col-sm-10" style="text-align: center;">
										<button type="submit" class="btn btn-primary">회원가입</button>
									</div>
								</div>

							</form>
							<!-- End General Form Elements -->

						</div>
					</div>

				</div>

			</div>

		<br/>
		<br/>
		


	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<%@ include file="../footer.jsp" %>
	</footer>
	<!-- End Footer -->

		<a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="./resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="./resources/assets/vendor/aos/aos.js"></script>
  <script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="./resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="./resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="./resources/assets/js/main.js"></script>

	<!-- jQuery & DaumAPI -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>

	let mId = $('#mId');
	let check1 = $('#check1');
	let checked1 = false;
	
	let mPw = $('#mPw');
	let check2 = $('#check2');
	
	let checkPw = $('#checkPw');
	let check3 = $('#check3');
	
	let mProfile = $('#mProfile');
	let preview = $('#preview');
	
	mId.keyup(()=>{
		$.ajax({
			type : "POST",
			url : "idCheck",
			data : 
			{
				"mId" : mId.val()
			},
			dataType : "text",
			success : function(result){
				if(result=="OK"){
					check1.html(mId.val()+"는 사용 가능한 아이디");
					check1.css("color", "blue");
					checked1 = true;
				} else {
					check1.html(result + "는 사용중인 아이디");
					check1.css("color", "red");	
				}
				
			},
			error : function(){
				alert('idCheck함수 통신 실패!');
			}
			
		});
	});
	
	
	mPw.keyup(()=>{
		let pwVal = mPw.val();
		
		let num = pwVal.search(/[0-9]/);
		let eng = pwVal.search(/[a-z]/);
		let spe = pwVal.search(/[`~!@#$%^&*|\\\'\":;\/?]/);
		let spc = pwVal.search(/\s/);
		
		check2.css("color", "red");
		
		if(spc != -1){	
			check2.html("공백없이 입력");
		} else if(pwVal.length < 8 || pwVal.length > 16){
			check2.html("비밀번호는 8자리에서 16자리로 입력");
		} else if(num == -1 || eng == -1 || spe == -1){	
			check2.html("영문, 숫자, 특수문자를 혼합해서 입력");
		} else {
			check2.html("사용가능한 비밀번호");
			check2.css("color", "blue");
		}
		
	});
	
	checkPw.keyup(()=>{
		if(mPw.val() == checkPw.val()){
			check3.html("비밀번호 일치");
			check3.css("color", "blue");
		} else {
			check3.html("비밀번호 불일치");
			check3.css("color", "red");
		}
	});
	
	mProfile.on("change", (event)=>{
		let file = event.target.files[0];
		
		let reader = new FileReader();
		reader.onload = (e) => {
			preview.attr("src", e.target.result);
		}
		
		reader.readAsDataURL(file);
	});
	
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }   
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
 // 폼 제출 전 필수 입력 항목 확인
	document.getElementById('signupForm').onsubmit = function() {
		// 아이디 입력 확인
		if (!mId.val()) {
			alert('아이디를 입력하세요.');
			mId.focus();
			return false;
		}

		// 비밀번호 입력 확인
		if (!mPw.val()) {
			alert('비밀번호를 입력하세요.');
			mPw.focus();
			return false;
		}

		// 비밀번호 확인 입력 확인
		if (mPw.val() != checkPw.val()) {
			alert('비밀번호가 일치하지 않습니다.');
			checkPw.focus();
			return false;
		}

		// 아이디 중복 체크 확인
		if (!checked1) {
			alert('아이디 중복 확인을 해주세요.');
			mId.focus();
			return false;
		}

		// 이름 입력 확인
		if (!mName.val()) {
			alert('이름을 입력하세요.');
			mName.focus();
			return false;
		}

		// 연락처 입력 확인
		if (!mPhone.val()) {
			alert('연락처를 입력하세요.');
			mPhone.focus();
			return false;
		}

		return true;
	};
</script>


</body>

</html>