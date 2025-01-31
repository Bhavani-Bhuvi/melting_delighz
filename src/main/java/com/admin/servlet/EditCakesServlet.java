package com.admin.servlet;

import com.DAO.CakesDAOImpl;
import com.DB.DBConnect;
import com.entity.CakeDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({"/editcakes"})
public class EditCakesServlet extends HttpServlet {
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         int id = Integer.parseInt(req.getParameter("id"));
         String cakename = req.getParameter("cname");
         String flavour = req.getParameter("flavour");
         String price = req.getParameter("price");
         String status = req.getParameter("status");
         CakeDetails c = new CakeDetails();
         c.setCakeId(id);
         c.setCakename(cakename);
         c.setFlavour(flavour);
         c.setPrice(price);
         c.setStatus(status);
         CakesDAOImpl dao = new CakesDAOImpl(DBConnect.getConn());
         boolean f = dao.updateEditCakes(c);
         HttpSession session = req.getSession();
         if (f) {
            session.setAttribute("succMsg", "Cake Update Successfully..");
            resp.sendRedirect("admin/allcakes.jsp");
         } else {
            session.setAttribute("failedMsg", "Something Wrong on Server..");
            resp.sendRedirect("admin/allcakes.jsp");
         }
      } catch (Exception var12) {
         var12.printStackTrace();
      }

   }
}
