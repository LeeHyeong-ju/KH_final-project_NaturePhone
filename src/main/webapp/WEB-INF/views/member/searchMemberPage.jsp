<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 자바스크립트-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- 부트스트랩 5.0 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
        crossorigin="anonymous"></script>
    <!-- Font Awesome5 -->
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
    <title>아이디/비밀번호 찾기</title>

<style>
   .main-div {
        background: #ffffff none repeat scroll 0 0;
        border-radius: 2px;
        
        max-width: 850px;
        padding: 50px 0px 50px 0px;
    }

    .tabs {
        margin: 0 auto;
        padding: 0 20px;
    }

    #tab-button {
        display: table;
        table-layout: fixed;
        width: 100%;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    #tab-button li {
        display: table-cell;
        width: 20%;
    }

    #tab-button li a {
        display: block;
        padding: .5em;
        background: #eee;
        border: 1px solid #ddd;
        text-align: center;
        color: #000;
        text-decoration: none;
    }

    #tab-button li:not(:first-child) a {
        border-left: none;
    }

    #tab-button li a:hover,
    #tab-button .is-active a {
        border-bottom-color: transparent;
        background: #fff;
    }

    .tab-contents {
        padding: .5em 2em 1em;
        border: 1px solid #ddd;
    }

    .tab-button-outer {
        display: none;
    }

    .tab-contents {
        margin-top: 20px;
    }

    .fontSize {
        font-size: 13px;
    }
    .searchRadio{
        margin-right:10%;
        margin-left:10%;
    }

    @media screen and (min-width: 768px) {
        .tab-button-outer {
            position: relative;
            z-index: 2;
            display: block;
        }

        .tab-select-outer {
            display: none;
        }

        .tab-contents {
            position: relative;
            top: -1px;
            margin-top: 0;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="row">
            <!-- 내용 -->
            <div class="col-md-12 content">
                <div class="main-div">
                    <div class="tabs">
                        <div class="tab-button-outer">
                            <ul id="tab-button">
                                <li><a href="#tab01">아이디 찾기</a></li>
                                <li><a href="#tab02">비밀번호 찾기</a></li>
                            </ul>
                        </div>
                        <div class="tab-select-outer">
                            <select id="tab-select">
                                <option value="#tab01">아이디 찾기</option>
                                <option value="#tab02">비밀번호 찾기</option>
                            </select>
                        </div>

                        <div id="tab01" class="tab-contents">
                            <p class="fontSize">
                                <br>
                                회원 가입 시 기입하신 이메일 주소를 입력하신 후 '확인'버튼을 누르시면 이메일로 아이디를 발송해드립니다.
                            </p>
                            <div class="input-group input-group-sm mb-3">
                                <input type="email" class="form-control"
                                    placeholder="회원가입 시 기입하신 이메일 주소를 정확하게 입력해 주세요.">&nbsp;
                                <button class="btn btn-primary btn-sm">확인</button>
                            </div>
                        </div>
                        
                        <div id="tab02" class="tab-contents">
                            <p class="fontSize">
                                <br>
                                회원 가입 시 가입하신 이메일 주소를 입력하신 후 '확인'버튼을 누르시면 이메일로 비밀번호를 발송해드립니다.
                            </p>
                            <div class="input-group input-group-sm mb-3">
                                <input type="email" class="form-control"
                                    placeholder="회원가입 시 기입하신 이메일 주소를 정확하게 입력해 주세요.">&nbsp;
                                <button class="btn btn-primary btn-sm">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <script>
            $(function () {
                var $tabButtonItem = $('#tab-button li'),
                    $tabSelect = $('#tab-select'),
                    $tabContents = $('.tab-contents'),
                    activeClass = 'is-active';

                $tabButtonItem.first().addClass(activeClass);
                $tabContents.not(':first').hide();

                $tabButtonItem.find('a').on('click', function (e) {
                    var target = $(this).attr('href');

                    $tabButtonItem.removeClass(activeClass);
                    $(this).parent().addClass(activeClass);
                    $tabSelect.val(target);
                    $tabContents.hide();
                    $(target).show();
                    e.preventDefault();
                });

                $tabSelect.on('change', function () {
                    var target = $(this).val(),
                        targetSelectNum = $(this).prop('selectedIndex');

                    $tabButtonItem.removeClass(activeClass);
                    $tabButtonItem.eq(targetSelectNum).addClass(activeClass);
                    $tabContents.hide();
                    $(target).show();
                });
            });
        </script>
</body>
</html>