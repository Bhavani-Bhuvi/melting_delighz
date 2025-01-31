 package com.DAO;

import com.entity.Cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDAOImpl implements CartDAO {
   private Connection conn;

   public CartDAOImpl(Connection conn) {
      this.conn = conn;
   }

   public boolean addCart(Cart ca) {
      boolean f = false;

      try {
         String sql = "insert into cart(ckid,uid,cakename,price,totalprice) values(?,?,?,?,?)";
         PreparedStatement ps = this.conn.prepareStatement(sql);
         ps.setInt(1, ca.getCkid());
         ps.setInt(2, ca.getUid());
         ps.setString(3, ca.getCakename());
         ps.setDouble(4, ca.getPrice());
         ps.setDouble(5, ca.getTotalprice());
         int i = ps.executeUpdate();
         if (i == 1) {
            f = true;
         }
      } catch (Exception e) {
         e.printStackTrace();
      }

      return f;
   }

@Override
public List<Cart> getCakeByUser(int uid) {
    List<Cart> list = new ArrayList<Cart>();

    Cart ca = null;
    double totalprice =0;

    try {
       String sql = "select * from cart where uid=?";
       PreparedStatement ps = conn.prepareStatement(sql);
	ps.setInt(1,uid);
       ResultSet rs = ps.executeQuery();

       while(rs.next()) {
          ca = new Cart();
          ca.setCid(rs.getInt(1));
          ca.setCkid(rs.getInt(2));
          ca.setUid(rs.getInt(3));
          ca.setCakename(rs.getString(4));
          ca.setPrice(rs.getDouble(5));
          totalprice = totalprice+rs.getDouble(6);
          ca.setTotalprice(totalprice);
          list.add(ca);

          
         
       }
    } catch (Exception e) {
       e.printStackTrace();
    }

    return list;
}

@Override
public boolean deletecake(int ckid,int uid,int cid) {

	 boolean f = false;

     try {
        String sql = "delete from cart where ckid=? and uid=? and cid=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, ckid);
        ps.setInt(2, uid);
        ps.setInt(3, cid);


        int i = ps.executeUpdate();
        if (i == 1) {
           f = true;
        }
     } catch (Exception e) {
        e.printStackTrace();
     }

     return f;
}
  



}