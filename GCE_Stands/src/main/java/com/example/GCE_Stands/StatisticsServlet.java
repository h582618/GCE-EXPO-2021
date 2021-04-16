package com.example.GCE_Stands;

import Models.Stand;
import Models.StatisticDto;
import Wrappers.StandWrapper;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

@WebServlet(name = "statistics", value = "/statistics")
public class StatisticsServlet extends HttpServlet {
    List<String> admins = new ArrayList<String>(
            Arrays.asList("matiasvedeler@gmail.com","andersjohan97@gmail.com","etkarhemit@gmail.com","evensenchristian@gmail.com",
                    "evensleire97@gmail.com","frede.berdal@gmail.com","maggu898@gmail.com","nichlasloneberg@gmail.com","simon.kobbenes@gmail.com"));
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (email != null && admins.contains(email)) {
            String lokalt = "http://localhost:8080/stands/getStands";

            String api = "http://data1.hib.no:9090/expo2021_api_3/highscores";

            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            URL url = new URL(api);

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
                sc.close();

                StatisticDto statisticDto = new Gson().fromJson(inline, StatisticDto.class);


                session.setAttribute("topAverage", statisticDto.getTopAverage());

                session.setAttribute("topNumberOfVotes", statisticDto.getTopNumberOfVotes());

                request.getRequestDispatcher("WEB-INF/Statistics.jsp").forward(request, response);

                return;
            }
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
