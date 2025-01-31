package com.user.servlet;

import java.io.IOException;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/removecake")

public class RemoveCakeCart extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 try {
	         int ckid = Integer.parseInt(req.getParameter("ckid"));
	         int uid = Integer.parseInt(req.getParameter("uid"));
	         int cid = Integer.parseInt(req.getParameter("cid"));

	         CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
	         boolean f = dao.deletecake(ckid,uid,cid);
	         HttpSession session = req.getSession();
	         if (f) {
	            session.setAttribute("succMsg", "Cake Removed from Cart");
	            resp.sendRedirect("checkout.jsp");
	         } else {
	            session.setAttribute("failedMsg", "Something Wrong on Server..");
	            resp.sendRedirect("checkout.jsp");
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
		
	}

	
	
}
