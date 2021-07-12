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
import ebook.model.Category;
import ebook.model.Product;
import ebook.model.PublishingCompany;
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
				String filter = req.getParameter("filter");
				String view = null;
				int totalPage = -1;

				List<Product> productList = new LinkedList<>();
				List<Category> categoryList = biz.findAllCategory();
				List<PublishingCompany> publishingCompanyList = biz.findAllPublishing();

				if(search != null ) {
					totalPage = (int) Math.round((double)biz.countByName(search) / 9);
					view = "search=" + search + "&";
					if(currentPage == null || Integer.parseInt(currentPage) == 1) {
						currentPage = "1";
						productList = biz.findByName(search, 0, 9);
					} else {
						productList = biz.findByName(search, (Integer.parseInt(currentPage) - 1) * 9, 9);
					}
				} else if(filter != null){
					totalPage = (int) Math.round((double)biz.countByCategoryOrPublishing(filter) / 9);
					view = "filter=" + filter + "&";
					if(currentPage == null || Integer.parseInt(currentPage) == 1) {
						currentPage = "1";
						productList = biz.findByCategoryOrPublishing(filter, 0, 9);
					} else {
						productList = biz.findByCategoryOrPublishing(filter, (Integer.parseInt(currentPage) - 1) * 9, 9);
					}
				} else {
					totalPage = (int) Math.round((double)biz.countAll() / 9);
					if(currentPage == null || Integer.parseInt(currentPage) == 1) {
						currentPage = "1";
						productList = biz.findAll(0, 9);
					} else {
						productList = biz.findAll((Integer.parseInt(currentPage) - 1) * 9, 9);
					}
				}

				req.setAttribute("currentPage", currentPage);
				req.setAttribute("totalPage", totalPage);
				req.setAttribute("view", view);
				req.setAttribute("productList", productList);
				req.setAttribute("categoryList", categoryList);
				req.setAttribute("publishingCompanyList", publishingCompanyList);
				req.getRequestDispatcher(JspPathConst.PRODUCT_LIST).forward(req, resp);
				break;

			case UrlConst.PRODUCT_DETAIL:
				int id = Integer.parseInt(req.getParameter("id").toString());
				Product product = biz.findById(id);
				if(product != null) {
					req.setAttribute("product", product);
				}
				req.getRequestDispatcher(JspPathConst.PRODUCT_DETAIL).forward(req, resp);
				break;
			default:
				break;
			}
	}
}
