package com.DAO;

import com.entity.CakeDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CakesDAOImpl implements CakesDAO {
   private Connection conn;

   public CakesDAOImpl(Connection conn) {
      this.conn = conn;
   }

   public boolean addCakes(CakeDetails c) {
      boolean f = false;

      try {
         String sql = "insert into CakeDetails(cakename,flavour,price,status,photo) values(?,?,?,?,?)";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, c.getCakename());
         ps.setString(2, c.getFlavour());
         ps.setString(3, c.getPrice());
         ps.setString(4, c.getStatus());
         ps.setString(5, c.getPhoto());
         int i = ps.executeUpdate();
         if (i == 1) {
            f = true;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return f;
   }

   public List<CakeDetails> getAllCakes() {
      List<CakeDetails> list = new ArrayList<CakeDetails>();
      CakeDetails c = null;

      try {
         String sql = "select * from CakeDetails";
         PreparedStatement ps = conn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery();

         while(rs.next()) {
            c = new CakeDetails();
            c.setCakeId(rs.getInt(1));
            c.setCakename(rs.getString(2));
            c.setFlavour(rs.getString(3));
            c.setPrice(rs.getString(4));
            c.setStatus(rs.getString(5));
            c.setPhoto(rs.getString(6));
            list.add(c);
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return list;
   }

   public CakeDetails getCakeById(int id) {
      CakeDetails c = null;

      try {
         String sql = "select * from CakeDetails where cakeId=?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setInt(1, id);
         ResultSet rs = ps.executeQuery();

         while(rs.next()) {
            c = new CakeDetails();
            c.setCakeId(rs.getInt(1));
            c.setCakename(rs.getString(2));
            c.setFlavour(rs.getString(3));
            c.setPrice(rs.getString(4));
            c.setStatus(rs.getString(5));
            c.setPhoto(rs.getString(6));
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return c;
   }

   public boolean updateEditCakes(CakeDetails c) {
      boolean f = false;

      try {
         String sql = "update CakeDetails set cakename=?,flavour=?,price=?,status=? where cakeId= ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, c.getCakename());
         ps.setString(2, c.getFlavour());
         ps.setString(3, c.getPrice());
         ps.setString(4, c.getStatus());
         ps.setInt(5, c.getCakeId());
         int i = ps.executeUpdate();
         if (i == 1) {
            f = true;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return f;
   }

   public boolean deleteCakes(int id) {
      boolean f = false;

      try {
         String sql = "delete from CakeDetails where cakeId=?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setInt(1, id);
         int i = ps.executeUpdate();
         if (i == 1) {
            f = true;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return f;
   }

   public List<CakeDetails> getEggless() {
      List<CakeDetails> list = new ArrayList<CakeDetails>();
      CakeDetails c = null;

      try {
         String sql = "SELECT * FROM CakeDetails WHERE flavour = ? AND status = ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, "Eggless");
         ps.setString(2, "Active");
         ResultSet rs = ps.executeQuery();
         int i = 1;

         while(rs.next()&& i<=4) {
            c = new CakeDetails();
            c.setCakeId(rs.getInt(1));
            c.setCakename(rs.getString(2));
            c.setFlavour(rs.getString(3));
            c.setPrice(rs.getString(4));
            c.setStatus(rs.getString(5));
            c.setPhoto(rs.getString(6));
            list.add(c);
            i++;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return list;
   }

   public List<CakeDetails> getEgg() {
      List<CakeDetails> list = new ArrayList<CakeDetails>();
      CakeDetails c = null;

      try {
         String sql = "SELECT * FROM CakeDetails WHERE flavour = ? AND status = ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, "Egg");
         ps.setString(2, "Active");
         ResultSet rs = ps.executeQuery();
         int i = 1;

         while(rs.next()&& i<=4) {
            c = new CakeDetails();
            c.setCakeId(rs.getInt(1));
            c.setCakename(rs.getString(2));
            c.setFlavour(rs.getString(3));
            c.setPrice(rs.getString(4));
            c.setStatus(rs.getString(5));
            c.setPhoto(rs.getString(6));
            list.add(c);
            i++;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return list;
   }

   public List<CakeDetails> getFlavour() {
      List<CakeDetails> list = new ArrayList<CakeDetails>();
      CakeDetails c = null;

      try {
         String sql = "SELECT * FROM CakeDetails WHERE status = ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, "Inactive");
         ResultSet rs = ps.executeQuery();
         int i = 1;

         while(rs.next()&& i<=4) {
            c = new CakeDetails();
            c.setCakeId(rs.getInt(1));
            c.setCakename(rs.getString(2));
            c.setFlavour(rs.getString(3));
            c.setPrice(rs.getString(4));
            c.setStatus(rs.getString(5));
            c.setPhoto(rs.getString(6));
            list.add(c);
            i++;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return list;
   }

   public List<CakeDetails> getThemeCakes() {
      List<CakeDetails> list = new ArrayList<CakeDetails>();
      CakeDetails c = null;

      try {
         String sql = "SELECT * FROM CakeDetails WHERE flavour = ? AND status = ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, "Eggless");
         ps.setString(2, "Active");
         ResultSet rs = ps.executeQuery();

         while(rs.next()) {
            c = new CakeDetails();
            c.setCakeId(rs.getInt(1));
            c.setCakename(rs.getString(2));
            c.setFlavour(rs.getString(3));
            c.setPrice(rs.getString(4));
            c.setStatus(rs.getString(5));
            c.setPhoto(rs.getString(6));
            list.add(c);
         }
         
      } catch (Exception e) {
         e.printStackTrace();
      }

   return list;
   }

   public List<CakeDetails> getDessert() {
      List<CakeDetails> list = new ArrayList<CakeDetails>();
      CakeDetails c = null;

      try {
         String sql = "SELECT * FROM CakeDetails WHERE flavour = ? AND status = ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, "Egg");
         ps.setString(2, "Active");
         ResultSet rs = ps.executeQuery();

         while(rs.next()) {
            c = new CakeDetails();
            c.setCakeId(rs.getInt(1));
            c.setCakename(rs.getString(2));
            c.setFlavour(rs.getString(3));
            c.setPrice(rs.getString(4));
            c.setStatus(rs.getString(5));
            c.setPhoto(rs.getString(6));
            list.add(c);
         }
      } catch (Exception e) {
        e.printStackTrace();
      }

      return list;
   }

   public List<CakeDetails> getFlavourCakes() {
      List<CakeDetails> list = new ArrayList<CakeDetails>();
      CakeDetails c = null;

      try {
         String sql = "SELECT * FROM CakeDetails WHERE status = ?";
         PreparedStatement ps = conn.prepareStatement(sql);
         ps.setString(1, "Inactive");
         ResultSet rs = ps.executeQuery();

         while(rs.next()) {
            c = new CakeDetails();
            c.setCakeId(rs.getInt(1));
            c.setCakename(rs.getString(2));
            c.setFlavour(rs.getString(3));
            c.setPrice(rs.getString(4));
            c.setStatus(rs.getString(5));
            c.setPhoto(rs.getString(6));
            list.add(c);
            
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return list;
   }

@Override
public List<CakeDetails> getSearch(String ch) {

	   List<CakeDetails> list = new ArrayList<CakeDetails>();
	      CakeDetails c = null;

	      try {
	         String sql = "SELECT * FROM CakeDetails WHERE cakename like ? or flavour like ? AND status = ?";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1, "%"+ch+"%");
	         ps.setString(2, "%"+ch+"%");
	         ps.setString(3, "%"+ch+"%");

	         ResultSet rs = ps.executeQuery();

	         while(rs.next()) {
	            c = new CakeDetails();
	            c.setCakeId(rs.getInt(1));
	            c.setCakename(rs.getString(2));
	            c.setFlavour(rs.getString(3));
	            c.setPrice(rs.getString(4));
	            c.setStatus(rs.getString(5));
	            c.setPhoto(rs.getString(6));
	            list.add(c);
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

	   return list;
	   }
   
}