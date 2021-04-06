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
    <link href="css/GCE.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="header">
    <h1> GuttaCorp Expo</h1>
</div>
<H2> Admin Page</H2>
<a href="/expo2021_prosjekt3/standsServlet" class="button"> Stands </a>

<H4> Add stand </H4>
<div class="addStands">
    <form action = "UploadServlet" method = "post">
        <input type = "text" name = "standName" size = "20" />
        <input type = "submit" value = "Add stand" />
    </form>
</div>

<h4> Add stands</h4>
Upload xlsx file <br>
<br>
<div class="addStands">
    <form action = "UploadServlet" method = "post"
          enctype = "multipart/form-data" accept-charset="UTF-8">
        <input type = "file" name = "file" style="width:150px"/>
        <input type = "submit" value = "Upload File" />
    </form>
</div>


${responseMsg}


</body>
</html>
