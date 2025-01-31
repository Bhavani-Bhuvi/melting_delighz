package com.user.servlet;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({"/register"})
public class RegisterServlet extends HttpServlet {
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         String name = req.getParameter("fname");
         String email = req.getParameter("email");
         String phone = req.getParameter("phno");
         String password = req.getParameter("password");
         String check = req.getParameter("check");
         User us = new User();
         us.setName(name);
         us.setEmail(email);
         us.setPhone_no(phone);
         us.setPassword(password);
         HttpSession session = req.getSession();
         
    if (check != null) {
            UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
            boolean f2 = dao.checkUser(email);
       if(f2) {
            	 boolean f = dao.userRegister(us);
                 
            if (f) {
                    session.setAttribute("succMsg", "Register Successfully..");
                    resp.sendRedirect("register.jsp");
                 } else {
                    session.setAttribute("failedMsg", "Something Wrong on server..");
                    resp.sendRedirect("register.jsp");
                 } }
         else {
            session.setAttribute("failedMsg", "User Already Exist Try Another Email Id");
            resp.sendRedirect("register.jsp");
         }
      } else {
          session.setAttribute("failedMsg", "User Already Exist Try Another Email Id");
          resp.sendRedirect("register.jsp");
       }
    }
      
      catch (Exception e) {
         e.printStackTrace();
      }

   }
}


