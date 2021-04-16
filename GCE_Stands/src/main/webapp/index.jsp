<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>GuttaCorp Expo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/stylesheet.css">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="1017792445316-fpub8iae9kbdr6c9kvn9p729taasdrv6.apps.googleusercontent.com">
</head>
<body>
<br>
<div class="header">
    <h1> GuttaCorp Expo</h1>
</div>
<br>
<div style="margin: auto;
    width: 120px;" class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
<img id="myImg"><br>
<p id="name"></p>
<div id="status">
</div>
<% session.removeAttribute("email");%>
<input type="hidden" id="passedId" value="${param.id}" />
<form action="Admin" method="post">
    <input type="hidden" id="email" name="email" value="" />
    <div id="submit">
    </div>
</form>

<script type="text/javascript">
    "use strict";
    function onSignIn(googleUser) {
        //window.location.href='success.jsp';
        var profile = googleUser.getBasicProfile();
        var imagurl=profile.getImageUrl();
        var name=profile.getName();
        var email= profile.getEmail();


        document.getElementById("myImg").src = imagurl;
        document.getElementById("name").innerHTML = name;
        document.getElementById("myP").style.visibility = "hidden";
        document.getElementById("email").value = email;

        console.log(email);

        if(email != ""){
        const form = document.createElement('form');
        form.method = 'post';
        form.action = 'Home';

        const hiddenField = document.createElement('input');
        hiddenField.type = 'hidden';
        hiddenField.name = "email";
        hiddenField.value = email;

        const hiddenField2 = document.createElement('input');
        hiddenField2.type = 'hidden';
        hiddenField2.name = "id";
        let passedId =  document.getElementById("passedId").value;
        hiddenField2.value = passedId;

        form.appendChild(hiddenField);
        form.appendChild(hiddenField2);

        document.body.appendChild(form);

        form.submit();
        }
        /*
        if(email == "matiasvedeler@gmail.com"){
            document.getElementById("submit").innerHTML = '<button type="submit"> Admin </button>';
        } else {
            document.getElementById("submit").innerHTML = '<p> You are now logged in, scan QR codes to vote</p>'
            document.getElementById("submit").innerHTML = '<button type="submit"> Click here to start voting </button>';
        }
         */

    }
</script>
</body>
</html>