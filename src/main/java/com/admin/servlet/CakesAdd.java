package com.admin.servlet;

import com.DAO.CakesDAOImpl;
import com.DB.DBConnect;
import com.entity.CakeDetails;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet({"/add_cakes"})
@MultipartConfig
public class CakesAdd extends HttpServlet {
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         String cakename = req.getParameter("cname");
         String flavour = req.getParameter("flavour");
         String price = req.getParameter("price");
         String status = req.getParameter("status");
         Part part = req.getPart("photo");
         String filename = part.getSubmittedFileName();
         HttpSession session = req.getSession();
         if (cakename == null || cakename.trim().isEmpty() || flavour == null || flavour.trim().isEmpty() || price == null || price.trim().isEmpty() || status == null || status.trim().isEmpty() || part == null || part.getSubmittedFileName().isEmpty()) {
            session.setAttribute("failedMsg", "All fields are mandatory!");
            resp.sendRedirect(req.getContextPath() + "/admin/add_cakes.jsp");
            return;
         }

         long var10000 = System.currentTimeMillis();
         String uniqueFilename = var10000 + "_" + filename;
         CakeDetails c = new CakeDetails(cakename, flavour, price, status, uniqueFilename, "admin");
         CakesDAOImpl dao = new CakesDAOImpl(DBConnect.getConn());
         boolean f = dao.addCakes(c);
         if (f) {
           // String path = "C:\\Users\\Administrator\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Melting_Delightz\\images";
            String path = getServletContext().getRealPath("") +"/images";
            File file = new File(path);
            if (!file.exists()) {
               file.mkdirs();
            }

            part.write(path + File.separator + uniqueFilename);
            session.setAttribute("succMsg", "Cake added successfully.");
         } else {
            session.setAttribute("failedMsg", "Error adding cake to the database.");
         }

         resp.sendRedirect(req.getContextPath() + "/admin/add_cakes.jsp");
      } catch (Exception var16) {
         HttpSession session = req.getSession();
         session.setAttribute("failedMsg", "An unexpected error occurred: " + var16.getMessage());
         resp.sendRedirect(req.getContextPath() + "/admin/add_cakes.jsp");
         var16.printStackTrace();
      }

   }
}
