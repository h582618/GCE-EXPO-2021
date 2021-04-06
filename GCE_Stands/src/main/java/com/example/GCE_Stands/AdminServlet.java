package com.example.GCE_Stands;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Admin", value = "/Admin")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        System.out.println(email);

        if(email != null && email.toLowerCase().equals("matiasvedeler@gmail.com")){

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
        response.sendRedirect("Admin");
        response.setContentType("text/html;charset=UTF-8");
    }
}
