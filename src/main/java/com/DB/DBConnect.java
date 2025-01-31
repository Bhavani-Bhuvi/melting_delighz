package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
   private static Connection conn;

   public static Connection getConn() {
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Melting_Delightz", "root", "Yohit@18");
      } catch (Exception var1) {
      }

      return conn;
   }
}