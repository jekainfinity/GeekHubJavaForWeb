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

    <style>
        body{
            background-image: url("/bootstrap/img/first.jpg");
        }
    </style>

</head>
<body>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<div class="container ">
    <div class="row">
        <!--navbar-->
        <jsp:include page="navbar.jsp"/>
    <!--page-->
    <div class="row" style="margin-top:10px">

        <div class="col-lg-3 ">
            <div class="text_border_blue" style="margin-top: 50px;background-color:#2D6CA2;text-align:center;border-color:#2D6CA2">
                <h4 class="letter"><b>Username</b>: Jekainfinity <!--TODO:PRINCIPAL--> </h4>
            </div>
            <div class="col-lg-12 adminColor">
                <div style="margin-bottom:20px"><img src="/bootstrap/img/admin.png" class="img-circle"/></div>

                <a href="/admin/addHotel" class="btn btn-primary btn-lg" role="button">
                    ADD HOTEL
                </a>
                <a href="/admin/listOfHotel/0"  class="btn btn-primary btn-lg" role="button" style="margin-top:10px">
                    VIEW HOTEL
                </a>
                <a href="/admin/searchHotels" class="btn btn-primary btn-lg" role="button" style="margin-top:10px">
                    SEARCH HOTEL
                </a>
                <a href="/bookingList" class="btn btn-primary btn-lg" role="button" style="margin-top:10px">
                    BOOKING HOTEL
                </a>
            </div>
        </div>

        <div class="text_border_blue" style="background-color:#2D6CA2;text-align:center;border-color:#2D6CA2;margin:50px 15px 0px       15px;height:42px"></div>

        <div class="col-lg-9 mainColor" >
            <div class="col-lg-9 col-lg-offset-1 text_border_blue" style="margin-left:100px">
                <h4 class="letter"><b>Username</b>:  <sec:authentication property="principal.username"></sec:authentication>  </h4>
            </div>
            <div class="col-lg-9 col-lg-offset-1 text_border" style="margin-left:100px">
                <h4><b>Real name:</b> ${realName}</h4>
                <h4><b>Phone number:</b> ${phoneNumber}</h4>
                <h4><b>E-mail:</b> ${e_mail}</h4>
            </div>
            <div class="col-lg-9 col-lg-offset-1 information-blue" style="margin-left:100px" >
                <h4 class="letter"><b>Describe:</b>
                    <c:if test="${describe == null}">
                        <div class="col-lg-4">
                            <a href="/admin/editProfile" class="btn btn-primary btn-sm" role="button" style="margin-left:400px">
                                Add information
                            </a>
                        </div>
                    </c:if>
                </h4>
            </div>
            <div class="col-lg-9 col-lg-offset-1 information" style="margin-left:100px">
                <c:if test="${describe != null}">
                    <p>${describe}</p>
                </c:if>
            </div>
        </div>
    </div>
   </div>
</div>
</sec:authorize>
</body>
</html>
<%--



</head>
<body>
<sec:authorize access="hasRole('ROLE_ADMIN')">
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
                                            <img src="/bootstrap/img/admin.png" class="img-rounded"/>
                                    </div>
                                    <br/>
                                    
                                        <a href="/admin/addHotel" class="btn btn-primary btn-lg" role="button" style="width: 216px">
                                            ADD HOTEL
                                        </a>
    &lt;%&ndash; href="/admin/listOfHotel/0"&ndash;%&gt;<button  class="btn btn-primary btn-lg" id="viewHotelButton" role="button" style="margin-top:10px">
                                            VIEW HOTEL
                                        </button>
                                        <a href="/searchHotels" class="btn btn-primary btn-lg" role="button" style="margin-top:10px">
                                            SEARCH HOTEL
                                        </a>
                                        <a href="/bookingList" class="btn btn-primary btn-lg" role="button" style="margin-top:10px">
                                            BOOKING HOTEL
                                        </a>

                                    </div>
                                <div id="changeArea"></div>
                                 
                            </div>
                                <div class="col-lg-4 text_border_blue" >
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
                                            <a href="/admin/editProfile" class="btn btn-primary" role="button" style="margin-top:10px">
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
</html>--%>
