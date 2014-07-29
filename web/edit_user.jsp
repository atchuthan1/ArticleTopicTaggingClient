<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | Edit User </title>
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

        <form method="POST" action="UpdateUserServlet">
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td colspan="2"><h3 class="form-signin-heading">Edit User</h3></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">E-Mail&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" required name="email" readonly
                           value= <%=jsonObject.get("email").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Password&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" required name="password" readonly
                           value= <%=jsonObject.get("password").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">First Name&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" name="first_name"
                           value= <%=jsonObject.get("first_name").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Last Name&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" name="last_name"
                           value= <%=jsonObject.get("last_name").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Role ID&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" name="role_id"
                           value= <%=jsonObject.get("role_id").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Tags&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" required name="tags"
                           value= <%=jsonObject.get("tags").toString()%>></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
            <tr>
                <td><label class="control-label">Date Of Birth&nbsp;&nbsp;</label></td>
                <td><input type="text" class="form-control" name="date_of_birth"
                           value= <%=jsonObject.get("date_of_birth").toString()%>></td>
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