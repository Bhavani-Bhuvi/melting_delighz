package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.CartDAOImpl;
import com.DAO.OrderDAOImpl;
import com.DB.DBConnect;
import com.entity.CakeOrder;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet({"/order"})

public class OrderServlet extends HttpServlet {
	
	 protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	      try {
	    	  
		         HttpSession session = req.getSession();	         

	    	
		  int id = Integer.parseInt(req.getParameter("id"));
  
	      String name=req.getParameter("name");
	      String email=req.getParameter("email");
	      String phone=req.getParameter("phone");
	      String address=req.getParameter("address");
	      String landmark=req.getParameter("landmark");
	      String city=req.getParameter("city");
	      String state=req.getParameter("state");
	      String pincode=req.getParameter("pincode");
	      String payment=req.getParameter("payment");
	      
	      String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
	      
	     // System.out.println(name+"  "+email+"  "+phone+"  "+fullAdd+"  "+payment);
	         CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
	         List<Cart> clist= dao.getCakeByUser(id);
	         OrderDAOImpl dao1 = new OrderDAOImpl(DBConnect.getConn());
	         int i=dao1.getOrderNo();
	         CakeOrder o=null;
	         List<CakeOrder> orderList = new ArrayList<>();
	         Random r= new Random();
	         for(Cart c:clist) {
	        	 o=new CakeOrder();
	        	 o.setOrderid("CakeOrder-00"+i);
	        	 o.setName(name); 
	        	 o.setEmail(email);
	        	 o.setPhone(phone);
	        	 o.setFulladd(fullAdd);
	        	 o.setCakename(c.getCakename());
	        	 o.setPrice(c.getPrice()+"");
	        	 o.setPayment(payment);
	        	 orderList.add(o);
	        	 i++;
	        	 
	         }
	      
	      if("noselect".equals(payment))
	      {
	        	 session.setAttribute("failedMsg", "Choose Payment Method");
                 resp.sendRedirect("checkout.jsp");
	      }
	      else {
	    	  
	    	  boolean c= dao1.saveOrder(orderList);
	    	  if(c) {
	                 resp.sendRedirect("order_success.jsp");
	    	  }
	    	  else {
	    		  session.setAttribute("failedMsg", "Choose Payment Method");
	                 resp.sendRedirect("checkout.jsp");
	    	  }
	    	  }
      
	      }
	      
	      
	      
	      catch (Exception e) {
	          e.printStackTrace();
	       }

}}
