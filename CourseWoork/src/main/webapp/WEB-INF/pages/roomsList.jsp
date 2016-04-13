<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>rooms list</title>
    <link href="<c:url value='/bootstrap/css/bootstrap.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.css'/>" rel="stylesheet" />
    <link href="<c:url value='/bootstrap/css/searchResult.css'/>" rel="stylesheet" />
</head>
<body>
<div class="container">
    <div class="row">
    <jsp:include page="navbar.jsp"/>
    </div>

    <div class="header_page" style="width:850px;margin-left:150px;margin-top:50px"> Rooms at hotel</div>
    <div class="main_page_style" style="width:850px;margin-left:150px">
        <div class="row">
            <div class="col-lg-9 col-lg-offset-1" style="margin-left:120px">
                <h2>Hotel : ${hotelname}</h2>
                <p>Below represetnt all room in hotel</p>
                <table class="table table-condensed">
                    <thead>
                    <tr>
                        <th>Room number</th>
                        <th>Type of room</th>
                        <th>Price</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="room" items="${rooms}">
                        <tr>
                            <td><a href="/booking">${room.getRoomNumber()}</a></td>
                            <td>${room.getRoomType()}</td>
                            <td>${room.getRoomPrice()}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>    