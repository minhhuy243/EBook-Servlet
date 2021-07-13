package ebook.biz;

import org.mindrot.jbcrypt.BCrypt;

import ebook.dao.UserDao;
import ebook.model.User;

public class AuthBiz {
	private UserDao dao;
	
	public AuthBiz() {
		this.dao = new UserDao();
	}
	
	public User findByEmail(String email) {
		return dao.findByEmail(email);
	}
	
	public User login(String email) {
		User loggedUser = dao.findByEmail(email);
		loggedUser.setPassword("");
		
		return loggedUser;
	}
	
	public int register(User user) {
		user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt(10)));
		return dao.add(user);
	}

}
