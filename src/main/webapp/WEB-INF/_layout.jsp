

<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String context =request.getServletContext().getContextPath();
    String pageBody = (String)request.getAttribute("pageBody");

%>
<html>

<head>
    <title>Title</title>
    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
<nav>
    <div class="nav-wrapper  cyan">
        <a href="<%= context %>/" class="brand-logo" style="padding-left: 10px;">
            <img src="<%= context %>/images/01.jpg" alt="Java Web Logo" style="max-height: 50px; max-width: 150px; vertical-align: middle;">
            <span style="vertical-align: middle; margin-left: 10px;">Java Web</span>
            <img src="<%= context %>/images/01.jpg" alt="Java Web Logo" style="max-height: 50px; max-width: 150px; vertical-align: middle; margin-left: 10px;">
        </a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            <li class="<%="".equals(pageBody)?"active":"" %>"><a href="<%= context %>/about-jsp">JSP</a></li>
            <li class="<%="page2.jsp".equals(pageBody)?"active":"" %>"><a href="<%= context %>/page2">Servlet</a></li>
            <li class="<%="page3.jsp".equals(pageBody)?"active":"" %>"><a href="<%= context %>/page3">Filter</a></li>
            <li class="<%="IOC.jsp".equals(pageBody)?"active":"" %>"><a href="<%= context %>/IOC">IoC</a></li>

        </ul>
    </div>
</nav>
<div class="container">
    <jsp:include page="<%= pageBody %>"/>
</div>
<footer class="page-footer cyan">
    <div class="footer-copyright">
        <div class="container">
            <div id="userAgentInfo">
                Browser: <%= request.getAttribute("userAgent") %>
            </div>
            © 2023 Copyright Text
            <img src="<%= context %>/images/02.png" alt="Java Web Logo" style="max-height: 50px; max-width: 150px; vertical-align: middle;">
        </div>
    </div>
</footer>
<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>