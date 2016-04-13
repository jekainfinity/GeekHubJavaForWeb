<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>information Admin</title>
    <link href="<c:url value='/bootstrap/css/bootstrap.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/searchResult.css'/>" rel="stylesheet" />
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/bootstrap.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/jquery.js"></script>

</head>
<body>
<div class="container">
    <div class="col-lg-10 col-lg-offset-1">
        <!--navbar-->
        <jsp:include page="navbar.jsp"/>
        <div class="header_page"> CREATE HOTEL</div>

        <div class="main_page_style">
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <br/>
                    <form class="form-horizontal" role="form" action="/admin/addRoom/${hotelId}" method="post">
                        <div class="form-group">
                            <label class="control-label col-lg-3 col-lg-offset-2" for="roomNumber" style="text-align:left">Number of room:</label>
                            <div class="col-lg-6">
                                <input type="number" class="form-control" id="roomNumber" placeholder="Number of room" name="roomNumber">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-lg-offset-2" for="roomType" style="text-align:left">Type of Room:</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="roomType" placeholder="Enter Type of Room" name="roomType" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3 col-lg-offset-2" for="roomPrice" style="text-align:left">Room price:</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="roomPrice" placeholder="Enter room price" name="roomPrice">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6 col-lg-offset-6">
                                <input type="submit" value="Add room" class="btn btn-lg btn-success"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
    
   