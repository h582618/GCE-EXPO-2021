<%--
  Created by IntelliJ IDEA.
  User: matia
  Date: 23/03/2021
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stands</title>
</head>
<body>
<br>
<div class="header">

    <h1> GuttaCorp Expo</h1>

</div>
<br><br>
<a href="/expo2021_prosjekt3/Admin" class="link"> Admin page </a>
<br><br>
<div class="container1">
    <form action="standsServlet" method="post">
        <input type="hidden" name="DELETEALL" value="DELETEALL"/>
        <button type="submit">Delete all</button>
    </form>
    <br><br>
    <div class="tablediv">
        <table>
            <c:forEach items="${stands}" var="x">
                <form action="QrGenerator" method="get">
                    <input type="hidden" name="qrtext"
                           value="http://data1.hib.no:9090/expo2021_prosjekt3/feedback?id=${x.id}"/>
                    <tr>
                        <td> ${x.id}</td>
                        <td> ${x.name}</td>
                        <td>
                            <button type="submit" name="generateQR">Generate QR Code</button>
                        </td>
                </form>
                <form action="standsServlet" method="post">
                    <input type="hidden" name="id" value="${x.id}"/>
                    <td>
                        <button type="submit" class="button">Delete</button>
                    </td>


                </form>

                </tr>
                <tr>

                </tr>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
