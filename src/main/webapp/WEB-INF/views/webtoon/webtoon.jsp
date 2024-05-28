<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Toonniverce</title>
<style>
.naver-box {
	display: inline-block;
	margin: 15px;
	width: 250px;
	height: 420px; /* Height adjusted to accommodate the additional text */
	font-size: 20px;
	text-align: center;
	cursor: pointer;
	vertical-align: top; /* Align all boxes to the top */
}

.naver-box img {
	width: 100%;
	height: 350px;
	margin-bottom: 10px;
	object-fit: cover;
}

.naver-box .title {
	font-weight: bold;
	font-size: 18px;
	height: 40px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.naver-box .author {
	font-size: 13px;
	color: gray;
	height: 20px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.TagGroup__tag_wrap--HrxE5 {
	display: flex;
	justify-content: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.TagGroup__tag--xu0OH {
	border-color: transparent;
	background-color: #F2F2F2;
	width: 130px;
	height: 40px;
	font-size: 16px;
	border-radius: 5px;
	margin-right: 10px;
	margin-bottom: 5px;
	margin-top: 5px;
	cursor: pointer;
}

.TagGroup__tag--xu0OH.selected {
	background-color: green;
	color: white;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	display: flex;
	flex-direction: column;
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 800px;
	align-items: flex-start;
	position: relative;
}

.modal-details {
	display: flex;
	width: 100%;
	margin-bottom: 20px;
}

.modal-details img {
	width: 40%;
	margin-right: 20px;
	object-fit: cover;
}

.modal-details .text-content {
	width: 60%;
	display: flex;
	flex-direction: column;
}

.close {
	position: absolute;
	right: 20px;
	top: 10px;
	color: #aaa;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.modal-details a {
	color: blue;
	text-decoration: underline;
}

.table {
	width: 100%;
	margin-top: 20px;
}

.table th, .table td {
	padding: 10px;
	text-align: left;
	border: 1px solid #ddd;
}

.table th {
	background-color: #f2f2f2;
}
</style>
<link href="./resources/assets/img/웹툰1.png" rel="icon">
<link href="./resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">
<link
	href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap"
	rel="stylesheet">
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
<link href="./resources/assets/css/variables.css" rel="stylesheet">
<link href="./resources/assets/css/main.css" rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
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

	<main id="main">
		<div class="container" data-aos="fade-up">
			<div
				class="section-header d-flex justify-content-between align-items-center mb-3">
				<h2>WebToon</h2>
			</div>
			<div class="GenreListView__tag_wrap--HrxE5"
				style="justify-content: center;">
				<div role="tablist"
					class="TagGroup__tag_group--uUJza TagGroup__type_l--tJOoo">
					<h1>플랫폼</h1>
					<button type="button" role="tab" class="TagGroup__tag--xu0OH"
						id="allWebtoons">전체 웹툰</button>
					<button type="button" role="tab" class="TagGroup__tag--xu0OH"
						data-platform="naver">네이버</button>
					<button type="button" role="tab" class="TagGroup__tag--xu0OH"
						data-platform="kakao">카카오</button>
					<button type="button" role="tab" class="TagGroup__tag--xu0OH"
						data-platform="lezhin">레진</button>
				</div>
				<div class="GenreListView__tag_wrap--HrxE5"
					style="justify-content: center;">
					<div role="tablist"
						class="TagGroup__tag_group--uUJza TagGroup__type_l--tJOoo">
						<h1>장르</h1>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="로맨스">#로맨스</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="판타지">#판타지</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="액션">#액션</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="일상">#일상</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="스릴러">#스릴러</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="개그">#개그</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="무협/사극">#무협/사극</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="드라마">#드라마</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="감성">#감성</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="스포츠">#스포츠</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="BL">#BL</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="백합">#백합</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="코믹">#코믹</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="미스터리">#미스터리</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="학원">#학원</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="공포">#공포</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="타임슬립">#타임슬립</button>
						<button type="button" role="tab" class="TagGroup__tag--xu0OH"
							data-genre="성장물">#성장물</button>
					</div>
				</div>
				<div id="wList"
					style="display: flex; flex-wrap: wrap; justify-content: center;"></div>
			</div>
		</div>
	</main>
	<!-- End #main -->

	<!-- 모달 추가 -->
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="modalDetails" class="modal-details">
				<img id="modalThumbnail" src="" alt="Thumbnail">
				<div class="text-content"></div>
			</div>
			<!-- 댓글 섹션 시작 -->
			<div id="cmtArea" class="list-group"
				style="width: 100%; margin-top: 20px;"></div>
			<div
				style="display: flex; justify-content: space-between; align-items: center; width: 100%;"
				class="card-footer">
				<input type="text" id="cContents" class="form-control" required=""
					style="flex: 1; margin-right: 10px;"> <label
					style="display: flex; align-items: center; margin-right: 10px;">
					<input type="checkbox" id="cSecret" value="비밀댓글"
					style="margin-right: 5px;"> 스포일러
				</label>
				<div style="display: flex; align-items: center;">
					<input type="button" class="btn btn-primary" id="writeBtn"
						value="등록">
				</div>
			</div>
			<!-- 댓글 섹션 끝 -->
		</div>
	</div>

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<%@ include file="../footer.jsp"%>
	</footer>
	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>
	<script
		src="./resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="./resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="./resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="./resources/assets/vendor/aos/aos.js"></script>
	<script src="./resources/assets/vendor/php-email-form/validate.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"
		integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.min.js"></script>
	<script>
        $(document).ready(function() {
            $('.TagGroup__tag--xu0OH[data-platform]').click(function() {
                $('.TagGroup__tag--xu0OH[data-platform]').removeClass('selected');
                $(this).addClass('selected');
                updateURL();
            });

            $('#allWebtoons').click(function() {
                $('.TagGroup__tag--xu0OH[data-platform]').removeClass('selected');
                $(this).addClass('selected');
                updateURL();
            });

            $('.TagGroup__tag--xu0OH[data-genre]').click(function() {
                $('.TagGroup__tag--xu0OH[data-genre]').removeClass('selected');
                $(this).addClass('selected');
                updateURL();
            });

            function updateURL() {
                var platform = $('.TagGroup__tag--xu0OH[data-platform].selected').data('platform') || '';
                var genre = $('.TagGroup__tag--xu0OH[data-genre].selected').data('genre') || '';
                var url = "wList";
                var params = [];
                if (platform) {
                    params.push("platform=" + platform);
                }
                if (genre) {
                    params.push("genre=" + genre);
                }
                if (params.length > 0) {
                    url += "?" + params.join("&");
                }
                console.log("생성된 URL:", url); // URL 생성 확인
                window.location.href = url;
            }

            var params = new URLSearchParams(window.location.search);
            var platform = params.get('platform') || '';
            var genre = params.get('genre') || '';
            var url = "webtoon";
            if (platform) {
                url += "?platform=" + platform;
                $('.TagGroup__tag--xu0OH[data-platform="'+platform+'"]').addClass('selected');
            }
            if (genre) {
                url += (url.includes('?') ? '&' : '?') + "genre=" + genre;
                $('.TagGroup__tag--xu0OH[data-genre="'+genre+'"]').addClass('selected');
            }
            console.log("요청할 URL:", url); // 요청할 URL 확인

            $.ajax({
                type: "GET",
                url: url,
                dataType: "json",
                success: function(list) { 
                    console.log("서버 응답:", list); // 서버 응답 확인
                    wList(list); 
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("요청 실패:", textStatus, errorThrown); // 에러 확인
                    alert('불러오기 실패!');
                }
            });

            function wList(list) {
                let output = "";
                output += "<div id='naver-wrap'>";
                
                for (let i in list) {
                    console.log("웹툰 데이터:", list[i]); // 각 웹툰 데이터 확인
                    let title = list[i].title.length > 15 ? list[i].title.substring(0, 15) + "..." : list[i].title;
                    let story = list[i].story ? list[i].story : '';
                    output += "<div class='naver-box' data-title='" + list[i].title + "' data-author='" + list[i].authorname + "' data-thumbnail='" + list[i].thumbnail + "' data-webtoon_url='" + list[i].webtoon_URL + "' data-story='" + story + "'>";
                    output += "<br/>";
                    output += "<img src='" + list[i].thumbnail + "' width='250px' />";
                    output += "<br/>";
                    output += "<div class='title'>" + title + "</div>";
                    output += "<div class='author'>" + list[i].authorname + "</div>";
                    output += "</div>";
                }
                output += "</div>";
                
                $('#wList').html(output); // DOM에 데이터를 삽입합니다.

                // 웹툰 박스 클릭 이벤트 추가
                $('.naver-box').click(function() {
                    let title = $(this).data('title');
                    let author = $(this).data('author');
                    let thumbnail = $(this).data('thumbnail');
                    let webtoon_url = $(this).data('webtoon_url');
                    let story = $(this).data('story');
                    console.log(title, author, thumbnail, webtoon_url, story); // 데이터 확인을 위해 로그 출력
                    $('#modalThumbnail').attr('src', thumbnail);
                    $('.text-content').html("<h2>" + title + "</h2><p>작가: " + author + "</p><p>줄거리: " + story + "</p><a href='" + webtoon_url + "' target='_blank' style='color: blue; text-decoration: underline;'>웹툰 보기</a>");
                    $('#myModal').show();

                    // 댓글 로드
                    loadComments();
                });
            }

            // 모달 닫기 이벤트
            $('.close').click(function() {
                $('#myModal').hide();
            });

            $(window).click(function(event) {
                if (event.target == $('#myModal')[0]) {
                    $('#myModal').hide();
                }
            });

            // 댓글 로드
            function loadComments() {
                $.ajax({
                    type: "POST",
                    url: "cList",
                    data: {
                        "cbNum": 1 // 여기에 실제 게시글 ID를 동적으로 설정해야 합니다.
                    },
                    dataType: "json",
                    success: function(list){
                        cmtList(list);
                    },
                    error: function(){
                        alert('댓글 불러오기 실패!');
                    }
                });
            }

            function cmtList(list){
                let output = "";
                let secretComments = JSON.parse(localStorage.getItem('secretComments')) || {};

                // 좋아요 많은 댓글 3개를 맨 위에 고정
                list.sort((a, b) => b.likes - a.likes);
                const topComments = list.slice(0, 3);
                const otherComments = list.slice(3);

                output += "<table class='table'>";
                output += "<tr>";
                output += "<th>작성자</th>";
                output += "<th>내용</th>";
                output += "<th>작성일</th>";
                output += "<th>좋아요</th>";
                output += "<th></th>";  // 수정 및 삭제 버튼 위치
                output += "</tr>";

                // 상위 3개 댓글 먼저 추가
                topComments.forEach(comment => {
                    output += createCommentRow(comment, secretComments, true);
                });

                // 나머지 댓글 추가
                otherComments.forEach(comment => {
                    output += createCommentRow(comment, secretComments, false);
                });

                output += "</table>";
                $('#cmtArea').html(output);

                // 비밀 댓글 클릭 이벤트 처리
                $('.secret-comment').click(function(event){
                    event.preventDefault();
                    let commentId = $(this).data('commentid');
                    $(this).parent().text($(this).data('contents'));
                    secretComments[commentId] = true;
                    localStorage.setItem('secretComments', JSON.stringify(secretComments));
                });

                $('.like-btn').click(function(event){
                    var commentId = $(this).data('commentid');
                    $.ajax({
                        type: "POST",
                        url: "addLike",
                        data: {
                            "commentId": commentId,
                            "userId": '${loginId}'
                        },
                        dataType: "json",
                        success: function(result) {
                            if(result) {
                                alert('좋아요를 눌렀습니다!');
                                loadComments();
                            } else {
                                alert('이미 좋아요를 누르셨습니다.');
                            }
                        },
                        error: function() {
                            alert('좋아요 처리 실패!');
                        }
                    });
                });

                $('.cmodify').click((e)=>{
                    let commentId = $(e.target).val();
                    let newContent = prompt('댓글을 수정하세요:', $(e.target).closest('tr').find('.comment-content').text());
                    if (newContent) {
                        $.ajax({
                            type : "POST",
                            url : "cModify",
                            data : {
                                "cNum" : commentId,
                                "cbNum" : 1, // 여기에 실제 게시글 ID를 동적으로 설정해야 합니다.
                                "cContents" : newContent
                            },
                            dataType : "json",
                            success : function(list){
                                cmtList(list);
                            },
                            error : function(){
                                alert('댓글 수정 실패!');
                            }
                        });
                    }
                });

                $('.cdelete').click((e)=>{
                    if(confirm('댓글을 삭제하시겠습니까?')) {
                        $.ajax({
                            type : "POST",
                            url : "cDelete",
                            data : { 
                                "cNum" : e.target.value,
                                "cbNum" : 1 // 여기에 실제 게시글 ID를 동적으로 설정해야 합니다.
                            },
                            dataType : "json",
                            success : function(list){
                                cmtList(list);
                            },
                            error : function(){
                                alert('댓글 삭제 실패!');
                            }
                        });
                    }
                });
            }

            function createCommentRow(comment, secretComments, isTop) {
                let row = "<tr>";
                row += "<td>" + comment.cwriter + "</td>";
                row += "<td class='comment-content'>";
                if (isTop) {
                    row += "<span class='badge bg-danger'>BEST</span> ";
                }
                if(comment.csecret){
                    if(secretComments[comment.cnum]){
                        row += comment.ccontents;
                    } else {
                        row += "<a href='#' class='secret-comment' data-contents='" + comment.ccontents + "' data-commentid='" + comment.cnum + "'>스포방지 댓글입니다.</a>";
                    }
                } else {
                    row += comment.ccontents;
                }
                row += "</td>";
                row += "<td>" + comment.cdate + "</td>";
                row += "<td><button class='like-btn' data-commentid='" + comment.cnum + "'>좋아요 (" + comment.likes + ")</button></td>";

                if('${loginId}' == comment.cwriter || '${loginId}' == 'admin'){
                    row += "<td><button class='cmodify btn btn-sm btn-outline-secondary' value='" + comment.cnum + "'>수정</button> ";
                    row += "<button class='cdelete btn btn-sm btn-outline-danger' value='" + comment.cnum + "'>삭제</button></td>";
                } else {
                    row += "<td></td>";
                }
                row += "</tr>";
                return row;
            }

            $('#writeBtn').click(()=>{
                if(confirm('댓글을 입력하시겠습니까?')){
                    $.ajax({
                        type : "POST",
                        url : "cWrite",
                        data : {
                            "cbNum" : 1, // 여기에 실제 게시글 ID를 동적으로 설정해야 합니다.
                            "cWriter" : '${loginId}',
                            "cContents" : $('#cContents').val(),
                            "cSecret": $('#cSecret').prop('checked') ? 1 : 0
                        },
                        dataType : "json",
                        success : function(list){
                            cmtList(list);
                            $('#cContents').val("");    // 댓글창 초기화
                            $('#cSecret').prop('checked', false); // 비밀댓글 체크박스 초기화
                        },
                        error : function(){
                            alert('댓글 작성 실패!');
                        }
                    });
                } else {
                    alert('취소했습니다.');
                }
            });
        });
    </script>
</body>
</html>

