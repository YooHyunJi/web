<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
    <head>
        <title>햄찌대현자</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
<body>
<h2><%= "Hello Linzy!" %></h2>
<h3>Happy Lunch Time <3</h3>
<div style="position: relative; width: 100%; max-width: 600px;">
    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78xdGhNrA13qEM5FkSVlWcx6tIpOtbk36Qg&s" alt="hamzzi" style="height: 300px;">
    <div id="answerBubble" style="display: none; position: absolute; top: 10px; right: 10px; background-color: white; border: 2px solid black; border-radius: 50%; padding: 20px; width: 150px; height: 150px; box-shadow: 0 0 10px rgba(0,0,0,0.1);">
        <div id="answerText" style="width: 100%; height: 100%; display: flex; align-items: center; justify-content: center; text-align: center; overflow: auto;"></div>
    </div>
    <div id="bubbleTail" style="display: none; position: absolute; top: 100px; right: 160px; width: 20px; height: 20px; background-color: white; border-right: 2px solid black; border-bottom: 2px solid black; transform: rotate(-45deg);"></div>
</div>

<h2>햄찌에게 물어보시게</h2>

<textarea id="question" rows="4" cols="50" placeholder="햄찌에게 물어봐!"></textarea>
<br>
<button id="askButton">묻기</button>

<div id="answerText" style="margin-top: 20px;"></div>

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
