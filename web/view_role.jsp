<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | View User Role</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>
<body>

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
    <table align="center">

        <form method="get" action="ViewRoleServlet">
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2"><h3 class="form-signin-heading">View Roles</h3></td>
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

    <%
        Object value = null;
        value = request.getAttribute("value");
        if (value != null) {
    %>
    <br><br>

    <table align="center" border="1" cellspacing="3">

        <tr>
            <td class="">Role Id</td>
            <td>Role</td>
            <td align="center" colspan="2">Action</td>
        </tr>
        <% JSONArray jsonArray = new JSONArray(value.toString());
            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject jsonObject = new JSONObject(jsonArray.get(i).toString());%>
        <tr>
            <td><%=jsonObject.get("role_id").toString()%>
            </td>
            <td><%=jsonObject.get("role").toString() %>
            </td>
            <td><a href="/UpdateRoleServlet?key=<%=jsonObject.get("role_id").toString()%>">Edit</a></td>
            <td><a href="/UpdateRoleServlet?key2=<%=jsonObject.get("role_id").toString()%>">Delete</a></td>
        </tr>
        <%}%>
    </table>
</div>
<% } %>
</body>
</html>