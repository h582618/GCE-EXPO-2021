package com.example.GCE_Stands;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "Home", value = "/Home")
public class HomeServlet extends HttpServlet {

    List<String> admins = new ArrayList<String>(
            Arrays.asList("matiasvedeler@gmail.com","andersjohan97@gmail.com","etkarhemit@gmail.com","evensenchristian@gmail.com",
                    "evensleire97@gmail.com","frede.berdal@gmail.com","maggu898@gmail.com","nichlasloneberg@gmail.com","simon.kobbenes@gmail.com"));

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("WEB-INF/Welcome.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String email = request.getParameter("email");
        String id = request.getParameter("id");

        HttpSession session = request.getSession();

        session.setAttribute("email",email);



        if(email != null) {
            if (admins.contains(email) && (id == null || id == "")) {
                System.out.println("admin");
                response.sendRedirect("Admin");
            } else if (id != null && id != "") {
                response.sendRedirect("feedback?id="+id);
            } else {
                response.sendRedirect("Home");
            }
        } else {
            response.sendRedirect("Index.jsp");
        }
    }
}
