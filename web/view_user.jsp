<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | View User</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<% String roleIdAdmin = pageContext.getServletContext().getInitParameter("roleIdAdmin");
    String roleIdUser = pageContext.getServletContext().getInitParameter("roleIdUser");
    String roleId = session.getAttribute("role_id").toString();
%>
<div>
    <jsp:include page="menu.jsp"/>
</div>


<%if (roleId.equals(roleIdAdmin)) {%>
<div>
    <jsp:include page="side_nav.jsp"/>
</div>

<%
    }
    if (roleId.equals(roleIdUser)) {
%>
<div>
    <jsp:include page="side_nav_user.jsp"/>
</div>
<%}%>


<div>
    <jsp:include page="side_nav_right.jsp"/>
</div>
<div class="">
    <table align="center" cellpadding="10" >

        <form method="GET" action="ViewUserServlet">
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2"><h3 class="form-signin-heading">View Users</h3></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <button class="btn btn-primary" type="submit">View</button>
                    &nbsp;</td>
                &nbsp;&nbsp;&nbsp;
            </tr>
        </form>
    </table>
</div>
</form>
<%
    Object value = null;
    value = request.getAttribute("value");
    if (value != null) {
%>
<br><br>

<table align="center" border="1" cellpadding="15">

    <tr>
        <td>E-Mail</td>
        <td>First Name</td>
        <td>Last Name</td>
        <td>Role ID</td>
        <td>Tags</td>
        <td>Date of Birth</td>

        <td align="center" colspan="2">Action</td>
    </tr>
    <% JSONArray jsonArray = new JSONArray(value.toString());
        for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = new JSONObject(jsonArray.get(i).toString());%>
    <tr>
        <td><%=jsonObject.get("email").toString()%>
        </td>
        <%--<td><%=jsonObject.get("password").toString()%></td>--%>
        <td><%=jsonObject.get("first_name").toString() %>
        </td>
        <td><%=jsonObject.get("last_name").toString()%>
        </td>
        <td><%=jsonObject.get("role_id").toString() %>
        </td>
        <td><%=jsonObject.get("tags").toString()%>
        </td>
        <td><%=jsonObject.get("date_of_birth").toString() %>
        </td>

        <td><a href="/UpdateUserServlet?key=<%=jsonObject.get("email").toString()%>">Edit</a></td>
        <% if (roleId.equals(roleIdAdmin)) {
        %>
        <td><a href="/UpdateUserServlet?key2=<%=jsonObject.get("email").toString()%>">Delete</a></td>
        <%}%>

    </tr>
    <%}%>
</table>
</div>
<% } %>
</body>
</html>
