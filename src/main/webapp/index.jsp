<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
    <head>
        <title>햄찌대현자</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
<body>


<h2>햄찌에게 물어보시게</h2>
<div class="hamzzi-container">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78xdGhNrA13qEM5FkSVlWcx6tIpOtbk36Qg&s" alt="hamzzi" style="height: 300px;">
    <div id="answerBubble" style="display: none; position: absolute; top: 10px; right: 10px; background-color: white; border: 2px solid black; border-radius: 50%; padding: 20px; width: 150px; height: 150px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
        <div id="answerText"></div>
    </div>
    <div id="bubbleTail" style="display: none; position: absolute; top: 100px; right: 160px; width: 20px; height: 20px; background-color: white; border-right: 2px solid black; border-bottom: 2px solid black; transform: rotate(-45deg);"></div>
</div>

<div class="question-container">
    <h2>햄찌에게 물어보세요</h2>
    <textarea id="question" placeholder="햄찌에게 물어봐! 크앙~"></textarea>
    <button id="askButton">묻기</button>
</div>


<style>
    body{
        display: flex;
        flex-direction: column;
        justify-items: center;
        text-align: center;
    }

    .hamzzi-container{
        display: flex;
        justify-content: center;
    }

    .question-container {
        width: 400px;  /* 고정 너비 설정 */
        margin: 20px auto;
        padding: 20px;
        background-color: #f0f0f0;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    
    .question-container h2 {
        color: #333;
        font-size: 24px;
        margin-bottom: 15px;
        text-align: center;
    }
    
    #question {
        width: 100%;
        height: 100px;  /* 고정 높이 설정 */
        padding: 10px;
        border: 2px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        resize: none;  /* 크기 조절 비활성화 */
        box-sizing: border-box;  /* 패딩을 포함한 전체 크기 설정 */
    }
    
    #askButton {
        display: block;
        width: 100%;
        padding: 10px;
        margin-top: 10px;
        background-color: #ec8e66;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 18px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    
    #askButton:hover {
        background-color: #c9734e;
    }
</style>

<script>
    $(document).ready(function() {
        $("#askButton").click(function() {
            var message = $("#question").val();
            var encodedMessage = encodeURIComponent(message);
            $.ajax({
                url: "https://api.w5.justdev.net/ai?message=" + encodedMessage,
                type: "GET",
                success: function(response) {
                    $("#answerText").text(response.completion);
                    $("#answerBubble").show();
                },
                error: function(xhr, status, error) {
                    $("#answerText").text("어라 오류가: " + error);
                    $("#answerBubble").show();
                }
            });
        });
    });
</script>
</body>
</html>
