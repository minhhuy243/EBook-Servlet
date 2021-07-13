package ebook.filter;

import ebook.biz.ProductBiz;
import ebook.dao.CategoryDao;
import ebook.model.Category;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebFilter(urlPatterns = "/*")
public class CategoryFilter implements Filter {

    private ProductBiz biz;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        biz = new ProductBiz();
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        List<Category> categoryList = biz.findAllCategory();
        req.setAttribute("categoryList", categoryList);
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
