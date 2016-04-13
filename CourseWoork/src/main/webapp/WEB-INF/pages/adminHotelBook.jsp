<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>information Admin</title>
    <link href="<c:url value='/bootstrap/css/bootstrap.css'/>"  rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/searchResult.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/page-style.css'/>" rel="stylesheet" />
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/bootstrap.js"></script>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/jquery.js"></script>
    <style>
        .main_page_style_window{
            background-color: #eee;
            border: solid;
            border-color: #286090;
            height: 800px;
            margin-top: 20px;
            margin-left: 100px;
        }
        .left-sep{
            border-right: solid;
            heigh: 15px;
        }
        .bot-sep{
            border-right: solid;
            width: auto;
        }
        .grey-style{
            height: 20px;
            background-color: #3c3c3c;
            color: #C0C0C0;
        }
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
            height: 170px;
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
        .information-text{
            border-bottom-left-radius: 15px;
            border-bottom-right-radius: 15px;
            padding: 5px 5px 5px 5px;
            border: solid;
            border-width: thin;
            border-color: #3c3c3c;
            height: 72px;
        }
        .information-blue{
            margin-top: 15px;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
            border: solid;
            border-width: thin;
            border-color: #3c3c3c;
            height: auto;
            background-color: #3c3c3c;
        }
        .data-arive{
            border: solid;
            border-width: thin;
            border-color: #717171;
            background-color: #717171;
            height:25px;
            color: #C0C0C0;
        }
        .data-left{
            border: solid;
            border-width: thin;
            border-radius: 0px 0px 5px 5px;
            height:25px;
            color: #C0C0C0;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="col-lg-10 col-lg-offset-1">
        <!--navbar-->
        <jsp:include page="navbar.jsp"></jsp:include>

        <div class="header_page"> book list</div>

        <div class="main_page_style">
            <c:forEach items="${bookHotelList}" var="item">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2 information-blue">
                        <h4 class="letter"><b>Hotel Name: ${item.getHotel().getNameHotel()}</b></h4>
                    </div>
                    <div class="col-lg-8 col-lg-offset-2 information-text">
                        <div class="col-lg-6 data-arive">Date Arrive</div>
                        <div class="col-lg-6 data-arive">Date Left</div>
                        <div class="col-lg-6 data-left">${item.getDateArrive()}</div>
                        <div class="col-lg-6 data-left">${item.getDateLeft()}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</div>
</body>
</html>
