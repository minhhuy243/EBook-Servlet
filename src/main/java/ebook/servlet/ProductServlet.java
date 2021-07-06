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
import ebook.model.Product;
import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

@WebServlet(name = "productServlet", urlPatterns = {
		UrlConst.PRODUCT_LIST,
		UrlConst.PRODUCT_DETAIL
})
public class ProductServlet extends HttpServlet{

	private ProductBiz biz;

	@Override
	public void init() throws ServletException {
		super.init();
		biz = new ProductBiz();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();

		switch (path) {
			case UrlConst.PRODUCT_LIST:
				String currentPage = req.getParameter("page");
				String search = req.getParameter("search");
				int totalPage = -1;

				List<Product> productList = new LinkedList<>();

				if(search != null ) {

				} else {
					totalPage = Math.round(biz.countAll() / 9);
					if(currentPage == null || Integer.parseInt(currentPage) == 1) {
						currentPage = "1";
						productList = biz.findForPagination(0, 9);
					} else {
						productList = biz.findForPagination((Integer.parseInt(currentPage) - 1) * 9, 9);
					}
				}

				req.setAttribute("currentPage", currentPage);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("productList", productList);
				req.getRequestDispatcher(JspPathConst.PRODUCT_LIST).forward(req, resp);
				break;

			case UrlConst.PRODUCT_DETAIL:
				req.getRequestDispatcher(JspPathConst.PRODUCT_DETAIL).forward(req, resp);
				break;
			case UrlConst.PRODUCT_LIST + "/*":
				req.getRequestDispatcher(JspPathConst.PRODUCT_DETAIL).forward(req, resp);
				break;
			default:
				break;
			}
	}
}
