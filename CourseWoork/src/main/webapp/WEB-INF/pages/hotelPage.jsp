<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>information Admin</title>
    <link href="<c:url value='/bootstrap/css/bootstrap.css'/> " rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.css'/> "rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/searchResult.css'/> " rel="stylesheet" />
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/bootstrap.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/jquery.js"></script>
    <style>
        .navbar-outer{
            width: 900px;
            border: 2px;
            border-color: #dddddd;
            background-color: #eee;
            text-align: center;
        }
        .marginn{
            margin-bottom: 10px;
            border-right: 4px;
            border-color: #dddddd;
        }
        .search-adding-window{
            border-width: medium;
            border-left: double;
            border-right: double;
            border-bottom: double;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
            border-color: #3c3c3c;
            height: 90px;
            width: auto;
            padding: 10px;
        }
        .search-window-header{
            border-width: medium;
            border-left: double;
            border-right: double;
            border-top: double;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
            border-color: #3c3c3c;
            background-color: #3c3c3c;
            color: #C0C0C0;   
            text-align: center;
        }
    </style>
</head>
   <body>
        <div class="container">
            <div class="col-lg-10 col-lg-offset-1">
                <!--navbar-->
                <jsp:include page="navbar.jsp"></jsp:include>

                <div class="header_page"> Hotel name : ${hotelname}</div>

                <div class="main_page_style">
                    <div class="row">
                        <div class="col-lg-10 col-lg-offset-1" style="margin-left:118px">
                            <div class="col-lg-11 portfolio-item">
                                <a href="#">
                                    <img class="img-responsive" src="http://placehold.it/750x450" alt="">
                                </a>
                            </div>
                        </div>    
                    </div>

                    <div class="col-lg-offset-1" style="margin-left:125px"/>
                        <div class="row" style="margin-top: 15px">
                            <c:forEach var="item" items="${photoList}">
                                <div class="col-lg-3 ">
                                    <div class="portfolio-item">
                                        <div class="portfolio-item">
                                            <a href="/image/${item.getHotelPhotoId()}/${hotelId}">
                                                <img class="img-responsive" src="<c:out value='/image/${item.getHotelPhotoId()}/${hotelId}'/>" alt="">
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 25px">
                        <div class="col-lg-9 col-lg-offset-1" style="margin-left:125px">
                            <div class="search-window-header">
                                Hotel Describe
                            </div>
                            <div class="search-adding-window">
                                ${hotelDescribe}
                            </div>
                        </div>
                     </div>
                    <div class="row" style="margin-top: 25px">
                        <div class="col-lg-9 col-lg-offset-1" style="margin-left:125px">
                            <div class="search-window-header">
                                Information about resource
                            </div>
                            <div class="search-adding-window">
                                <p><i> Hotel Administrtor :  ${admin}</i> </p>
                                <p><i> Address : ${address} </i></p>
                            </div>
                    </div>
                    <div class="row" style="margin-top: 25px">
                        <!-- Only fo ROLE_USER and ROLE_admin-->
                        <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_USER')">
                        <sec:authentication property="principal.username" var="username"></sec:authentication>
                        <div class="col-lg-1 col-lg-offset-7">
                        </div>
                        <div class="col-lg-2" style="margin-left:60px">
                            <a href="/roomsList/${hotelId}" class="btn btn-primary" role="button" style="margin-top:20px">
                                Rooms list
                            </a>
                            <!--admin hotel function-->
                            <c:if test="${username != admin}">
                                <a href="/verifyDates/${hotelId}" class="btn btn-primary" role="button" style="margin-top:20px">
                                    Book Hotel
                                </a>
                            </c:if>
                            <c:if test="${username == admin}">
                                <a href="/admin/addRoom/${hotelId}" class="btn btn-primary" role="button" style="margin-top:20px">
                                    addRoom
                                </a>
                            </c:if>

                        </div>
                        </sec:authorize>

                        <!--For non-authorize user-->
                        <sec:authorize access="!hasRole('ROLE_ADMIN') and !hasRole('ROLE_USER')">
                            <div class="col-lg-1 col-lg-offset-7">
                            </div>
                            <div class="col-lg-2" style="margin-left:60px">
                                <label class="control-label" for="reg"  style="margin-top:10px">Booking only register(log in) user:</label>
                                <a href="/registration" class="btn btn-primary" id="reg" role="button">
                                    registration
                                </a>
                            </div>
                        </sec:authorize>
                   </div>
                </div>
            </div>
          </div>
       </div>
    </body>
</html>
