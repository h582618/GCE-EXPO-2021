<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>GuttaCorp Expo</title>
    <link href="css/GCE.css" rel="stylesheet" type="text/css">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="1017792445316-fpub8iae9kbdr6c9kvn9p729taasdrv6.apps.googleusercontent.com">
</head>
<body>
<div class="g-signin2" data-onsuccess="onSignIn" id="myP"></div>
<img id="myImg"><br>
<p id="name"></p>
<div id="status">
</div>

<form action="Admin" method="post">
    <input type="hidden" id="email" name="email" value=email />
    <div id="submit">
    </div>
</form>

<script type="text/javascript">
    function onSignIn(googleUser) {
        //window.location.href='success.jsp';
        var profile = googleUser.getBasicProfile();
        var imagurl=profile.getImageUrl();
        var name=profile.getName();
        var email= profile.getEmail();
        console.log(email);
        document.getElementById("myImg").src = imagurl;
        document.getElementById("name").innerHTML = name;
        document.getElementById("myP").style.visibility = "hidden";
        document.getElementById("email").value = email;
        if(email == "matiasvedeler@gmail.com"){
        document.getElementById("submit").innerHTML = '<button type="submit"> Admin </button>';
        } else {
            document.getElementById("submit").innerHTML = '<p> You are now logged in, scan QR codes to vote</p>'
        }

    }
</script>
<button onclick="myFunction()">Sign Out</button>
<script>
    function myFunction() {
        document.getElementById('submit').innerHTML = '<% session.removeAttribute("email");%>';
        gapi.auth2.getAuthInstance().disconnect();
        location.reload();
    }
</script>
</body>
</html>