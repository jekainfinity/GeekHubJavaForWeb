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
                <div class="row">
                <!--navbar-->
                <jsp:include page="navbar.jsp"></jsp:include>
                </div>
                <div class="header_page" style="width:850px;margin-left:150px;margin-top:50px"> EDIT PROFILE</div>
                    <div class="main_page_style" style="width:850px;margin-left:150px">
                        <div class="row">
                            <div class="col-lg-9 " style="margin-left:110px">
                                <div class="row">
                                    <form class="form-horizontal" role="form" action="/admin/editProfile" method="post" >
                                        <div class="form-group" style="align-self: center">
                                            <label for="comment">Describe:</label>
                                            <textarea class="form-control" rows="15" id="comment" name="describe"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-2 col-lg-offset-4">
                                                <input type="submit" value="Add information" class="btn btn-lg btn-success"></input>
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
