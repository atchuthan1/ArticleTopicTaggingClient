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

public class UpdateCategoryServlet extends HttpServlet {
    String action = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        Object object = session.getAttribute("encodedAuthorization");
        String encodedAuthorization = object.toString();
        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");

        String category_id = request.getParameter("category_id");
        String category_name = request.getParameter("category_name");

        RestRequest restRequest = new RestRequest();

        if (action == "edit") {
            String servicePath = getServletConfig().getInitParameter("servicePath_update");
            String endpointUrl = endpointUrlb + servicePath;

            System.out.println("===============" + encodedAuthorization + "========");

            System.out.println(endpointUrl + "===mm");
            String sendbody = "{\n" +
                    "       \"category_id\": " + category_id + ",\n" +
                    "       \"category_name\": \"" + category_name + "\" }";

            HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "PUT", encodedAuthorization, "application/json", sendbody);
            System.out.println("==========ok updated=============" + conn.getResponseMessage().toString());
            response.sendRedirect("view_category.jsp");

        } else {
            String servicePath = getServletConfig().getInitParameter("servicePath_delete");
            String endpointUrl = endpointUrlb + servicePath + "/" + category_id;
            HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "DELETE", encodedAuthorization);
            System.out.println("==========ok updated=============" + conn.getResponseMessage().toString());
            response.sendRedirect("view_category.jsp");
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

        //String endpointUrl="http://127.0.0.1:8282/Tagger/getRole/"+key;


        HttpSession session = request.getSession();
        Object object = session.getAttribute("encodedAuthorization");
        System.out.println(object);
        System.out.println("=======");
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
        System.out.println("Output from Server .... \n");

        while ((output = br.readLine()) != null) {
            // JSONArray jsonArray = new JSONArray(output);
            // System.out.println(jsonArray.get(1));
            System.out.println(output);
            request.setAttribute("value", output);
            request.setAttribute("action", action);
            request.getRequestDispatcher("edit_category.jsp").forward(request, response);
        }
    }

}