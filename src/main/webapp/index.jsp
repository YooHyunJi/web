<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><!DOCTYPE html>
<html>
    <head>
        <title>햄찌대현자</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
<body>
<h2><%= "Hello Linzy!" %></h2>
<h3>Happy Lunch Time <3</h3>
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR78xdGhNrA13qEM5FkSVlWcx6tIpOtbk36Qg&s" alt="hamzzi" style="height: 300px;">

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
                url: "http://localhost:9090/ai?message=" + encodedMessage,
                type: "GET",
                success: function(response) {
                    $("#answerText").text(response.completion);
                },
                error: function(xhr, status, error) {
                    $("#answerText").text("어라 오류가: " + error);
                }
            });
        });
    });
</script>
</body>
</html>
