package ebook.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import ebook.biz.AuthBiz;
import ebook.model.User;
import ebook.utils.JspPathConst;
import ebook.utils.UrlConst;

@WebServlet(name = "authServlet", urlPatterns = {
		UrlConst.AUTH_LOGIN,
		UrlConst.AUTH_LOGOUT,
		UrlConst.AUTH_REGISTER
})
public class AuthServlet extends HttpServlet{
	
	private AuthBiz biz;
	
	@Override
	public void init() throws ServletException {
		super.init();
		biz = new AuthBiz();
	}
	
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
			
			case UrlConst.AUTH_LOGOUT:
				req.getSession().invalidate();
				resp.sendRedirect(req.getContextPath() + UrlConst.HOME);
			default:
				break;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String path = req.getServletPath();
		Gson gson = new Gson();
		JsonObject data = null;
		String json = null;
		Map<String, String> errors = null;
		PrintWriter out = resp.getWriter();
		resp.setContentType("application/json");
			
		switch (path) {
			case UrlConst.AUTH_LOGIN:
				data = gson.fromJson(req.getReader(), JsonObject.class); // Lấy body từ request xong chuyển qua JSON			
				String email = data.get("email").getAsString();
				String password = data.get("password").getAsString();

				errors = validateLogin(email, password);
				if(errors.isEmpty()) {
					User loggedUser = biz.login(email);
					
					HttpSession session = req.getSession();
					session.setAttribute("email", loggedUser.getEmail());
					session.setAttribute("firstName", loggedUser.getFirstName());
					session.setMaxInactiveInterval(86400);
					
					resp.setStatus(200);
					json = gson.toJson(loggedUser);						
				} else {
					resp.setStatus(400);
					json = gson.toJson(errors);					
				}	
				
				out.write(json);
				out.flush();				
				break;
				
			case UrlConst.AUTH_REGISTER:					
				data = gson.fromJson(req.getReader(), JsonObject.class); // Lấy body từ request xong chuyển qua JSON
				User newUser = gson.fromJson(data, User.class); // Chuyển JSON thành object
											
				errors = validateRegister(newUser);
				if(errors.isEmpty()) {
					biz.register(newUser);			
					resp.setStatus(200);
					json = gson.toJson(newUser);				
				} else {
					resp.setStatus(400);
					json = gson.toJson(errors);								
				}					
				out.write(json);
				out.flush();				
				break;	
				
			default:
				break;
		}
	}
	
	public boolean isBlank(String str) {
        return str == null || str.trim().isEmpty();
    }
	
	public Map<String, String> validateLogin(String email, String password) {
		Map<String, String> errors = new HashMap<>();
		
		if(isBlank(email)) {
			errors.put("email", "Email không được bỏ trống");
		} else if (isBlank(password)) {
			errors.put("password", "Mật khẩu không được bỏ trống");
		} else {
			User takenUser = biz.findByEmail(email);
			if(takenUser == null) {
				errors.put("email", "Email không tồn tại");
			} else {
				if(!BCrypt.checkpw(password, takenUser.getPassword())) {
					errors.put("password", "Mật khẩu không đúng");
				}
			}
		}

		return errors;
	}
	
	public Map<String, String> validateRegister(User user) {
		Map<String, String> errors = new HashMap<>();
		
		if(isBlank(user.getEmail())) {
			errors.put("email", "Email không được bỏ trống");
		} else {
			if(biz.findByEmail(user.getEmail()) != null) {
				errors.put("email", "Email đã tồn tại");
			}
		}
		
		if(isBlank(user.getPassword())) {
			errors.put("password", "Mật khẩu không được bỏ trống");
		}
		
		if(isBlank(user.getLastName())) {
			errors.put("lastName", "Họ không được bỏ trống");
		}
		
		if(isBlank(user.getFirstName())) {
			errors.put("firstName", "Tên không được bỏ trống");
		}
		
		if(isBlank(user.getAddress())) {
			errors.put("address", "Địa chỉ không được bỏ trống");
		}
		
		if(isBlank(user.getPhoneNumber())) {
			errors.put("phoneNumber", "Số điện thoại không được bỏ trống");
		}
		
		return errors;
	}
}
