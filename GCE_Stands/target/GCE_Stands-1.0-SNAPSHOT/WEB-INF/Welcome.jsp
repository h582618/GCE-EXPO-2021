<%--
  Created by IntelliJ IDEA.
  User: matia
  Date: 09/04/2021
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    <title>GuttaCorp exp</title>
</head>
<body>
<br>
<div class="header">
    <h1> GuttaCorp Expo</h1>
</div>
<br><br>
<div class="container">
    <p> You are now logged in, scan QR codes to vote</p>
    <br>
    <button onclick="myFunction()">Sign Out</button>
    <script>
        function myFunction() {
            document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://data1.hib.no:9090/expo2021_prosjekt3/";

        }
    </script>
</div>
</body>
</html>
