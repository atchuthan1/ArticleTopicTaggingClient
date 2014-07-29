package org.wso2.article.servlet;

import org.wso2.article.util.RestRequest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;


public class UpdateUserServlet extends HttpServlet {
    String action = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Object object = session.getAttribute("encodedAuthorization");
        String encodedAuthorization = object.toString();
        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String role_id = request.getParameter("role_id");
        String tags = request.getParameter("tags");
        String date_of_birth = request.getParameter("date_of_birth");

        RestRequest restRequest = new RestRequest();

        if (action == "edit") {
            String servicePath = getServletConfig().getInitParameter("servicePath_update");
            String endpointUrl = endpointUrlb + servicePath;

            String sendbody = "  {\n" +
                    "       \"first_name\": \"" + first_name + "\",\n" +
                    "       \"role_id\": " + role_id + ",\n" +
                    "       \"email\": \"" + email + "\",\n" +
                    "       \"last_name\": \"" + last_name + "\",\n" +
                    "       \"tags\": \"" + tags + "\",\n" +
                    "       \"date_of_birth\": \"" + date_of_birth + "\",\n" +
                    "       \"password\": \"" + password + "\"\n" +
                    "   }";

            HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "PUT", encodedAuthorization, "application/json", sendbody);
            System.out.println("==========ok updated=============" + conn.getResponseMessage().toString());
            response.sendRedirect("view_user.jsp");

        } else {
            String servicePath = getServletConfig().getInitParameter("servicePath_delete");
            String endpointUrl = endpointUrlb + servicePath + "/" + email;
            HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "DELETE", encodedAuthorization);
            System.out.println("==========ok updated=============" + conn.getResponseMessage().toString());
            response.sendRedirect("view_user.jsp");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("key"));

        String key = request.getParameter("key");
        action = "edit";
        if (key == null) {
            key = request.getParameter("key2");
            action = "delete";
        }

        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");
        String servicePath = getServletConfig().getInitParameter("servicePath_get");
        String endpointUrl = endpointUrlb + servicePath + "/" + key;

        HttpSession session = request.getSession();
        Object object = session.getAttribute("encodedAuthorization");
        System.out.println(object);
        String encodedAuthorization = object.toString();
        //todo this code only for check Authorization
        RestRequest restRequest = new RestRequest();
        session.setAttribute("encodedAuthorization", encodedAuthorization);
        if (session.getAttribute("encodedAuthorization").toString().equals(null)) {
            response.sendRedirect("index.jsp");
        }

        //todo final system authorization
        //String encodedAuthorization=session.getAttribute("encodedAuthorization").toString();

        HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "GET", encodedAuthorization);
        BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
        String output;

        while ((output = br.readLine()) != null) {

            System.out.println(output);
            request.setAttribute("value", output);
            request.setAttribute("action", action);
            request.getRequestDispatcher("edit_user.jsp").forward(request, response);
        }
    }

}