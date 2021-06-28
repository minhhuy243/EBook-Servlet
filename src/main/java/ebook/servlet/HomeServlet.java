package ebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

@WebServlet(name = "homeServlet", urlPatterns = {
		UrlConst.HOME
})
public class HomeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher(JspPathConst.HOME).forward(req, resp);
	}
}
