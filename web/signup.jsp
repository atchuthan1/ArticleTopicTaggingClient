<%--
  Created by IntelliJ IDEA.
  User: thenuzan
  Date: 23/07/14
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Article Topic Tagging | Signup</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="">
    <table align="center">
        <div class="jumbotron">
            <form method="post" action="SignupServlet">
                <tr>
                    <td colspan="2"><h3 class="form-signin-heading">Signup</h3></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><label class="control-label">Email</label></td>
                    <td><input type="email" class="form-control" placeholder="Email address" required autofocus
                               NAME="email"></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><label class="control-label">Password</label></td>
                    <td><input type="password" class="form-control" placeholder="Password" required name="password">
                    </td>
                </tr>

                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><label class="control-label">First Name</label></td>
                    <td><input type="text" class="form-control" placeholder="First name" required name="first_name">
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><label class="control-label">Last Name</label></td>
                    <td><input type="text" class="form-control" placeholder="Last name" required name="last_name"></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><label class="control-label">Date of Birth &nbsp;</label></td>
                    <td><input type="date" class="form-control" placeholder="DD-MM-YYYY" required name="date_of_birth">
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td><label class="control-label">Tags</label></td>
                    <td><input type="text" class="form-control" placeholder="Tags" required name="tags"></td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <button class="btn btn-primary" type="submit">Signup</button>
                        &nbsp;
                        <button class="btn btn-primary" type="reset">Reset</button>
                    </td>
                    &nbsp;&nbsp;&nbsp;
                </tr>

            </form>
        </div>
    </table>
</div>
</body>
</html>
