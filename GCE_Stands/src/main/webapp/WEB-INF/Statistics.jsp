<%--
  Created by IntelliJ IDEA.
  User: matia
  Date: 09/04/2021
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Statistics</title>
    <link href="css/GCE.css" rel="stylesheet" type="text/css">
</head>
<body>
<a href="/expo2021_prosjekt3/Admin" class="button"> Admin page </a>
<div class="header">
    <h1> GuttaCorp Expo</h1>
</div>
<h3> Top average </h3>
<c:forEach items="${topAverage}" var="x">


             ${x.name} ${x.averageVote}
    <br>
</c:forEach>


<h3> Top Number of votes</h3>
<c:forEach items="${topNumberOfVotes}" var="x">


    ${x.name} ${x.averageVote}
    <br>
</c:forEach>

</body>

</html>
