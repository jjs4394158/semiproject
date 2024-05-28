<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
        table, td, th {
            border: 1px solid black;
            border-collapse: collapse;
        }

        td, th {
            padding: 10px;
        }

        .secret-comment {
            color: red; /* 빨간색으로 표시 */
            text-decoration: none; /* 링크 밑줄 제거 */
        }

        .best-comment {
            background-color: red;
            color: white;
            padding: 2px 4px;
            margin-right: 5px;
            border-radius: 3px;
        }

        #likePostBtn {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 3px;
            padding: 5px 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
            margin: 20px auto;
        }

        #likePostBtn:hover {
            background-color: #e2e6ea;
        }

        #likePostBtn i {
            margin-right: 5px;
        }

        .transparent-button {
            background: none;
            border: none;
            font-size: 16px;
            cursor: pointer;
        }

        .calendar-navigation button {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
        }

        #currentMonthYear {
            font-size: 24px;
        }

        .like-btn img {
            width: 20px;
        }

        .like-btn {
            background: none;
            border: none;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center; 
            margin: 0 auto;
        }
    </style>
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
    <%@ include file="../header.jsp" %>
</header><!-- End Header -->

<!-- ======= Information Section ======= -->
<div class="container"
     style="margin-top: 100px; height: 100px; display: flex; align-items: center; justify-content: center; width: 300px; margin-left: auto; margin-right: auto;">
    <div class="row">
        <div class="col-lg-12 d-flex justify-content-center">
            <span style="font-size: 50px; font-family: var(- -font-primary);">게시글</span>
        </div>
    </div>
</div>
<br/>

<div
    style="width: 700px; margin: 0 auto; text-align: center; overflow-y: auto;"
    class="card justify-content-center">
    <div class="card-header">
        <div class="row g-0">
            <div style="font-size: 20px;">
                <strong>[${view.BNum}] ${view.BTitle} </strong> <span
                style="color: red; font-size: 18px;"> </span>
            </div>
            <br/>
            <div style="display: flex; justify-content: space-between;">
                <div>작성자 : ${view.BWriter} | 작성일 : ${view.BDate}</div>
                <div>👍 ${view.BLikes} 👁 ${view.BHit}</div>
            </div>
        </div>
    </div>

    <div style="height: 500px; overflow-y: auto; overflow-x: hidden;"
         class="card-body">
        <div class="row g-0">
            <div class="col-md-4" style="margin: 0 auto;">
                <img src="./resources/fileUpload/${view.BFileName}"
                     class="img-fluid rounded-start" alt="..."
                     style="margin: 20px auto; max-width: 300px;">
            </div>
            <div class="card-body" style="overflow-wrap: break-word;">
                <div style="white-space: pre-wrap;">${view.BContents}</div>
            </div>
        </div>
    </div>

    <div style="display: flex; justify-content: center; margin-top: 20px;">
        <button id="likePostBtn" class="btn btn-outline-primary">
            <i class="bi bi-hand-thumbs-up"></i> 추천
        </button>
    </div>

    <!-- 신고하기 버튼 추가 -->
    <div style="display: flex; justify-content: center; margin-top: 20px;">
        <button id="reportPostBtn" class="btn btn-outline-danger">
            <i class="bi bi-exclamation-triangle"></i> 신고하기
        </button>
    </div>


    <br/>

    <div>
        <div class="list-group" id="cmtArea"></div>
        <!-- End List group Advanced Content -->
    </div>

    <div
        style="display: flex; justify-content: space-between; align-items: center;"
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

    <div
        style="display: flex; height: 50px; margin: 0 auto; align-items: center; justify-content: space-between;">
        <div>
            <c:if test="${loginId eq view.BWriter || loginId eq 'admin'}">
                <button id="modify" class="btn btn-success rounded-pill">글
                    수정
                </button>
                <button id="delete" class="btn btn-danger rounded-pill">글
                    삭제
                </button>
            </c:if>
        </div>

        <div style="text-align: right; margin-right: 20px;">
            <a href="bList"
               style="color: white; background-color: skyblue; display: inline-block; padding: 6px 6px;">전체글</a>
        </div>
    </div>
