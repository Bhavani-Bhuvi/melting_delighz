package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.CakeOrder;


public class OrderDAOImpl implements OrderDAO {
	
	   private Connection conn;



	public OrderDAOImpl(Connection conn) {
		super();
		this.conn=conn;
	}
	
	
	@Override
	public int getOrderNo() {
        int i = 1;
try {
	         String sql = "SELECT * FROM cakeorders";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery();

	         while(rs.next()) {
	          
	            i++;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
return i;
	}


	@Override
	public boolean saveOrder(List<CakeOrder> clist) {
boolean f=false;

try {
	String sql = "insert into cakeorders(orderid,username,email,address,phone,cakename,price,payment) values(?,?,?,?,?,?,?,?)";
    conn.setAutoCommit(false);
    PreparedStatement ps = conn.prepareStatement(sql);
    
    for(CakeOrder c:clist) {
    	
    	ps.setString(1, c.getOrderid());
    	ps.setString(2, c.getName());
    	ps.setString(3, c.getEmail());
    	ps.setString(4, c.getFulladd());  // Address correctly assigned
    	ps.setString(5, c.getPhone());    // Phone correctly assigned
    	ps.setString(6, c.getCakename());
    	ps.setString(7, c.getPrice());
    	ps.setString(8, c.getPayment());

           ps.addBatch();
    }
    
  int[] count=ps.executeBatch();
   conn.commit();
    f=true;
    conn.setAutoCommit(true);
} catch (Exception e) {
    e.printStackTrace();
 }

		
		return f;
	}


	@Override
	public List<CakeOrder> getCake(String email) {
		
		List<CakeOrder> list=new ArrayList<CakeOrder>();
		CakeOrder o=null;
		
		 try {
	         String sql = "select * from cakeorders where email=?";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1, email);
	         ResultSet rs = ps.executeQuery();

	         while(rs.next()) {
	            o = new CakeOrder();
	            o.setId(rs.getInt(1));
	            o.setOrderid(rs.getString(2));
	            o.setName(rs.getString(3));
	            o.setEmail(rs.getString(4));
	            o.setFulladd(rs.getString(5));
	            o.setPhone(rs.getString(6));
	            o.setCakename(rs.getString(7));
	            o.setPrice(rs.getString(8));
	            o.setPayment(rs.getString(9));
	           list.add(o);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

		

		return list;

	}


	@Override
	public List<CakeOrder> getAllOrder() {
		List<CakeOrder> list=new ArrayList<CakeOrder>();
		CakeOrder o=null;
		
		 try {
	         String sql = "select * from cakeorders";
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery();

	         while(rs.next()) {
	            o = new CakeOrder();
	            o.setId(rs.getInt(1));
	            o.setOrderid(rs.getString(2));
	            o.setName(rs.getString(3));
	            o.setEmail(rs.getString(4));
	            o.setFulladd(rs.getString(5));
	            o.setPhone(rs.getString(6));
	            o.setCakename(rs.getString(7));
	            o.setPrice(rs.getString(8));
	            o.setPayment(rs.getString(9));
	           list.add(o);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }

		

		return list;
	}

	
	
	
	

}



