<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>MYBOOKING.COM</title>
    <link href="<c:url value='/bootstrap/css/bootstrap.css'/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value='/bootstrap/css/jumbotron-narrow.css'/>" rel="stylesheet" type="text/css"/>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script type="text/javascript" src='bootstrap/js/bootstrap.js'></script>

    <style>
        body{
            background-image: url("/bootstrap/img/first.jpg");
        }
        .minimize{
            width: 780px;
            margin-left: -50px;
            margin-top: 100px;
        }
    </style>
</head>

<body>
<div class="container">
    <c:set var="chek" value="${pageContext.request.userPrincipal.name}"/>
    <!-- logout with csrf-->
    <form action="<c:url value='/logout'/>" method="post" id="logoutForm">
        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />
    </form>

    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="navbar-header">
            <a class="navbar-brand" href="/"><b style="color:#39CCCC">MYBOOKING.COM</b></a>
        </div>
        <div id="navbar" class="navbar-collapse collapse navbar-right">
            <ul class="nav navbar-nav">
                <!-- For authorize customer-->
                <c:if test="${chek !=null}">
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li><a href="/admin/page">My account</a></li>
                    </sec:authorize>

                    <sec:authorize access="hasRole('ROLE_USER') ">
                        <li><a href="/user/page">My account</a></li>
                    </sec:authorize>

                    <li role="presentation"><a href="javascript: logout()">Logout</a></li>

                </c:if>

                <!-- For not authorize customer-->
                <c:if test="${chek ==null}">
                    <li role="presentation"><a href="/registration">Registration</a></li>
                    <li role="presentation"><a href="/login">Login</a></li>
                </c:if>

            </ul>
        </div><!--/.nav-collapse -->
    </nav>

    <div class="jumbotron minimize ">
        <h1>MYBOOKING.COM</h1>
        <p class="lead">Site being assigned to book hotel in many countries and many town,
            you have are possibility to search hotel in every you want </p>
        <p><a class="btn btn-lg btn-success" href="#" role="button">Search</a></p>
    </div>
    <div class="container minimize">
    </div>

    <!--script that submit logout with csrf-->
    <script>
        function logout(){
            document.getElementById("logoutForm").submit();
        }
    </script>
</body>
</html>
