package com.DAO;

import java.util.List;

import com.entity.Cart;

public interface CartDAO {
 public  boolean addCart(Cart ca);
 public List<Cart> getCakeByUser(int userid);
 public boolean deletecake(int ckid,int uid,int cid);
}