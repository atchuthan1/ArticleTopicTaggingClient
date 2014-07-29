<%--
  Created by IntelliJ IDEA.
  User: thenuzan
  Date: 23/07/14
  Time: 00:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | Admin Dash Board</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<%
    Object first_name = request.getAttribute("first_name");
%>

<div>
    <jsp:include page="menu.jsp"/>
</div>
<div>
    <jsp:include page="side_nav.jsp"/>
</div>
<div>
    <jsp:include page="side_nav_right.jsp"/>
</div>
<div class="">
    <br/>
    <br/>

    <p>

    <h1>Hi &nbsp;<%=first_name%>!!</h1></p></div>
</body>
</html>
