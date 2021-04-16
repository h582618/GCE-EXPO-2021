<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
</head>
<body>
<br>
<div class="header">

    <h1> GuttaCorp Expo</h1>

</div>
<br><br>

<div class=container">
    <p style="font-weight: bold"> Stand: </p>
    <p> ${thisStand.name}</p>
    <br>
    <h4> Give a review </h4>
    <form method="post" action="feedback">
        <input type="hidden" name="standId" value="${thisStand.id}">
        <div class="rate">
            <input type="radio" id="star5" name="rating" value="5" />
            <label for="star5" title="text">5 stars</label>
            <input type="radio" id="star4" name="rating" value="4" />
            <label for="star4" title="text">4 stars</label>
            <input type="radio" id="star3" name="rating" value="3" />
            <label for="star3" title="text">3 stars</label>
            <input type="radio" id="star2" name="rating" value="2" />
            <label for="star2" title="text">2 stars</label>
            <input type="radio" id="star1" name="rating" value="1" />
            <label for="star1" title="text">1 star</label>
        </div>
        <script src="https://kit.fontawesome.com/5ea815c1d0.js"></script>
        <br><br>
        <input type="hidden" name="email" value="${email}">
        <button type="Submit"> Send review</button>
    </form>
</div>
</body>
</html>