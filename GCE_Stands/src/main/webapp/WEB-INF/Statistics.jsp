<%--
  Created by IntelliJ IDEA.
  User: matia
  Date: 09/04/2021
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Statistics</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<br>
<div class="header">
    <h1> GuttaCorp Expo</h1>
</div>
<br><br>
<a href="/expo2021_prosjekt3/Admin" class="link"> Admin page </a>
<br><br>
<div class="container">
    <h3> Top average </h3>
    <br>
    <div class="tablediv">
        <table>
            <tr>
                <th>Id</th>
                <th>name</th>
                <th>average vote</th>
            </tr>
            <c:forEach items="${topAverage}" var="x" begin = "0" end = "9">
                <tr>
                    <td> ${x.id}</td>
                    <td>${x.name}</td>
                    <td>${x.averageVote}</td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <br><br>
    <h3> Top Number of votes</h3>
    <br>
    <div class="tablediv">
        <table>
            <tr>

                <th>Id</th>
                <th>name</th>
                <th>number of votes</th>
            </tr>
            <c:forEach items="${topNumberOfVotes}" var="x" begin = "0" end = "9">
                <tr>
                    <td> ${x.id}</td>
                    <td>${x.name}</td>
                    <td>${x.numberOfVotes}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>

</html>
