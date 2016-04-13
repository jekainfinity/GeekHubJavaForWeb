<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">


    <title>Spring Security</title>

    <link href="<c:url value='/bootstrap/css/login.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/bootstrap.css'/>" rel="stylesheet" />
    <script src="<c:url value='/bootstrap/js/login.js'/>" ></script>

    <style>
        body{
            background-color: #525252;
        }
        .centered-form{
            margin-top: 60px;
        }

        .centered-form .panel{
            background: rgba(255, 255, 255, 0.8);
            box-shadow: rgba(0, 0, 0, 0.3) 20px 20px 20px;
        }
        .form-signin{
            width: 300px;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title">Sign in</h1>
            <form name='loginForm' action="<c:url value='/login' />" method='POST'>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="account-wall">

                    <form class="form-signin">
                        <input type="text" class="my-form-control" placeholder="Username" name="j_username" required autofocus>
                        <input type="password" class="my-form-control" placeholder="Password" name="j_password" required>
                        <button class="btn btn-lg btn-block btn-info " type="submit" style="margin-top:20px">
                            Sign in</button>
                    </form>
                </div>
                <a href="/registration" class="text-center new-account pull-top" >Create an account </a>
            </form>
        </div>
    </div>
</div>
</body>
</html>

