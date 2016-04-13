<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <title></title>
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
            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <!--navbar-->
                    <jsp:include page="navbar.jsp"></jsp:include>
                </div>
            </div>
            <c:if test="${hotelList.get(0) != null}">
                <c:forEach var="item" items="${hotelList}">
                    <div class="row">
                        <div class="col-lg-10 col-lg-offset-1">
                            <div class="main_page_style">
                            <div class="col-lg-9 ">
                                <div class="out-list">
                                    <h4>HotelName: ${item.getNameHotel()}</h4>
                                    <p>${item.getHotelInform().getDescribe()}.</p>
                                </div>
                            </div>
                            <div class="col-lg-2">
                                <div class="out-list-right">
                                    <a href="<c:url value='/viewHotel/${item.getHotelId()}'/>" class="btn btn-primary" role="button">
                                        View hotel
                                    </a>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <div class="row">
                <div class="col-lg-10 col-lg-offset-1">
                    <div class="main_pagination_style">
                        <div class="col-lg-6 col-lg-offset-4">
                            <ul class="pagination">
                            <c:if test="${pageNumber != 0}">
                                  <c:if test="${(pageNumber != 1) }"  >
                                    <li><a href="<c:url value='/searchHotels/${pageNumber-1}'/>">&laquo;</a></li>
                                  </c:if>
                                  <c:forEach var="i" begin="1" end="${countOfPage}">
                                    <c:if test="${pageNumber == i}">
                                        <li><a class="active">${i}</a></li>
                                    </c:if>
                                    <c:if test="${pageNumber == i}">
                                        <li><a href="<c:url value='/searchHotels/${i}'/>">${i}</a></li>
                                    </c:if>
                                  </c:forEach>
                                  <c:if test="${pageNumber != countOfPage}"  >
                                      <li><a href="<c:url value='/searchHotels/${pageNumber+1}'/>">&raquo;</a></li>
                                  </c:if>
                                </ul><br>
                            </c:if>
                        </div>    
                    </div>
                </div>
            </div>
        </div>  
    </body>
</html>