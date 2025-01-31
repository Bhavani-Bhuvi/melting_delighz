package com.user.servlet;

import com.DAO.CakesDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.CakeDetails;
import com.entity.Cart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet({"/cart"})
public class CartServlet extends HttpServlet {
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         int id = Integer.parseInt(req.getParameter("id"));
         int uid = Integer.parseInt(req.getParameter("uid"));
         CakesDAOImpl dao = new CakesDAOImpl(DBConnect.getConn());
         CakeDetails c = dao.getCakeById(id);
         Cart ca = new Cart();
         ca.setCkid(id);
         ca.setUid(uid);
         ca.setCakename(c.getCakename());
         ca.setPrice(Double.parseDouble(c.getPrice()));
         ca.setTotalprice(Double.parseDouble(c.getPrice()));
         CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
         boolean f = dao2.addCart(ca);
         HttpSession session = req.getSession();
         if (f) {
            session.setAttribute("addCart", "Book Added to cart");
           resp.sendRedirect("checkout.jsp");
         } else {
            session.setAttribute("failedMsg", "Something Wrong on server..");
           resp.sendRedirect("checkout.jsp");
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

   }
}