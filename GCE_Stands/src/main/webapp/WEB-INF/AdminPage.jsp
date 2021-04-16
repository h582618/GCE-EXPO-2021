<%--
  Created by IntelliJ IDEA.
  User: matia
  Date: 23/03/2021
  Time: 09:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="1017792445316-fpub8iae9kbdr6c9kvn9p729taasdrv6.apps.googleusercontent.com">
</head>
<body>
<br>
<div class="header">
    <h1> GuttaCorp Expo</h1>
</div>
<br><br>
<a href="/expo2021_prosjekt3/standsServlet" class="button"> Stands </a>
<br><br>
<a href="/expo2021_prosjekt3/statistics" class="button"> Statistics </a>

<div class="container">
    <H2> Admin Page</H2>
    <br><br>
    <H4> Add stand </H4>
    <form action = "UploadServlet" method = "post">
        <input type = "text" name = "standName" size = "20" />
        <input type = "submit" value = "Add stand" />
    </form>
    <br>
    <h4> Add stands</h4>
    Upload xlsx file
    <div class="addStands">
        <form action = "UploadServlet" method = "post"
              enctype = "multipart/form-data" accept-charset="UTF-8">
            <input type = "file" name = "file" style="width:150px"/>
            <input type = "submit" value = "Upload File" />
        </form>
    </div>

    ${responseMsg}
</div>


<br>

<div id="clear">
</div>
<div hidden style="margin: auto;
    width: 120px;"; class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
<button onclick="myFunction()">Sign Out</button>
<script>
    function myFunction() {
        document.location.href = "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://data1.hib.no:9090/expo2021_prosjekt3/";

    }
</script>

</body>
</html>
