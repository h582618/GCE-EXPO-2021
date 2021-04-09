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
    <link href="css/GCE.css" rel="stylesheet" type="text/css">
    <title>GuttaCorp exp</title>
</head>
<body>
<div class="header">
    <h1> GuttaCorp Expo</h1>
</div>
<p> You are now logged in, scan QR codes to vote</p>
<button onclick="myFunction()">Sign Out</button>
<script>
    function myFunction() {
        document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://data1.hib.no:9090/expo2021_prosjekt3/";

    }
</script>
</body>
</html>
