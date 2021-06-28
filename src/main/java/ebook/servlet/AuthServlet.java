package ebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

@WebServlet(name = "authServlet", urlPatterns = {
		UrlConst.AUTH_LOGIN,
		UrlConst.AUTH_LOGOUT,
		UrlConst.AUTH_REGISTER
})
public class AuthServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		
		switch (path) {
		case UrlConst.AUTH_LOGIN:
			req.getRequestDispatcher(JspPathConst.AUTH_LOGIN).forward(req, resp);
			break;
			
		case UrlConst.AUTH_REGISTER:
			req.getRequestDispatcher(JspPathConst.AUTH_REGISTER).forward(req, resp);
			break;
			
		default:
			break;
		}
	}
}
