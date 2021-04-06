package com.example.GCE_Stands;

import Models.Stand;
import Models.Vote;
import Wrappers.StandWrapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;


@WebServlet(name = "FeedbackServlet", value = "/feedback")
public class FeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        //ID OG VOTE
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        System.out.println(email);

        if(email != null){
            String id = request.getParameter("id");

            //TODO
            URL url = new URL("http://data1.hib.no:9090/expo2021_prosjekt13/stand/"+id);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestMethod("GET");

            conn.connect();

            int responsecode = conn.getResponseCode();

            if (responsecode != 200)
                throw new RuntimeException("HttpResponseCode: " + responsecode);
            else {
                String inline = "";
                Scanner sc = new Scanner(url.openStream());
                while (sc.hasNext()) {
                    inline += sc.nextLine();
                }
                System.out.println(inline);
                sc.close();

                Stand thisStand = new Gson().fromJson(inline, Stand.class);

                session.setAttribute("thisStand",thisStand);
            }

            request.getRequestDispatcher("WEB-INF/Feedback.jsp").forward(request, response);
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");

        String rating = request.getParameter("rating");

        int absRating = Math.abs(Integer.parseInt(rating));

        String standID = request.getParameter("standId");

        Vote vote = new Vote(email,absRating);

        URL url = new URL("http://data1.hib.no:9090/expo2021_prosjekt13/vote/"+standID);

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        conn.setRequestMethod("POST");

        conn.setRequestProperty("Content-Type", "application/json; utf-8");

        conn.setRequestProperty("Accept", "application/json");

        conn.setDoOutput(true);

        JsonObject innerObject = new JsonObject();
        innerObject.addProperty("email",email);
        innerObject.addProperty("value",absRating);

        String jsonInputString = innerObject.toString();//"{ email : " + email +"," +"value :"+ absRating + "}";

        try(OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        request.getRequestDispatcher("WEB-INF/FeedbackSuccess.html").forward(request, response);



    }
}
