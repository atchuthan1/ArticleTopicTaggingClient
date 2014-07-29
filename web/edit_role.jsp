<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | Edit User Role</title>
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

        <%
            Object value = null;
            value = request.getAttribute("value");

            JSONArray jsonArray = new JSONArray(value.toString());
            // for (int i = 0; i < jsonArray.length(); i++) {
            JSONObject jsonObject = new JSONObject(jsonArray.get(0).toString());%>

        <form method="POST" action="UpdateRoleServlet">
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2"><h3 class="form-signin-heading">Edit Roles</h3></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>


            <tr>
                <td><label class="control-label">Role ID&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role Id" required name="role_id"
                           readonly value= <%=jsonObject.get("role_id").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Role&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" placeholder="Update Your Role" required name="role"
                           value=<%=jsonObject.get("role").toString() %>></td>
            </tr>

            <tr>
                <td><br></td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <button class="btn btn-primary" type="submit">Update</button>
                    &nbsp;
                    <button class="btn btn-primary" type="submit">Delete</button>
                </td>
                &nbsp;&nbsp;&nbsp;
            </tr>

        </form>


    </table>
</div>
</body>
</html>