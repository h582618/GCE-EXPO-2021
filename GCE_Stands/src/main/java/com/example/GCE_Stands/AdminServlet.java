package com.example.GCE_Stands;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@WebServlet(name = "Admin", value = "/Admin")
public class AdminServlet extends HttpServlet {

    List<String> admins = new ArrayList<String>(
            Arrays.asList("matiasvedeler@gmail.com","andersjohan97@gmail.com","etkarhemit@gmail.com","evensenchristian@gmail.com",
                    "evensleire97@gmail.com","frede.berdal@gmail.com","maggu898@gmail.com","nichlasloneberg@gmail.com","simon.kobbenes@gmail.com"));

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");


        if(email != null && admins.contains(email)){

            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            request.getRequestDispatcher("WEB-INF/AdminPage.jsp").forward(request, response);
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        HttpSession session = request.getSession();

        session.setAttribute("email",email);

        if(email != null) {
            if (admins.contains(email)) {
                response.sendRedirect("Admin");
            } else {
                response.sendRedirect("Welcome.jsp");
            }
        }
        response.setContentType("text/html;charset=UTF-8");
    }
}
