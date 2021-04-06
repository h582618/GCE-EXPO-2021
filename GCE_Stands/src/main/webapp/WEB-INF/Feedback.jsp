<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="css/GCE.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="header">

    <h1> GuttaCorp Expo</h1>

</div>
<br>
<p style="font-weight: bold"> Stand: </p> <p> ${thisStand.name}</p>

<h4> Give a review </h4>
<form method="post" action="feedback">
    <input type="hidden" name="standId" value="${thisStand.id}">
    <c:forEach var = "i" begin = "1" end = "5">
        <img src="bilder/rating${i-6}.png" style="width:137px; height:32px;"/>
        <input type="radio" value="${i-6}" name="rating">
        <br>
        <br>
    </c:forEach>
    <input type="hidden" name="email" value="${email}">
    <button type="Submit"> Send review </button>
</form>

</body>
</html>