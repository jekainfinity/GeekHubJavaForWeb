<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="navbar-header">
        <a class="navbar-brand" href="/"><b style="color:#39CCCC">MYBOOKING.COM</b></a>
    </div>
    <div id="navbar" class="navbar-collapse collapse navbar-right">
        <ul class="nav navbar-nav">
            <!-- For authorize customer-->
            <c:if test="${chek !=null}">
                <sec:authorize access="hasRole('ROLE_ADMIN')">
                    <li><a href="/admin/page">My account</a></li>
                </sec:authorize>

                <sec:authorize access="hasRole('ROLE_USER') ">
                    <li><a href="/user/page">My account</a></li>
                </sec:authorize>

                <li role="presentation"><a href="javascript: logout()">Logout</a></li>

            </c:if>

            <!-- For not authorize customer-->
            <c:if test="${chek ==null}">
                <li role="presentation"><a href="/registration">Registration</a></li>
                <li role="presentation"><a href="/login">Login</a></li>
            </c:if>

        </ul>
    </div><!--/.nav-collapse -->
</nav>

            <!-- logout with csrf-->
            <form action="<c:url value='/logout'/>" method="post" id="logoutForm">
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}" />
            </form>
        </ul>
    </div>
</nav>
<script>
    function logout(){
        document.getElementById("logoutForm").submit();
    }
</script>