</div>
<br/>

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
<!-- jQuery & DaumAPI -->
<script src="https://code.jquery.com/jquery-3.7.1.js"
        integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script
    src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $('#logout').click(() => {
        location.href = "mLogout";
        alert("로그아웃되었습니다.");
    });

    $("#modify").click(() => {
        if (confirm('게시글을 수정 하시겠습니까?')) {
            location.href = "modifyForm?bNum=${view.BNum}";
        }
    });

    $("#delete").click(() => {
        if (confirm('게시글을 삭제 하시겠습니까?')) {
            location.href = "bDelete?bNum=${view.BNum}&bFileName=${view.BFileName}";
        }
    });

    // 게시물 추천
    $("#likePostBtn").click(function (event) {
        $.ajax({
            type: "POST",
            url: "likePost",
            data: {
                "BNum": ${view.BNum},
                "userId": '${loginId}'
            },
            dataType: "json",
            success: function (result) {
                if (result.status == "success") {
                    $("#likeCount").text(result.likes);
                } else {
                    alert(result.message);
                }
            },
            error: function () {
                alert('추천 실패!');
            }
        });
    });

    // 게시물 신고
    $("#reportPostBtn").click(function (event) {
        $.ajax({
            type: "POST",
            url: "reportPost",
            data: {
                "bNum": ${view.BNum}
            },
            dataType: "json",
            success: function (result) {
                if (result.status == "success") {
                    alert('게시물이 신고되었습니다.');
                } else {
                    alert(result.message);
                }
            },
            error: function () {
                alert('신고 성공!');
            }
        });
    });

    // ajax로 댓글 목록 가져오기
    function loadComments() {
        $.ajax({
            type: "POST",
            url: "cList",
            data: {
                "cbNum": ${view.BNum}
            },
            dataType: "json",
            success: function (list) {
                cmtList(list);
            },
            error: function () {
                alert('댓글 불러오기 실패!');
            }
        });
    }

    loadComments();

    function cmtList(list) {
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
        $('.secret-comment').click(function (event) {
            event.preventDefault();
            let commentId = $(this).data('commentid');
            $(this).parent().text($(this).data('contents'));
            secretComments[commentId] = true;
            localStorage.setItem('secretComments', JSON.stringify(secretComments));
        });

        $('.like-btn').click(function (event) {
            var commentId = $(this).data('commentid');
            $.ajax({
                type: "POST",
                url: "addLike",
                data: {
                    "commentId": commentId,
                    "userId": '${loginId}'
                },
                dataType: "json",
                success: function (result) {
                    if (result) {
                        alert('좋아요를 눌렀습니다!');
                        loadComments();
                    } else {
                        alert('이미 좋아요를 누르셨습니다.');
                    }
                },
                error: function () {
                    alert('좋아요 처리 실패!');
                }
            });
        });

        $('.cmodify').click((e) => {
            let commentId = $(e.target).val();
            let newContent = prompt('댓글을 수정하세요:', $(e.target).closest('tr').find('.comment-content').text());
            if (newContent) {
                $.ajax({
                    type: "POST",
                    url: "cModify",
                    data: {
                        "cNum": commentId,
                        "cbNum": ${view.BNum},
                        "cContents": newContent
                    },
                    dataType: "json",
                    success: function (list) {
                        cmtList(list);
                    },
                    error: function () {
                        alert('댓글 수정 실패!');
                    }
                });
            }
        });

        $('.cdelete').click((e) => {
            if (confirm('댓글을 삭제하시겠습니까?')) {
                $.ajax({
                    type: "POST",
                    url: "cDelete",
                    data: {
                        "cNum": e.target.value,
                        "cbNum": ${view.BNum}
                    },
                    dataType: "json",
                    success: function (list) {
                        cmtList(list);
                    },
                    error: function () {
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
        if (comment.csecret) {
            if (secretComments[comment.cnum]) {
                row += comment.ccontents;
            } else {
                row += "<a href='#' class='secret-comment' data-contents='" + comment.ccontents + "' data-commentid='" + comment.cnum + "'>스포방지 댓글입니다.</a>";
            }
        } else {
            row += comment.ccontents;
        }
        row += "</td>";
        row += "<td>" + comment.cdate + "</td>";
        row += "<td><button class='like-btn' data-commentid='" + comment.cnum + "'><img src='./resources/assets/img/추천.png' alt='like'> (" + comment.likes + ")</button></td>";

        if ('${loginId}' == comment.cwriter || '${loginId}' == 'admin') {
            row += "<td><button class='cmodify btn btn-sm btn-outline-secondary' value='" + comment.cnum + "'>수정</button> ";
            row += "<button class='cdelete btn btn-sm btn-outline-danger' value='" + comment.cnum + "'>삭제</button></td>";
        } else {
            row += "<td></td>";
        }
        row += "</tr>";
        return row;
    }

    $('#writeBtn').click(() => {
        if (confirm('댓글을 입력하시겠습니까?')) {
            $.ajax({
                type: "POST",
                url: "cWrite",
                data: {
                    "cbNum": ${view.BNum},
                    "cWriter": '${loginId}',
                    "cContents": $('#cContents').val(),
                    "cSecret": $('#cSecret').prop('checked') ? 1 : 0
                },
                dataType: "json",
                success: function (list) {
                    cmtList(list);
                    $('#cContents').val("");    // 댓글창 초기화
                    $('#cSecret').prop('checked', false); // 비밀댓글 체크박스 초기화
                },
                error: function () {
                    alert('댓글 작성 실패!');
                }
            });
        } else {
            alert('취소했습니다.');
        }
    });
</script>
</body>
</html>
