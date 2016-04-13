<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>information Admin</title>
    <link href="<c:url value='/bootstrap/css/bootstrap.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/searchResult.css'/>" rel="stylesheet" />

    <style>
        .search-window{
            border-width: thin;
            border-left: solid;
            border-right: solid;
            border-bottom: solid;
            border-color: #2D6CA2;
            background-color: #BEBEBE;
            height: 120px;
            width: auto;
            padding: 10px;
            margin-bottom: 20px;
        }
        .search-adding-window{
            border-width:thin;
            border-left: solid;
            border-right: solid;
            border-bottom: solid;
            border-color: #2D6CA2;
            background-color: #BEBEBE;
            height: 270px;
            width: auto;
            padding: 10px;
        }
        .search-window-header{
            border-width: thin;
            border-left: solid;
            border-right: solid;
            border-top: solid;
            border-color: #2D6CA2;
            background-color: #2D6CA2;
            color: #C0C0C0;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <!--navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>
    </div>

    <div class="header_page" style="width:850px;margin-left:150px;margin-top:50px"> Search Page</div>
    <div class="main_page_style" style="width:850px;margin-left:150px">
        <div class="row">
            <div class="col-lg-9 col-lg-offset-1" style="margin-left:120px">
                <div class="search-window-header">Find hotel by hotelname</div>
                <div class="search-window">
                    <form class="form-horizontal" role="form" action="/searchHotels/0" method="post">
                        <div class="form-group">
                            <label class="control-label col-lg-3" for="name" style="text-align:left">Name of hotel:</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="name" placeholder="Name of hotel" name="hotelName"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-4 col-lg-offset-7">
                                <input type="submit" value="Search" class="btn btn-lg btn-success"/>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="search-window-header">Find hotel by criteria</div>
                <div class="search-adding-window">
                    <form class="form-horizontal" role="form" action="/searchHotels/0" method="post">
                        <div class="form-group">
                            <label class="control-label col-lg-3" for="country" style="text-align:left">Country:</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="country" placeholder="Enter country" name="countryHotel" >
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3" for="town" style="text-align:left">Town:</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="town" placeholder="Enter town" name="townHotel">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="control-label col-lg-3" for="starts" style="text-align:left">Starts:</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="starts" placeholder="Enter quantity starts" name="hotelStrats">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-3" for="room" style="text-align:left">Room in hotel:</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" id="room" placeholder="Enter quantity of room" name="roomHotel">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-4 col-lg-offset-7">
                                <input type="submit" value="Search" class="btn btn-lg btn-success"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>

