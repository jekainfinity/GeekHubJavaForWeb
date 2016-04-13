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
                            <form class="form-horizontal" role="form" action="/admin/addHotel" method="post" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="name" style="text-align:left">Name of hotel:</label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" id="name" placeholder="Name of hotel" name="hotelName">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="photo" style="text-align:left">Add image 1</label>
                                    <div class="col-lg-6">
                                        <input type="file" id="photo" name="file">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="photo1" style="text-align:left">Add image 2</label>
                                    <div class="col-lg-6">
                                        <input type="file" id="photo1" name="file">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="photo2" style="text-align:left">Add image 3</label>
                                    <div class="col-lg-6">
                                        <input type="file" id="photo2" name="file">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="photo3" style="text-align:left">Add image 4</label>
                                    <div class="col-lg-6">
                                        <input type="file" id="photo3" name="file">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="country" style="text-align:left">Country:</label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" id="country" placeholder="Enter country" name="countryHotel" >
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="town" style="text-align:left">Town:</label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" id="town" placeholder="Enter town" name="townHotel">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="address" style="text-align:left">Address:</label>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" id="address" placeholder="Enter address" name="addressHotel" >
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-lg-3 col-lg-offset-2" for="stars" style="text-align:left">Quantity of Stars:</label>
                                    <div class="col-lg-6 ">
                                        <input type="number" class="form-control" id="stars" placeholder="Enter quantity stars" name="hotelStars">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-9 col-lg-offset-2">
                                        <label for="comment">Describe:</label>
                                        <textarea class="form-control" rows="10" id="comment" name="describe"></textarea>
                                    </div>
                                </div>
                                <input type="hidden"
                                       name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                                <div class="form-group">
                                    <div class="col-lg-6 col-lg-offset-6">
                                        <input type="submit" value="Add hotel" class="btn btn-lg btn-success"/>
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
    
   