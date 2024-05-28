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
  <c:set var="isLoggedIn" value="${not empty loginId}" />
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="./resources/assets/img/logo.png" alt=""> -->
        <h1>Toonniverce</h1>
      </a>

      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="single-post.html">전체 웹툰</a></li>
          <li><a href="search-result.html">도전! 웹툰</a></li>
          <li><a href="bList">자유게시판</a></li>
            
          <li class="dropdown"><a href="#"><span>마이페이지</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="mView?mId=${loginId}">내 정보</a></li>
              <li><a href="bSearch?category=BWRITER&keyword=${loginId}">내가 쓴 글</a></li>
              <li><a href="#">보관함</a></li>
            </ul>
          </li>
        </ul>
      </nav><!-- .navbar -->
      
       

      <div class="position-relative">
      
       <a href="#" class="mx-2 js-search-open"><span class="bi-search"></span></a>
     

        <i class="bi bi-list mobile-nav-toggle"></i>

        <!-- ======= Search Form ======= -->
        <div class="search-form-wrap js-search-form-wrap">
          <form action="search-result.html" class="search-form">
            <span class="icon bi-search"></span>
            <input type="text" placeholder="Search" class="form-control">
            <button class="btn js-search-close"><span class="bi-x"></span></button>
          </form>
        </div><!-- End Search Form -->
        
        <c:choose>
        <c:when test="${isLoggedIn}">
            <button type="button" id="logout" class="btn-book-a-table">Logout</button>  
        </c:when>
        <c:otherwise>
            <button type="button" id="login" class="btn-book-a-table">Join / Login</button>
        </c:otherwise>
    </c:choose>

      </div>    
    </div>

  </header><!-- End Header -->
<!-- ======= Content Section ======= -->
<div id="content" >
</div>
<br/>
  <!-- Content goes here -->

  <!-- ======= Information Section ======= -->
  <section id="information" style="margin-top: 50px; height: 100px; bottom: 70%; width: 300px; margin-left: auto; margin-right: auto;">
    <div class="container">
      <div class="row">
        <div class="col-lg-12 d-flex justify-content-center">
          <span style="font-size: 50px; font-family: var(--font-primary);">내 정보</span>
        </div>
      </div>
    </div>
  </section>
  <br/>
 
	  <div class="row justify-content-center" style=" display: flex; align-items: center;" >
 
        <div class="col-xl-6">
          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Profile</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>

  
              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title">About</h5>
                  
                  <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
		               <img src="./resources/profile/${view.MProfileName}" alt="Profile" style="height:100px;" class="rounded-circle">
        		      <h2>${view.MName}</h2>
              <div class="social-links mt-2">
                <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
                <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
                <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
                <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>

                  <h5 class="card-title">Profile Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">아이디</div>
                    <div class="col-lg-9 col-md-8">${view.MId }</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이름</div>
                    <div class="col-lg-9 col-md-8">${view.MName}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">생년월일</div>
                    <div class="col-lg-9 col-md-8">${view.MBirth}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">이메일</div>
                    <div class="col-lg-9 col-md-8">${view.MEmail}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">연락처</div>
                    <div class="col-lg-9 col-md-8">${view.MPhone}</div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">주소</div>
                    <div class="col-lg-9 col-md-8">${view.MAddr}</div>
                  </div>

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form action="mModify" method="post" enctype="multipart/form-data">

								<!-- 비밀번호 -->
								<div class="row mb-3">
									<label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
									<div class="col-sm-10">
										<input type="password" name="mPw" id="mPw"
											class="form-control" />
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
										<input type="text" name="mName" class="form-control" 
										placeholder="${view.MName}"/>
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
										<input type="email" name="mEmail" class="form-control"
										placeholder="${view.MEmail}"/>
									</div>
								</div>

								<!-- 연락처 -->
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">연락처</label>
									<div class="col-sm-10">
										<input type="text" name="mPhone" class="form-control" 
										placeholder="${view.MPhone}"/>
									</div>
								</div>


								<!-- 주소 -->
								<div class="row mb-3">
									<label for="inputText" class="col-sm-2 col-form-label">주소</label>
									<div class="col-md-6">
										<div class="input-group">
											<input type="text" name="addr1" id="sample6_postcode"
												class="form-control" placeholder="우편번호"> 
												<input type="button" onclick="sample6_execDaumPostcode()"
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
									<img src="./resources/profile/${view.MProfileName}" id="preview" width="150px" />
									<p></p>
									<input class="form-control" type="file" id="mProfile"name="mProfile"> 	
									</div>
								</div>

								<!-- 수정 버튼 -->
								<div class="row mb-3">
									<div class="col-sm-10" style="text-align: center;">
										<input type="hidden" name="mId" value="${view.MId}" />
										<input type="hidden" name="mProfileName" value="${view.MProfileName}" />
										<button type="submit" class="btn btn-primary">수정</button>
										 <button id="delete" class="btn btn-primary">회원 탈퇴</button>
									</div>
								</div>

							</form><!-- End Profile Edit Form -->

                </div>

              

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
        </div>
    
    <br/>
    <br/>
    

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
  
  <!-- jQuery & DaumAPI -->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	
	$('#join').click(()=>{
		location.href = "joinForm";
	});
	
	$('#login').click(()=>{
		location.href = "loginForm";
	});
	
	$('#logout').click(()=>{
		location.href = "mLogout";
		alert("로그아웃되었습니다.");
	});

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
    
    
    
    $("#delete").click(()=>{
    	
    	if(confirm('탈퇴하시겠습니까?')){
		location.href="mDelete?mId=${view.MId}&mProfileName=${view.MProfileName}";
    	}
    	
	});
    
    
</script>

</body>

</html>