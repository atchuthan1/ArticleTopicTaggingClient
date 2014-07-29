package org.wso2.article.servlet;

import org.json.JSONArray;
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


public class ViewCategoryServlet extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");
        String servicePath = getServletConfig().getInitParameter("servicePath");
        String endpointUrl = endpointUrlb + servicePath;
        RestRequest restRequest = new RestRequest();


        //todo this code only for check Authorization
        Object object = session.getAttribute("encodedAuthorization");
        String encodedAuthorization = object.toString();
        System.out.println("===============" + encodedAuthorization + "========");

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
            JSONArray jsonArray = new JSONArray(output);
            System.out.println(jsonArray.get(1));
            System.out.println(output);
            request.setAttribute("value", output);
            request.getRequestDispatcher("view_category.jsp").forward(request, response);
        }
    }
}
