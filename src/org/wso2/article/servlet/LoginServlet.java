package org.wso2.article.servlet;

import org.json.JSONArray;
import org.json.JSONObject;
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

/**
 * Created by atchuthan on 7/26/14.
 */
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("email");
        String password = request.getParameter("password");

        String endpointUrlb = getServletContext().getInitParameter("serviceUrl");
        String servicePath = getServletConfig().getInitParameter("servicePath");
        String endpointUrl = endpointUrlb + servicePath;
        String roleIdAdmin = getServletContext().getInitParameter("roleIdAdmin");
        String roleIdUser = getServletContext().getInitParameter("roleIdUser");

        System.out.println("dddd====" + endpointUrl + "=ddd=======");
        RestRequest restRequest = new RestRequest();
        String encodedAuthorization = restRequest.encodedAuthorization(username, password);
        System.out.println("===============" + encodedAuthorization + "========");
        HttpURLConnection conn = restRequest.sendJsonRestRequest(endpointUrl, "POST", encodedAuthorization, "application/json", "{\"email\":\"" + username + "\"}");
        System.out.println("=======================");
        BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
        String output;
        //  String firstName=null;
        //  String whoI=null;

        System.out.println("Output from Server .... \n");

        while ((output = br.readLine()) != null) {
            JSONArray jsonArray = new JSONArray(output);
            System.out.println(jsonArray.get(0));
            //System.out.println(output);
            JSONObject jsonObject = new JSONObject(jsonArray.get(0).toString());
            System.out.println(jsonObject.toString());
            String rid = jsonObject.get("role_id").toString();
            System.out.println(rid);
            //todo split responce code firstName and whoI

            request.setAttribute("first_name", jsonObject.get("first_name").toString());

            if (rid.matches(roleIdAdmin))//&& conn.getResponseMessage().matches("ok")/* && todo */)
            {
                System.out.println("success");
                HttpSession session = request.getSession();
                session.setAttribute("encodedAuthorization", encodedAuthorization);
                System.out.println(session.getAttribute("encodedAuthorization"));
                session.setAttribute("email", username);
                session.setAttribute("role_id", rid);


                request.setAttribute("value", output);
                request.getRequestDispatcher("admin_dash.jsp").forward(request, response);
            }
            if (rid.matches(roleIdUser))//&& conn.getResponseMessage().matches("ok")/* && todo */)
            {
                System.out.println("success");
                HttpSession session = request.getSession();
                session.setAttribute("encodedAuthorization", encodedAuthorization);
                session.setAttribute("email", username);
                session.setAttribute("role_id", rid);
                request.setAttribute("value", output);
                request.getRequestDispatcher("user_dash.jsp").forward(request, response);
            }


        }
    }
}
