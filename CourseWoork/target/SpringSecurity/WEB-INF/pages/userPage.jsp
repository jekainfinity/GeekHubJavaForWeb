<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>adminPage</title>

    <link href="<c:url value='/bootstrap/css/bootstrap.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/page-style.css'/>" rel="stylesheet" />
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/bootstrap.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/jquery.js"></script>

</head>
<body>
<sec:authorize access="hasRole('ROLE_USER')">
<div class="container ">
    <div class="col-lg-10 col-lg-offset-1">
        <!--navbar-->
        <jsp:include page="navbar.jsp"/>
        <!--page-->
        <div class="header_page"></div>
        <div class="mainColor">
            <div class="row">
                <div class="padding-row">
                    <div class="col-lg-4 col-lg-offset-2">
                        <div class="col-lg-10 col-lg-offset-1">
                            <div class="navbar-outer">
                                <img src="/bootstrap/img/user.png" class="img-rounded"/>
                            </div>
                            <br/>
                            <a href="/searchHotels" class="btn btn-primary btn-lg" role="button" style="margin-top:10px">
                                SEARCH HOTEL
                            </a>
                            <a href="/bookingList" class="btn btn-primary btn-lg" role="button" style="margin-top:10px">
                                BOOKING HOTEL
                            </a>
                        </div>

                    </div>
                    <div class="col-lg-4 text_border_blue">
                        <h4 class="letter"><b>Username</b>: <sec:authentication property="principal.username"></sec:authentication> <!--TODO:PRINCIPAL--> </h4>
                    </div>
                    <div class="col-lg-4 text_border">
                        <h4><b>Real name:</b> ${realName}</h4>
                        <h4><b>Phone number:</b> ${phoneNumber}</h4>
                        <h4><b>E-mail:</b> ${e_mail}</h4>
                    </div>
                    <div class="col-lg-4 information-blue">
                        <h4 class="letter"><b>Describe: </b></h4>
                    </div>
                    <div class="col-lg-4 information">
                        <c:if test="${describe == null}">
                            <br/>
                            <br/>
                            <div class="col-lg-4 col-lg-offset-3">
                                <a href="/user/editProfile" class="btn btn-primary" role="button" style="margin-top:10px">
                                    Add information
                                </a>
                            </div>
                        </c:if>
                        <c:if test="${describe != null}">
                            <p>${describe}</p>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-smal-page">By Jekainfinity ----------------<i>"Home Anywhere"</i></div>
    </div>
</div>
</sec:authorize>
</body>
</html>