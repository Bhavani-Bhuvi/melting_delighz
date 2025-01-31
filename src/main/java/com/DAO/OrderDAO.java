package com.DAO;

import java.util.List;

import com.entity.CakeOrder;

public interface OrderDAO {
	
	public int getOrderNo();
	

	public boolean saveOrder(List<CakeOrder> c);
	
	public List<CakeOrder> getCake(String email);


	public List<CakeOrder> getAllOrder();



}
