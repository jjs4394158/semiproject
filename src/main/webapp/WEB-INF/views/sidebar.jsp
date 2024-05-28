<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<ul class="sidebar-nav" id="sidebar-nav">

	
	<!-- End Dashboard Nav -->

	<li class="nav-item">
	<a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
			<i class="bi bi-person"></i>
			<span>회원(Member)</span>
			<i class="bi bi-chevron-down ms-auto"></i>
	</a>
		<ul id="components-nav" class="nav-content collapse "
			data-bs-parent="#sidebar-nav">
			<li><a href="joinForm"> 
			<i class="bi bi-circle"></i><span>회원가입</span>
			</a></li>
			<li><a href="loginForm">
				 <i	class="bi bi-circle"></i><span>로그인</span>
			</a></li>
			<li><a href="mList"> 
				<i	class="bi bi-circle"></i><span>회원목록</span>
			</a></li>
			<li><a href="mView?mId=${loginId}">
				 <i	class="bi bi-circle"></i><span>마이페이지</span>
			</a></li>
			<li><a href="logout"> 
				<i	class="bi bi-circle"></i><span>로그아웃</span>
			</a></li>
			
		</ul></li>
	<!-- End Components Nav -->

	<li class="nav-item"><a class="nav-link collapsed"
		data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#"> <i
			class="bi bi-journal-text"></i><span>게시판(Board)</span><i
			class="bi bi-chevron-down ms-auto"></i>
	</a>
		<ul id="forms-nav" class="nav-content collapse "
			data-bs-parent="#sidebar-nav">
			<li><a href="writeForm"> <i class="bi bi-circle"></i><span>게시글 등록</span>
			</a></li>
			<li><a href="bList"> <i class="bi bi-circle"></i><span>게시글 목록</span>
			</a></li>
			<li><a href="bSearch?category=BWRITER&keyword=${loginId}"> <i class="bi bi-circle"></i><span>내가 쓴 글</span>
			</a></li>
			<li><a href="#"> <i class="bi bi-circle"></i><span>내가 쓴 댓글</span>
			</a></li>
		</ul></li>
	<!-- End Forms Nav -->

	
	<!-- End Blank Page Nav -->

</ul>