<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Jekainfinity
  Date: 12.04.2015
  Time: 20:54
  To change this template use File | Settings | File Templates.
--%>
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
<div class="main_page_style">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="search-window-header">BookHotel</div>
            <div class="search-window">
                <form class="form-horizontal" role="form" action="/verifyDates/${hotelname}" method="post">
                    <div class="form-group">
                        <label class="control-label col-lg-3 col-lg-offset-1" for="dateArrive" style="text-align:left">Date Arrive:</label>
                        <div class="col-lg-2">
                            <input type="number" class="form-control" id="dateArrive" placeholder="yyyy" name="yyArive"/>
                        </div>
                        <div class="col-lg-2">
                            <input type="number" class="form-control"  placeholder="mm" name="mmArive"/>
                        </div>
                        <div class="col-lg-2">
                            <input type="number" class="form-control"  placeholder="dd" name="ddArive"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-lg-3 col-lg-offset-1" for="dateLeft" style="text-align:left">Date Left:</label>                                <div class="col-lg-2">
                        <input type="number" class="form-control" id="dateLeft" placeholder="yyyy" name="yyLeft"/>
                    </div>
                        <div class="col-lg-2">
                            <input type="number" class="form-control"  placeholder="mm" name="mmLeft"/>
                        </div>
                        <div class="col-lg-2">
                            <input type="number" class="form-control"  placeholder="dd" name="ddLeft"/>
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
</body>
</html>
