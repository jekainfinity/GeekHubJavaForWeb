<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <link href="<c:url value='/bootstrap/css/login.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/bootstrap.css'/>" rel="stylesheet" />
    <script src="<c:url value='/bootstrap/js/login.js'/>" ></script>
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.css'/>" rel="stylesheet" />
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
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title" style="color:white">Registration</h1>
            <div class="account-wall">
                <form class="form-signin" action='/registration' method="POST">
                    <div class="form-group">
                        <input type="text" name="username" id="username" class="form-control input-sm" placeholder="Enter Username">
                    </div>
                    <div class="form-group">
                        <input type="text" name="name" id="name" class="form-control input-sm" placeholder="Enter Name">
                    </div>
                    <div class="form-group">
                        <input type="text" name="phoneNumber" id="phoneNumber" class="form-control input-sm" placeholder="Enter phoneNumber">
                    </div>
                    <div class="form-group">
                        <input type="text" name="sureName" id="sureName" class="form-control input-sm" placeholder="Enter SureName">
                    </div>
                    <div class="form-group">
                        <input type="text" name="patronymic" id="patronymic" class="form-control input-sm" placeholder="Enter Patronymic">
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" id="email" class="form-control input-sm" placeholder="Email Address">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password">
                    </div>
                    <label for="admin" style="margin-right:5px">admin</label><input type="checkbox" id="admin" name="admin" />
                    <button class="btn btn-info btn-block" type="submit">Create</button>
                </form>
            </div>
            <a href="/registration" class="text-center new-account">Log In</a>
        </div>
    </div>
</div>
</body>
</html>
