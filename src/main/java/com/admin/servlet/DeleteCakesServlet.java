package com.admin.servlet;

import com.DAO.CakesDAOImpl;
import com.DB.DBConnect;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({"/delete"})
public class DeleteCakesServlet extends HttpServlet {
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         int id = Integer.parseInt(req.getParameter("id"));
         CakesDAOImpl dao = new CakesDAOImpl(DBConnect.getConn());
         boolean f = dao.deleteCakes(id);
         HttpSession session = req.getSession();
         if (f) {
            session.setAttribute("succMsg", "Cake Delete Successfully..");
            resp.sendRedirect("admin/allcakes.jsp");
         } else {
            session.setAttribute("failedMsg", "Something Wrong on Server..");
            resp.sendRedirect("admin/allcakes.jsp");
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

   }
}