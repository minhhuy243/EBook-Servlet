package ebook.servlet;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ebook.biz.ProductBiz;
import ebook.dao.ProductDao;
import ebook.model.Product;
import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

@WebServlet(name = "homeServlet", urlPatterns = {
		UrlConst.HOME
})
public class HomeServlet extends HttpServlet{

	private ProductBiz biz;

	@Override
	public void init() throws ServletException {
		biz = new ProductBiz();
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Product> productList = new LinkedList<>();
		productList = biz.findTop10();
		req.setAttribute("productList", productList);
		req.getRequestDispatcher(JspPathConst.HOME).forward(req, resp);
	}
}
