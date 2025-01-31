package com.DAO;

import com.entity.CakeDetails;
import java.util.List;

public interface CakesDAO {
	public boolean addCakes(CakeDetails var1);

	public List<CakeDetails> getAllCakes();

	public CakeDetails getCakeById(int var1);

	public boolean updateEditCakes(CakeDetails var1);

	public boolean deleteCakes(int var1);

	public List<CakeDetails> getEggless();

	public List<CakeDetails> getEgg();

	public List<CakeDetails> getFlavour();

	public List<CakeDetails> getThemeCakes();

	public List<CakeDetails> getDessert();

	public List<CakeDetails> getFlavourCakes();
   
   public List<CakeDetails> getSearch(String ch);

}
