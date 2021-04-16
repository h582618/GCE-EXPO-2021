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
    <title>Stands</title>
</head>
<body>
<br>
<div class="header">

    <h1> GuttaCorp Expo</h1>

</div>
<br><br>
<a href="/expo2021_prosjekt3/Admin" class="button"> Admin page </a>
<br><br>
<div class="container">
    <br><br>
    <div class="tablediv">
        <table>
            <form action="standsServlet" method="post">
                <td>
                    <input type="hidden" name="DELETEALL" value="DELETEALL"/>
                </td>
                <td><input style="float: right; margin: auto;" type="submit" value="Delete all"/></td>

            </form>
            <c:forEach items="${stands}" var="x">
                <form action="QrGenerator" method="get">
                    <input type="hidden" name="qrtext"
                           value="http://data1.hib.no:9090/expo2021_prosjekt3/feedback?id=${x.id}"/>
                    <tr>
                        <td>  ${x.id} ${x.name}</td>
                        <td><input type="submit" name="generateQR" value="Generate QR Code"/></td>
                </form>
                <form action="standsServlet" method="post">
                    <input type="hidden" name="id" value="${x.id}"/>
                    <td><input type="submit" value="Delete"/></td>


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
