package com.gdu.prd.service;

import org.springframework.ui.Model;

import com.gdu.prd.domain.ProductDTO;

public interface ProductService {
	public void loadProductList(Model model);
	//public int addProduct(ProductDTO productDTO);
	public int addProduct(String prodName, int prodPrice);	// 매개변수가 다른 메소드는 이름이 같아도 동시에 만들수 있다.
	public void loadProduct(int prodNo, Model model);
}
