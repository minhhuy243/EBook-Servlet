package ebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

@WebServlet(name = "productServlet", urlPatterns = {
		UrlConst.PRODUCT_LIST,
		UrlConst.PRODUCT_DETAIL
})
public class ProductServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		switch (path) {
		case UrlConst.PRODUCT_LIST:
			req.getRequestDispatcher(JspPathConst.PRODUCT_LIST).forward(req, resp);
			break;
			
		case UrlConst.PRODUCT_DETAIL:
			req.getRequestDispatcher(JspPathConst.PRODUCT_DETAIL).forward(req, resp);
			break;
			
		default:
			break;
		}
	}
}
