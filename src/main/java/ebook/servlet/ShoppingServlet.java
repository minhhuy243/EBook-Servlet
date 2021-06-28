package ebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

@WebServlet(name = "shoppingServlet", urlPatterns = {
		UrlConst.SHOPPING_CART,
		UrlConst.SHOPPING_CHECKOUT
})
public class ShoppingServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		switch (path) {
		case UrlConst.SHOPPING_CART:
			req.getRequestDispatcher(JspPathConst.SHOPPING_CART).forward(req, resp);
			break;
			
		case UrlConst.SHOPPING_CHECKOUT:
			req.getRequestDispatcher(JspPathConst.SHOPPING_CHECKOUT).forward(req, resp);
			break;
			
		default:
			break;
		}
	}
}
