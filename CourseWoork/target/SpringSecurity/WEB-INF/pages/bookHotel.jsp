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
    <style>
        .search-window{
            border-width: medium;
            border-left: double;
            border-right: double;
            border-bottom: double;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
            border-color: #D2691E;
            background-color: #FFDEAD;
            height: 400px;
            width: auto;
            padding: 10px;
            margin-bottom: 20px;
        }
        .search-adding-window{
            border-width: medium;
            border-left: double;
            border-right: double;
            border-bottom: double;
            border-bottom-left-radius: 12px;
            border-bottom-right-radius: 12px;
            border-color: #D2691E;
            background-color: #FFDEAD;
            height: 270px;
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
            border-color: #D2691E;
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

        <div class="header_page"> Book Hotel Page</div>

        <div class="main_page_style">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <div class="search-window-header">BookHotel</div>
                    <div class="search-window">
                        <form class="form-horizontal" role="form" action="/booking/${hotelname}" method="post">
                            <div class="form-group">
                                <label class="control-label col-lg-3 col-lg-offset-1" for="hotelName" style="text-align:left">Name of hotel:</label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="hotelName" placeholder="${hotelname}" name="hotelName" disabled/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3 col-lg-offset-1" for="userName" style="text-align:left">User name:</label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="userName" placeholder="${realName}" name="userName" disabled/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3 col-lg-offset-1"  for="userPhone" style="text-align:left">User phone:</label>
                                <div class="col-lg-6">
                                    <input type="text" class="form-control" id="userPhone" placeholder="${phone}" name="phoneNumber" disabled/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3 col-lg-offset-1" for="userAddress" style="text-align:left">Size of room:</label>
                                <div class="col-lg-6">
                                    <input type="number" class="form-control" id="userAddress" placeholder="size of room" name="sizeRoom" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3 col-lg-offset-1" for="dateArrive" style="text-align:left">Date Arrive:</label>
                                <div class="col-lg-2">
                                    <input type="number" class="form-control" id="dateArrive" placeholder="yyyy" name="yyArive" disabled/>
                                </div>
                                <div class="col-lg-2">
                                    <input type="number" class="form-control"  placeholder="mm" name="mmArive" disabled/>
                                </div>
                                <div class="col-lg-2">
                                    <input type="number" class="form-control"  placeholder="dd" name="ddArive" disabled/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-3 col-lg-offset-1" for="dateLeft" style="text-align:left">Date Left:</label>                                <div class="col-lg-2">
                                <input type="number" class="form-control" id="dateLeft" placeholder="yyyy" name="yyLeft" disabled/>
                            </div>
                                <div class="col-lg-2">
                                    <input type="number" class="form-control"  placeholder="mm" name="mmLeft" disabled/>
                                </div>
                                <div class="col-lg-2">
                                    <input type="number" class="form-control"  placeholder="dd" name="ddLeft" disabled/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-4 col-lg-offset-4">
                                    <input type="submit" value="BOOK" class="btn btn-lg btn-success"/>
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