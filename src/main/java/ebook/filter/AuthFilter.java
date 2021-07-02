package ebook.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ebook.utils.UrlConst;

@WebFilter(urlPatterns = "/*")
public class AuthFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		String email = (String) req.getSession().getAttribute("email");
		String path = req.getServletPath();		
		
		if(email != null) {
			if(path.equals(UrlConst.AUTH_LOGIN) || path.equals(UrlConst.AUTH_REGISTER)) {
				resp.sendRedirect(req.getContextPath() + UrlConst.HOME);
			} else {
				chain.doFilter(request, response);
			}
		} else {
			if(path.equals(UrlConst.SHOPPING_CHECKOUT)) {
				resp.sendRedirect(req.getContextPath() + UrlConst.AUTH_LOGIN);
			} else {
				chain.doFilter(request, response);
			}
		}		
	}
	
}
